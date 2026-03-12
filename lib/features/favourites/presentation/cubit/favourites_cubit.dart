import 'package:bite/features/favourites/data/repo/favourites_repo.dart';
import 'package:bite/features/favourites/presentation/cubit/favourites_states.dart';
import 'package:bite/features/meals/data/model/meals_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavoritesCubit extends Cubit<FavoritesStates> {
  final FavoritesRepo repo;
  FavoritesCubit(this.repo) : super(FavoritesInitialState());

  List<String> favIds = [];

  Future<void> loadFavorites() async {
    emit(FavoritesLoadingState());
    favIds = await repo.getSavedIds();
    
    List<MealModel> meals = [];
    for (var id in favIds) {
      final meal = await repo.getMealById(id);
      meals.add(meal);
    }
    emit(FavoritesSuccessState(favIds, meals));
  }

  void toggleFavorite(String mealId) async {
    if (favIds.contains(mealId)) {
      favIds.remove(mealId);
    } else {
      favIds.add(mealId);
    }
    await repo.saveIds(favIds);
    loadFavorites(); 
  }

  bool isFavorite(String mealId) => favIds.contains(mealId);
}