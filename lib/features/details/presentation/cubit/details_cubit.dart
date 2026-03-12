import 'package:bite/features/details/data/repo/details_repo.dart';
import 'package:bite/features/details/presentation/cubit/details_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DetailsCubit extends Cubit<DetailsStates> {
  final DetailsRepo detailsRepo;

  DetailsCubit(this.detailsRepo) : super(DetailsInitialState());

  void detailsMeals({required String id}) async {
    emit(DetailsLoadingState());

    final result = await detailsRepo.getMealDetails(id);

    result.fold(
      (error) => emit(DetailsErrorState(error)),
      (detail) => emit(DetailsSuccessState(detail)),
    );
  }
}