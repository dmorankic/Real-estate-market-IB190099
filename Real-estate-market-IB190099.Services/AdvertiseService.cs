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
            var data =_mapper.Map<List<RatingMLModel>>(Context.Ratings.ToList());

            var mlContext = new MLContext();

            var dataView = mlContext.Data.LoadFromEnumerable(data);

            var pipeline = mlContext.Transforms.Conversion.MapValueToKey("PropertyId")
                .Append(mlContext.Transforms.Conversion.MapValueToKey("UserId"))
                .Append(mlContext.Transforms.Conversion.MapValueToKey("Rating"))
                .Append(mlContext.Transforms.Conversion.MapKeyToValue("PropertyId"))
                .Append(mlContext.Transforms.Conversion.MapKeyToValue("UserId"))
                .Append(mlContext.Transforms.Conversion.MapKeyToValue("Rating"))
                .Append(mlContext.Transforms.Conversion.MapValueToKey("PropertyId"))
                .Append(mlContext.Transforms.Conversion.MapValueToKey("UserId"));


            var transformedData = pipeline.Fit(dataView).Transform(dataView);


            var options = new MatrixFactorizationTrainer.Options
            {
                MatrixColumnIndexColumnName = "PropertyId",
                MatrixRowIndexColumnName = "UserId",
                LabelColumnName = "Rating",
                NumberOfIterations = 20,
                ApproximationRank = 100
            };

            var trainer = mlContext.Recommendation().Trainers.MatrixFactorization(options);
            var model = trainer.Fit(transformedData);


            var predictionEngine = mlContext.Model.CreatePredictionEngine<RatingMLModel, PropertyPrediction>(model);

            var userId = id; // User for whom we want to make recommendations
            var propertiesToScore =_mapper.Map<List<RatingMLModel>>(Context.Ratings.ToList());

            var scores = propertiesToScore.Select(property => predictionEngine.Predict(property));

            var recommendations = propertiesToScore.Zip(scores, (property, score) => new PredictionResult
            {
                PropertyId = property.PropertyId,
                Score = score.Score
            }).OrderByDescending(p => p.Score).ToList();

            return recommendations;
        }
    }
}
