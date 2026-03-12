import 'package:bite/core/networking/api_constants.dart';
import 'package:bite/core/networking/dio_helper.dart';
import 'package:bite/features/home/data/repo/category_repo.dart';
import 'package:bite/features/home/presentation/cubit/category_states.dart';
import 'package:bloc/bloc.dart';

class CategoryCubit extends Cubit<CategoryStates> {
  final CategoryRepo categoryRepo;
  CategoryCubit(this.categoryRepo) : super(InitialCategoryStates());

  Future<void> getCategory() async {
    await Future.delayed(Duration.zero);
    emit(LoadingCategoryStates());
    final res = await categoryRepo.getCategory();

    res.fold(
      (error) {
        emit(ErrorCategoryStates(error: error.toString()));
      },
      (category) {
        emit(SuccessCategoryStates(category: category));
      },
    );
  }
}
