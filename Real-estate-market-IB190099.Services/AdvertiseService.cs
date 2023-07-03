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
    public class AdvertiseService : BaseCRUDService<Advertise, AdvertiseModel, AdvertiseSearchObject, AdvertiseInsertRequest, AdvertiseInsertRequest>
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

        public override IQueryable<Advertise> AddFilter(IQueryable<Advertise> query, AdvertiseSearchObject search = null)
        {
            var filteredQuery = base.AddFilter(query, search);

            if (!string.IsNullOrWhiteSpace(search?.Type))
            {
                filteredQuery = filteredQuery.Where(x => x.Type == search.Type);
            }
            if (!string.IsNullOrWhiteSpace(search?.PropertyName))
            {
                filteredQuery = filteredQuery.Where(x => x!.Property.Name.Contains(search.PropertyName));
            }

            return filteredQuery;
        }
        static object isLocked = new object();
        static MLContext mlContext = null;
        static ITransformer model = null;

        public List<PropertyOutput> Recommend(int userId)
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
                        item.Rating1 = (int)item.Rating1;
                        data.Add(new PropertyRating { userId = (uint)item.UserId, propertyId = (uint)item.PropertyId, Label =(float)item.Rating1 });
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

            for (int i = 0; i < 1000; i++)
            {
                allPropsExtended.AddRange(allProps);
            }



            var predictionResult = new List<Tuple<Property, float>>();

            foreach (var item in allPropsExtended)
            {
                
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

            //var trans = estimator.Fit(trainingDataView).Transform(trainingDataView);



            var options = new MatrixFactorizationTrainer.Options
            {
                MatrixColumnIndexColumnName = "userIdEncoded",
                MatrixRowIndexColumnName = "propertyIdEncoded",
                LabelColumnName = "Label",
                NumberOfIterations = 100,
                ApproximationRank = 100,
                C = 0.00001,
                Lambda = 0.025,
                Alpha = 0.01,
                LossFunction = MatrixFactorizationTrainer.LossFunctionType.SquareLossOneClass,

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

        public override IQueryable<Advertise> AddInclude(IQueryable<Advertise> query, AdvertiseSearchObject search = null)
        {
            query = query.Include(x => x.Property);
            return base.AddInclude(query, search);
        }
        
        public override AdvertiseModel GetById(int id)
        {

            var advertise = Context.Advertises.Include(x=>x.Property).FirstOrDefault(x=>x.Id==id);
            if(advertise== null)
            {
                throw new UserException("User with that Id does not exist");
            }
            return Mapper.Map<AdvertiseModel>(advertise);
        }
        public SavedAdvertiseInsertRequest SaveAdvertise(SavedAdvertiseInsertRequest insert)
        {
            var insertReq = Mapper.Map<SavedAdvertise>(insert);
            var advertises = Context.SavedAdvertises.ToList();
            advertises.ForEach(x =>
            {
                if (x.AdvertiseId == insert.AdvertiseId && x.UserId == insert.UserId) { throw new UserException("You already saved this advertise"); }
            });
            Context.SavedAdvertises.Add(insertReq);
            Context.SaveChanges();
            return insert;
        }


        public SavedAdvertiseInsertRequest RemoveFromSaved(SavedAdvertiseInsertRequest insert)
        {
            var advertises = Context.SavedAdvertises.ToList();
            bool found=false;
            advertises.ForEach(x =>
            {
                if (x.AdvertiseId == insert.AdvertiseId && x.UserId == insert.UserId) { Context.SavedAdvertises.Remove(x); found = true; }
            });
            if (found == false) { throw new UserException("Given advertise is not saved by this user"); }
            Context.SaveChanges();
            return insert;
        }


        public IEnumerable<AdvertiseModel> GetSavedAdvertises(int userId)
        {
           var advertises=Context.SavedAdvertises.Include(x=>x.Advertise).Include(x=>x.Advertise.Property).Where(x=>x.UserId== userId).ToList();
           List<AdvertiseModel> mappedAdvertises=new List<AdvertiseModel>();
            advertises.ForEach(x =>
            {
                var advertise=Mapper.Map<AdvertiseModel>(x.Advertise);
                mappedAdvertises.Add(advertise);
            });
            return mappedAdvertises;
        }
    }
}
