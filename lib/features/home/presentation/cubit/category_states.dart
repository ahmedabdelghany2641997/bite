import 'package:bite/features/home/data/model/category_model.dart';

abstract class CategoryStates {}

class InitialCategoryStates extends CategoryStates {}

class LoadingCategoryStates extends CategoryStates {}

class SuccessCategoryStates extends CategoryStates {
  final List<CategoryModel> category;

  SuccessCategoryStates({required this.category});
}

class ErrorCategoryStates extends CategoryStates {
  final String error;

  ErrorCategoryStates({required this.error});
}
