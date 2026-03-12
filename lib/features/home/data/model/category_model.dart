class CategoryModel {
  final String id;
  final String name;
  final String image;
  final String desc;

  CategoryModel({
    required this.id,
    required this.name,
    required this.image,
    required this.desc,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
   id: json['idCategory']?.toString() ?? "",      
    name: json['strCategory']?.toString() ?? "",     
    image: json['strCategoryThumb']?.toString() ?? "", 
    desc: json['strCategoryDescription']?.toString() ?? "",
    );
  }
  // ... باقي الكود
}