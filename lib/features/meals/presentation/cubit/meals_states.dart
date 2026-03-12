import 'package:bite/features/meals/data/model/meals_model.dart';

abstract class MealsStates {}

class MealsInitialState extends MealsStates {}

class MealsLoadingState extends MealsStates {}

class MealsSuccessState extends MealsStates {
  final List<MealModel> meals;
  MealsSuccessState(this.meals);
}

class MealsErrorState extends MealsStates {
  final String error;
  MealsErrorState(this.error);
}