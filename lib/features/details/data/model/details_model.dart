class MealDetailsModel {
  final String id;
  final String name;
  final String image;
  final String instructions;
  final String category;
  final String area;
  final List<String> ingredients;

  MealDetailsModel({
    required this.id,
    required this.name,
    required this.image,
    required this.instructions,
    required this.category,
    required this.area,
    required this.ingredients,
  });

  factory MealDetailsModel.fromJson(Map<String, dynamic> json) {
    List<String> ingredientsList = [];
    for (int i = 1; i <= 20; i++) {
      String? ingredient = json['strIngredient$i'];
      String? measure = json['strMeasure$i'];
      if (ingredient != null && ingredient.isNotEmpty) {
        ingredientsList.add("${measure ?? ""} $ingredient".trim());
      }
    }

    return MealDetailsModel(
      id: json['idMeal'] ?? "",
      name: json['strMeal'] ?? "",
      image: json['strMealThumb'] ?? "",
      instructions: json['strInstructions'] ?? "",
      category: json['strCategory'] ?? "",
      area: json['strArea'] ?? "",
      ingredients: ingredientsList,
    );
  }
}