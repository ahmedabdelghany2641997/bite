import 'package:bite/core/networking/api_constants.dart';
import 'package:bite/core/networking/dio_helper.dart';
import 'package:bite/features/meals/data/model/meals_model.dart';
import 'package:dartz/dartz.dart';

class MealsRepo {
  Future<Either<String, List<MealModel>>> getMealsByCategory(String categoryName) async {
    try {
      final response = await DioHelper.getdata(
        endPoint: ApiConstants.filterByCategoryEndpoint,
        queryParameters:{'c': categoryName} ,
      );

      if (response.data != null && response.data['meals'] != null) {
        final List<dynamic> data = response.data['meals'];
        List<MealModel> meals = data.map((e) => MealModel.fromJson(e)).toList();
        return right(meals);
      } else {
        return left("No meals found");
      }
    } catch (error) {
      return left(error.toString());
    }
  }
}