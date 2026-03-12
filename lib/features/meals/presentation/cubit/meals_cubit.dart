import 'package:bite/features/meals/data/repo/meals_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'meals_states.dart';

class MealsCubit extends Cubit<MealsStates> {
  final MealsRepo mealsRepo;

  MealsCubit(this.mealsRepo) : super(MealsInitialState());

  void getMeals({required String categoryName}) async {
    emit(MealsLoadingState());

    final result = await mealsRepo.getMealsByCategory(categoryName);

    result.fold(
      (error) => emit(MealsErrorState(error)),
      (meals) => emit(MealsSuccessState(meals)),
    );
  }
}