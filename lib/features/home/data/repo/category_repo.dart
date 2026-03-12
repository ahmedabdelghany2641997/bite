import 'package:bite/core/networking/api_constants.dart';
import 'package:bite/core/networking/dio_helper.dart';
import 'package:bite/features/home/data/model/category_model.dart';
import 'package:dartz/dartz.dart';

class CategoryRepo {
  Future<Either<String, List<CategoryModel>>> getCategory() async {
    try {
      final response = await DioHelper.getdata(
        endPoint: ApiConstants.categoryEndpoint,
      );
      final data = response.data;
      List<CategoryModel> category = [];
      for (var categorys in data["categories"]) {
        category.add(CategoryModel.fromJson(categorys));
      }
      return right(category);
    } catch (error) {
      return left(error.toString());
    }
  }
}
