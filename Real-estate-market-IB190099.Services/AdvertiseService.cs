using AutoMapper;
using Microsoft.ML;
using Microsoft.ML.Trainers;
using Microsoft.ML.Data;
using Real_estate_market_IB190099.Model;
using Real_estate_market_IB190099.Model.Requests;
using Real_estate_market_IB190099.Model.SearchObjects;
using Real_estate_market_IB190099.Services.Database;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Real_estate_market_IB190099.Model.ms;
using System.Runtime.CompilerServices;
using System.Data;

namespace Real_estate_market_IB190099.Services
{
    public class AdvertiseService : BaseCRUDService<Advertise, Advertise, BaseSearchObject, AdvertiseInsertRequest, AdvertiseInsertRequest>
        , IAdvertiseService
    {
        IMapper _mapper;
        public AdvertiseService(Ib190099Context Context, IMapper Mapper) : base(Context, Mapper)
        {
            _mapper = Mapper;
        }

        public List<PredictionResult> Recommend(int id)
        {
            var mlContext = new MLContext();
            var dbData = Context.Ratings.ToList();
            var data =_mapper.Map<List<RatingMLModel>>(dbData);

            var allPropertyIds = Context.Properties.Select(x => x.Id).Distinct().ToList();
            var allUserIds = Context.Ratings.Select(x => x.UserId).Distinct().ToList();

            var dataView = mlContext.Data.LoadFromEnumerable(data);

            {
                //var propertyIdPipeline = mlContext.Transforms.Conversion.MapKeyToValue("PropertyIdEncoded");
                //var userIdPipeline = mlContext.Transforms.Conversion.MapKeyToValue("UserIdEncoded");
                //var pipeline = propertyIdPipeline.Append(userIdPipeline);
                //
                //var transformedDataView = pipeline.Fit(dataView).Transform(dataView);
            }

            var pipeline = mlContext.Transforms.Conversion.MapValueToKey("PropertyId")
                .Append(mlContext.Transforms.Conversion.MapValueToKey("UserId"))
                .Append(mlContext.Transforms.Conversion.MapValueToKey("Rating"))
                .Append(mlContext.Transforms.Conversion.MapKeyToValue("PropertyId"))
                .Append(mlContext.Transforms.Conversion.MapKeyToValue("UserId"))
                .Append(mlContext.Transforms.Conversion.MapKeyToValue("Rating"));
                //.Append(mlContext.Transforms.Conversion.MapValueToKey("PropertyId"))
                //.Append(mlContext.Transforms.Conversion.MapValueToKey("UserId"));


            var transformedDataView = pipeline.Fit(dataView).Transform(dataView);

            var split = mlContext.Data.TrainTestSplit(transformedDataView, testFraction: 0.2);

            {
                //var options = new MatrixFactorizationTrainer.Options
                //{
                //    MatrixColumnIndexColumnName = "PropertyId",
                //    MatrixRowIndexColumnName = "UserId",
                //    LabelColumnName = "Rating",
                //    NumberOfIterations = 20,
                //    ApproximationRank = 100
                //};

                //var trainer = mlContext.Recommendation().Trainers.MatrixFactorization(options);
                //var model = trainer.Fit(transformedData);
            }
            ITransformer model = BuildAndTrainModel(mlContext, split.TrainSet);

            EvaluateModel(mlContext, split.TestSet, model);
            UseModelForSinglePrediction(mlContext, model,id);

            {
                //var predictionEngine = mlContext.Model.CreatePredictionEngine<RatingMLModel, PropertyPrediction>(model);

                //var userId = id; // User for whom we want to make recommendations
                //var propertiesToScore =_mapper.Map<List<RatingMLModel>>(Context.Ratings.ToList());

                //var scores = propertiesToScore.Select(property => predictionEngine.Predict(property));

                //var recommendations = propertiesToScore.Zip(scores, (property, score) => new PredictionResult
                //{
                //    PropertyId = property.PropertyId,
                //    Score = score.Score
                //}).OrderByDescending(p => p.Score).ToList();
            }

            return new List<PredictionResult>();
        }

        public List<PropertyRatingPrediction> RecommendMS()
        {
            MLContext mlContext = new MLContext();
            (IDataView trainingDataView, IDataView testDataView) = LoadData(mlContext);
            ITransformer model = BuildAndTrainModel(mlContext, trainingDataView);
            EvaluateModel(mlContext, testDataView, model);
            //UseModelForSinglePrediction(mlContext, model);

            return new List<PropertyRatingPrediction>();
        }

        (IDataView training, IDataView test) LoadData(MLContext mlContext)
        {
            var trainingDataPath = Path.Combine(Environment.CurrentDirectory, "Data", "recommendation-ratings-train.csv");
            var testDataPath = Path.Combine(Environment.CurrentDirectory, "Data", "recommendation-ratings-test.csv");

            IDataView trainingDataView = mlContext.Data.LoadFromTextFile<PropertyRating>(trainingDataPath, hasHeader: true, separatorChar: ',');
            IDataView testDataView = mlContext.Data.LoadFromTextFile<PropertyRating>(testDataPath, hasHeader: true, separatorChar: ',');

           
            return (trainingDataView, testDataView);
        }

        ITransformer BuildAndTrainModel(MLContext mlContext, IDataView trainingDataView)
        {
            IEstimator<ITransformer> estimator = mlContext.Transforms.Conversion.MapValueToKey(outputColumnName: "UserIdEncoded", inputColumnName: "UserId")
            .Append(mlContext.Transforms.Conversion.MapValueToKey(outputColumnName: "PropertyIdEncoded", inputColumnName: "PropertyId"));

            var options = new MatrixFactorizationTrainer.Options
            {
                MatrixColumnIndexColumnName = "UserIdEncoded",
                MatrixRowIndexColumnName = "PropertyIdEncoded",
                LabelColumnName = "Rating",
                NumberOfIterations = 20,
                ApproximationRank = 100
            };

            var trainerEstimator = estimator.Append(mlContext.Recommendation().Trainers.MatrixFactorization(options));

            Console.WriteLine("=============== Training the model ===============");
            ITransformer model = trainerEstimator.Fit(trainingDataView);

            return model;
        }

        void EvaluateModel(MLContext mlContext, IDataView testDataView, ITransformer model)
        {
            Console.WriteLine("=============== Evaluating the model ===============");
            var prediction = model.Transform(testDataView);
            var metrics = mlContext.Regression.Evaluate(prediction, labelColumnName: "Rating", scoreColumnName: "Score");

            Console.WriteLine("Root Mean Squared Error : " + metrics.RootMeanSquaredError.ToString());
            Console.WriteLine("RSquared: " + metrics.RSquared.ToString());
        }

        void UseModelForSinglePrediction(MLContext mlContext, ITransformer model,int userId)
        {

            Console.WriteLine("=============== Making a prediction ===============");
            var predictionEngine = mlContext.Model.CreatePredictionEngine<RatingMLModel, PredictionResult>(model);

            var unratedProperties = GetAllUnratedProperties(userId);


            foreach (var propertyId in unratedProperties)
            {
                var testInput = new RatingMLModel { PropertyId = (uint)propertyId, UserId = (uint)userId };

                var propertyRatingPrediction = predictionEngine.Predict(testInput);

                if (float.IsNaN(propertyRatingPrediction.Score))
                {
                    Console.WriteLine("Cannot predict the rating for Property " + propertyId);
                }
                else
                {
                    Console.WriteLine("Rating prediction for Property " + propertyId + " is: " + propertyRatingPrediction.Score);

                    if (Math.Round(propertyRatingPrediction.Score, 1) > 3.5)
                    {
                        Console.WriteLine("Property " + propertyId + " is recommended for user " + userId);
                    }
                    else
                    {
                        Console.WriteLine("Property " + propertyId + " is not recommended for user " + userId);
                    }
                }
            }

            //var testInput=new RatingMLModel { PropertyId= 2,UserId=22 };


            //var propertyRatingPrediction = predictionEngine.Predict(testInput);
            //Console.WriteLine("PROPERTY SCORE IS : " + propertyRatingPrediction.Score);
            //if (Math.Round(propertyRatingPrediction.Score, 1) > 3.5)
            //{
            //    Console.WriteLine("Property " + testInput.PropertyId + " is recommended for user ");
            //}
            //else
            //{
            //    Console.WriteLine("Property " + testInput.PropertyId + " is not recommended for user ");
            //}
        }

        List<int> GetAllUnratedProperties(int userId)
        {
            var ratedPropertyIds = Context.Ratings.Where(x => x.UserId == userId).Select(x => x.PropertyId).ToList();

            // Replace this with your logic to get all property IDs that the user has not rated
            var allPropertyIds = Context.Properties.Select(x => x.Id).Distinct().ToList();

            var unratedPropertyIds = allPropertyIds.Except(ratedPropertyIds).ToList();

            return unratedPropertyIds;
        }
    }
}
