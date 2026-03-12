import 'package:bite/core/networking/api_constants.dart';
import 'package:bite/core/networking/dio_helper.dart';
import 'package:bite/features/details/data/model/details_model.dart';
import 'package:dartz/dartz.dart';
class  DetailsRepo {
  Future<Either<String, MealDetailsModel>> getMealDetails(String id) async {
  try {
    final response = await DioHelper.getdata(
      endPoint: ApiConstants.mealDetailsEndpoint, 
      queryParameters: {'i': id},
    );

    if (response.data != null && response.data['meals'] != null) {
      return right(MealDetailsModel.fromJson(response.data['meals'][0]));
    }
    return left("Meal not found");
  } catch (e) {
    return left(e.toString());
  }
}
}

