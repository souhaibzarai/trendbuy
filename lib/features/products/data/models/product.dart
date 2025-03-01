import 'package:cloud_firestore/cloud_firestore.dart';
import '../../domain/entities/product.dart';

import 'color.dart';

class ProductModel {
  final String productId;
  final String categoryId;
  final List<ProductColorModel> colors;
  final Timestamp createdAt;
  final double discountedPrice;
  final int gender;
  final List<String>? images;
  final double price;
  final int salesNumber;
  final List<String> sizes;
  final String title;

  ProductModel({
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

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    List<String> sizesList = [];
    if (json['sizes'] != null) {
      if (json['sizes'] is List) {
        sizesList =
            (json['sizes'] as List).map((item) => item.toString()).toList();
      }
    }

    List<String> imagesList;
    if (json['images'] != null && json['images'] is List && (json['images'] as List).isNotEmpty) {
      imagesList =
          (json['images'] as List).map((item) => item.toString()).toList();
    } else {
      imagesList = ['https://i.imgur.com/Kr7liXH.jpeg'];
    }

    return ProductModel(
      productId: json['productId'] as String,
      categoryId: json['categoryId'] as String,
      colors: List<ProductColorModel>.from(
        json['colors'].map((item) => ProductColorModel.fromJson(item)),
      ),
      createdAt: json['createdAt'] as Timestamp,
      discountedPrice: (json['discountedPrice'] as num).toDouble(),
      gender: (json['gender'] as num).toInt(),
      images: imagesList,
      price: (json['price'] as num).toDouble(),
      salesNumber: (json['salesNumber'] as num).toInt(),
      sizes: sizesList,
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
      discountedPrice: discountedPrice,
      gender: gender,
      images: images,
      price: price,
      salesNumber: salesNumber,
      sizes: sizes,
      title: title,
    );
  }
}
