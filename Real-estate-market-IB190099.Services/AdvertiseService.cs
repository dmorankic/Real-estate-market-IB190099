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

                    User? user = Context.Users.Include(x=>x.Ratings).FirstOrDefault(x=>x.Id==userId);
                
                    if (user == null)
                    {
                        throw new UserException("wrong user id");
                    }

        
                   List<Rating> tmpData = Context.Ratings.ToList();

                    List<PropertyRating> data=new List<PropertyRating>();

                    foreach (var item in tmpData)
                    {
                        data.Add(new PropertyRating { userId = (uint)item.UserId, propertyId = (uint)item.PropertyId, Label = (float)item.Rating1 });
                    }

                    IDataView dataView = mlContext.Data.LoadFromEnumerable<PropertyRating>(data);
                    
                    model = BuildAndTrainModel(mlContext, dataView);
                }
            }




            var allProps = Context.Properties.ToList();
            var allRatings = Context.Ratings.Include(x=>x.Property).ToList();

            List<Property> propsToRemove = new List<Property>();

            allRatings.ForEach(rating =>
            {
                allProps.ForEach(prop =>
                {
                    if(rating.UserId==userId && rating.PropertyId == prop.Id)
                    {
                        propsToRemove.Add(prop);
                    }
                });
            });

            propsToRemove.ForEach(property => { allProps.Remove(property); });

            List<Property> allPropsExtended=new List<Property>();

            for (int i = 0; i < 10000; i++)
            {
                allPropsExtended.AddRange(allProps);
            }



            var predictionResult = new List<Tuple<Property, float>>();

            foreach (var item in allPropsExtended)
            {
                //var predictionEngine = mlContext.Model.CreatePredictionEngine<PropertyRating, Model.PropertyRatingPrediction>(model);

                //var prediction = predictionEngine.Predict(new PropertyRating()
                //{
                //    propertyId = (uint)item.Id,
                //    userId = (uint)userId
                //});
                
                var prediction= UseModelForSinglePrediction(mlContext, model, item.Id, userId);

                predictionResult.Add(new Tuple<Property, float>(item, prediction.Score));
            }
            var finalResult = predictionResult.OrderByDescending(x => x.Item2)
                .Select(x => x.Item1).Distinct().Take(5).ToList();


            return Mapper.Map< List<PropertyOutput>>(finalResult);
        }


        ITransformer BuildAndTrainModel(MLContext mlContext, IDataView trainingDataView)
        {
            IEstimator<ITransformer> estimator = mlContext.Transforms.Conversion
                .MapValueToKey(outputColumnName: "userIdEncoded", inputColumnName: "userId")
            .Append(mlContext.Transforms.Conversion.MapValueToKey(outputColumnName: "propertyIdEncoded", inputColumnName: "propertyId"));
            
            



            var options = new MatrixFactorizationTrainer.Options
            {
                MatrixColumnIndexColumnName = "userIdEncoded",
                MatrixRowIndexColumnName = "propertyIdEncoded",
                LabelColumnName = "Label",
                NumberOfIterations = 20,
                ApproximationRank = 100
            };

            var trainerEstimator = estimator.Append(mlContext.Recommendation().Trainers.MatrixFactorization(options));
            
            ITransformer model = trainerEstimator.Fit(trainingDataView);

            return model;
        }

        PropertyRatingPrediction UseModelForSinglePrediction(MLContext mlContext, ITransformer model,int propertyId, int userId)
        {
            var predictionEngine = mlContext.Model.CreatePredictionEngine<PropertyRating, Model.PropertyRatingPrediction>(model);
            var prediction = predictionEngine.Predict(new PropertyRating()
            {
                propertyId = (uint)propertyId,
                userId = (uint)userId
            });
            return prediction;
        }
    }
}
