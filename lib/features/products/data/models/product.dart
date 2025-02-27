import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:trendbuy/features/products/domain/entities/product.dart';

import 'color.dart';

class ProductModel {
  final String productId;
  final String categoryId;
  final List<ProductColorModel> colors;
  final Timestamp createdAt;
  final double disountedPrice;
  final int gender;
  final List<String>? images;
  final double price;
  final double salesNumber;
  final List<String> sizes;
  final String title;

  ProductModel({
    required this.productId,
    required this.categoryId,
    required this.colors,
    required this.createdAt,
    required this.disountedPrice,
    required this.gender,
    required this.images,
    required this.price,
    required this.salesNumber,
    required this.sizes,
    required this.title,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      productId: json['productId'] as String,
      categoryId: json['categoryId'] as String,
      colors: List<ProductColorModel>.from(
        json['colors'].map((item) => ProductColorModel.fromJson(item)),
      ),
      createdAt: json['createdAt'] as Timestamp,
      disountedPrice: json['discountedPrice'] as double,
      gender: json['gender'] as int,
      images:
          json['images'] as List<String>? ??
          ['https://i.imgur.com/w5doXZN.jpeg'],
      price: json['price'] as double,
      salesNumber: json['salesNumber'],
      sizes: json['sizes'] as List<String>,
      title: json['title'] as String,
    );
  }
}

extension ProductXModel on ProductModel {
  ProductEntity toEntity() {
    return ProductEntity(
      productId: productId,
      categoryId: categoryId,
      colors: colors.map((color) => color.toEntity()).toList(),
      createdAt: createdAt,
      disountedPrice: disountedPrice,
      gender: gender,
      images: images,
      price: price,
      salesNumber: salesNumber,
      sizes: sizes,
      title: title,
    );
  }
}
