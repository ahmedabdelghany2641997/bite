import 'package:bite/core/networking/api_constants.dart';
import 'package:bite/core/networking/dio_helper.dart'; // تأكد من المسار
import 'package:bite/features/meals/data/model/meals_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FavoritesRepo {
  static const String _favKey = 'fav_ids';

  Future<List<String>> getSavedIds() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getStringList(_favKey) ?? [];
  }

  Future<void> saveIds(List<String> ids) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setStringList(_favKey, ids);
  }

  Future<MealModel> getMealById(String id) async {
    final response = await DioHelper.getdata(
      endPoint: ApiConstants.mealDetailsEndpoint,
      queryParameters: {'i': id},
    );
    return MealModel.fromJson(response.data['meals'][0]);
  }
}