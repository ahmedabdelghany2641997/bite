import 'package:bite/features/meals/data/model/meals_model.dart';

abstract class FavoritesStates {}
class FavoritesInitialState extends FavoritesStates {}
class FavoritesLoadingState extends FavoritesStates {}
class FavoritesSuccessState extends FavoritesStates {
  final List<String> favoriteIds;
  final List<MealModel> favoriteMeals;
  FavoritesSuccessState(this.favoriteIds, this.favoriteMeals);
}