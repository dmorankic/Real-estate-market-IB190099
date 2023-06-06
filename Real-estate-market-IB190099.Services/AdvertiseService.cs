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
using Microsoft.EntityFrameworkCore.Metadata;
using Microsoft.EntityFrameworkCore;

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

        //public List<int> Recommend(int id)
        //{
        //    var mlContext = new MLContext();
        //    var dbData = Context.Ratings.ToList();
        //    var data =_mapper.Map<List<RatingMLModel>>(dbData);

        //    var allPropertyIds = Context.Properties.Select(x => x.Id).Distinct().ToList();
        //    var allUserIds = Context.Ratings.Select(x => x.UserId).Distinct().ToList();

        //    var dataView = mlContext.Data.LoadFromEnumerable(data);

        //    {
        //        //var propertyIdPipeline = mlContext.Transforms.Conversion.MapKeyToValue("PropertyIdEncoded");
        //        //var userIdPipeline = mlContext.Transforms.Conversion.MapKeyToValue("UserIdEncoded");
        //        //var pipeline = propertyIdPipeline.Append(userIdPipeline);
        //        //
        //        //var transformedDataView = pipeline.Fit(dataView).Transform(dataView);
        //    }

        //    //var pipeline = mlContext.Transforms.Conversion.MapValueToKey("PropertyId")
        //    //    .Append(mlContext.Transforms.Conversion.MapValueToKey("UserId"))
        //    //    .Append(mlContext.Transforms.Conversion.MapValueToKey("Rating"))
        //    //    .Append(mlContext.Transforms.Conversion.MapKeyToValue("PropertyId"))
        //    //    .Append(mlContext.Transforms.Conversion.MapKeyToValue("UserId"))
        //    //    .Append(mlContext.Transforms.Conversion.MapKeyToValue("Rating"));
        //    //    //.Append(mlContext.Transforms.Conversion.MapValueToKey("PropertyId"))
        //    //    //.Append(mlContext.Transforms.Conversion.MapValueToKey("UserId"));


        //    //var transformedDataView = pipeline.Fit(dataView).Transform(dataView);

        //    var split = mlContext.Data.TrainTestSplit(dataView, testFraction: 0.2);

        //    {
        //        //var options = new MatrixFactorizationTrainer.Options
        //        //{
        //        //    MatrixColumnIndexColumnName = "PropertyId",
        //        //    MatrixRowIndexColumnName = "UserId",
        //        //    LabelColumnName = "Rating",
        //        //    NumberOfIterations = 20,
        //        //    ApproximationRank = 100
        //        //};

        //        //var trainer = mlContext.Recommendation().Trainers.MatrixFactorization(options);
        //        //var model = trainer.Fit(transformedData);
        //    }
        //    ITransformer model = BuildAndTrainModel(mlContext, split.TrainSet);

        //    EvaluateModel(mlContext, split.TestSet, model);
        //    return UseModelForSinglePrediction(mlContext, model,id);

        //    {
        //        //var predictionEngine = mlContext.Model.CreatePredictionEngine<RatingMLModel, PropertyPrediction>(model);

        //        //var userId = id; // User for whom we want to make recommendations
        //        //var propertiesToScore =_mapper.Map<List<RatingMLModel>>(Context.Ratings.ToList());

        //        //var scores = propertiesToScore.Select(property => predictionEngine.Predict(property));

        //        //var recommendations = propertiesToScore.Zip(scores, (property, score) => new PredictionResult
        //        //{
        //        //    PropertyId = property.PropertyId,
        //        //    Score = score.Score
        //        //}).OrderByDescending(p => p.Score).ToList();
        //    }

        //    //return new List<PredictionResult>();
        //}
        static object isLocked = new object();
        static MLContext mlContext = null;
        static ITransformer model = null;

        public List<PropertyOutput> Recommend(int propertyId,int userId)
        {
            lock (isLocked)
            {
                if (mlContext == null)
                {
                    mlContext = new MLContext();

                    var user = Context.Users.Include(x=>x.Ratings).FirstOrDefault(x=>x.Id==userId);
                  
                    if (user == null)
                    {
                        throw new UserException("wrong user id");
                    }

        
                    IEnumerable<Rating> tmpData = user.Ratings.ToList();
          
                    var data=new List<ProductEntry>();

                    foreach (var item in tmpData)
                    {
                       foreach (var secondItem in tmpData) 
                        { 
                            if(secondItem.PropertyId!=item.PropertyId)
                            {
                                data.Add(new ProductEntry
                                {
                                    ProductID = (uint)item.PropertyId,
                                    CoPurchaseProductID = (uint)secondItem.PropertyId,

                                });
                            }
                        }
                    }



                 

                    var dataView = mlContext.Data.LoadFromEnumerable(data);

                    MatrixFactorizationTrainer.Options options = new MatrixFactorizationTrainer.Options();
                    options.MatrixColumnIndexColumnName = nameof(ProductEntry.ProductID);
                    options.MatrixRowIndexColumnName = nameof(ProductEntry.CoPurchaseProductID);
                    options.LabelColumnName = "Label";
                    options.LossFunction = MatrixFactorizationTrainer.LossFunctionType.SquareLossOneClass;
                    options.Alpha = 0.01;
                    options.Lambda = 0.025;
                    // For better results use the following parameters
                    options.NumberOfIterations = 100;
                    options.C = 0.00001;



                    var trainer = mlContext.Recommendation().Trainers.MatrixFactorization(options);
                    model = trainer.Fit(dataView);
                }

            }



            //var properties = Context.Properties.ToList();
            //var ratings=Context.Ratings.ToList();
            //List<Property> propsToRemove=new List<Property>();    
            //ratings.ForEach(rating => {
            //    properties.ForEach(property =>
            //    {
            //        if(rating.PropertyId==property.Id && rating.UserId==id)
            //        {
            //            propsToRemove.Add(property);
            //        }
            //    });
            //});

            //propsToRemove.ForEach(property => { properties.Remove(property); });


            List<Property> allItems = new List<Property>();

            for (int i = 0; i < 1000; i++)
            {
                var tmp = Context.Properties.Where(x => x.Id != propertyId);
                allItems.AddRange(tmp);
            }

           

            var predictionResult = new List<Tuple<Property, float>>();

            foreach (var item in allItems)
            {
                var predictionEngine = mlContext.Model.CreatePredictionEngine<ProductEntry, Copurchase_prediction>(model);

                var prediction = predictionEngine.Predict(new ProductEntry()
                {
                    ProductID = (uint)propertyId,
                    CoPurchaseProductID = (uint)item.Id
                });

                predictionResult.Add(new Tuple<Property, float>(item, prediction.Score));
            }
            var finalResult = predictionResult.OrderByDescending(x => x.Item2)
                .Select(x => x.Item1).Distinct().Take(5).ToList();


            return Mapper.Map< List<PropertyOutput>>(finalResult);
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
            IEstimator<ITransformer> estimator = mlContext.Transforms.Conversion
                .MapValueToKey(outputColumnName: "UserIdEncoded", inputColumnName: "UserId")
            .Append(mlContext.Transforms.Conversion.MapValueToKey(outputColumnName: "PropertyIdEncoded", inputColumnName: "PropertyId"));

            var options = new MatrixFactorizationTrainer.Options
            {
                MatrixColumnIndexColumnName = "UserIdEncoded",
                MatrixRowIndexColumnName = "PropertyIdEncoded",
                LabelColumnName = "Rating1",
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

        List<int> UseModelForSinglePrediction(MLContext mlContext, ITransformer model,int userId)
        {

            Console.WriteLine("=============== Making a prediction ===============");
            var predictionEngine = mlContext.Model.CreatePredictionEngine<RatingMLModel, PredictionResult>(model);

            var unratedProperties = GetAllUnratedProperties(userId);

            var recommendedSorted = new List<int>();
            foreach (var propertyId in unratedProperties)
            {
                var testInput = new RatingMLModel { PropertyId = (uint)propertyId, CorrelatedPropertyId = (uint)userId };

                var propertyRatingPrediction = predictionEngine.Predict(testInput);
                recommendedSorted.Add(propertyId);

                if (float.IsNaN(propertyRatingPrediction.Score))
                {
                    Console.WriteLine("Cannot predict the rating for Property " + propertyId);
                    //Console.WriteLine(propertyRatingPrediction.Rating);

                }
                else
                {
                    Console.WriteLine("Rating prediction for Property " + propertyId + " is: " + propertyRatingPrediction.Score);

                    if (propertyRatingPrediction.Score > 3.5)
                    {
                        Console.WriteLine("Property " + propertyId + " is recommended for user " + userId);
                    }
                    else
                    {
                        Console.WriteLine("Property " + propertyId + " is not recommended for user " + userId);
                    }
                }
            }
            return recommendedSorted;
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


        public class Copurchase_prediction
        {
            public float Score { get; set; }
        }

        public class ProductEntry
        {
            [KeyType(count: 13)]
            public uint ProductID { get; set; }

            [KeyType(count: 13)]
            public uint CoPurchaseProductID { get; set; }

            public float Label { get; set; }
        }
    }
}
