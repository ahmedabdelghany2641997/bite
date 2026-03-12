import 'package:bite/features/details/data/model/details_model.dart';

abstract class DetailsStates {}

class DetailsInitialState extends DetailsStates {}

class DetailsLoadingState extends DetailsStates {}

class DetailsSuccessState extends DetailsStates {
  final MealDetailsModel details;
 DetailsSuccessState(this.details);
}

class DetailsErrorState extends DetailsStates {
  final String error;
  DetailsErrorState(this.error);
}