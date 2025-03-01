import '../../domain/entities/category.dart';

class CategoryModel {
  final String categoryId;
  final String image;
  final String title;

  CategoryModel({
    required this.categoryId,
    required this.image,
    required this.title,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      categoryId: json['categoryId'],
      image: json['image'],
      title: json['title'],
    );
  }
}

extension CategoryXModel on CategoryModel {
  CategoryEntity toEntity() {
    return CategoryEntity(
      categoryId: categoryId,
      image: image,
      title: title, //
    );
  }
}
