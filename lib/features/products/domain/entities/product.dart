import 'package:cloud_firestore/cloud_firestore.dart';
import 'color.dart';

class ProductEntity {
  final String productId;
  final String categoryId;
  final List<ProductColorEntity> colors;
  final Timestamp createdAt;
  final double discountedPrice;
  final int gender;
  final List<String>? images;
  final double price;
  final int salesNumber;
  final List<String> sizes;
  final String title;

  ProductEntity({
    required this.productId,
    required this.categoryId,
    required this.colors,
    required this.createdAt,
    required this.discountedPrice,
    required this.gender,
    required this.images,
    required this.price,
    required this.salesNumber,
    required this.sizes,
    required this.title,
  });
}
