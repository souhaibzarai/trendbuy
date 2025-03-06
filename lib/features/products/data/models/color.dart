import '../../domain/entities/color.dart';

class ProductColorModel {
  final String title;
  final List<String> rgb;

  ProductColorModel({
    required this.title,
    required this.rgb, //
  });

  factory ProductColorModel.fromJson(Map<String, dynamic> json) {
    return ProductColorModel(
      title: json['title'],
      rgb: List.from(json['rgb'] as List).map((e) => e.toString()).toList(), //
    );
  }
}

extension ProductColorXModel on ProductColorModel {
  ProductColorEntity toEntity() {
    return ProductColorEntity(
      title: title,
      rgb: rgb, //
    );
  }
}
