import '../../domain/entities/cart_orders.dart';

class CartOrdersModel {
  final String productId;
  final String productTitle;
  final String productColor;
  final String productSize;
  final int productQuantity;
  final double productPrice;
  final double totalPrice;
  final String productImageUrl;
  final String createdAt;

  CartOrdersModel({
    required this.productId,
    required this.productTitle,
    required this.productColor,
    required this.productSize,
    required this.productQuantity,
    required this.productPrice,
    required this.totalPrice,
    required this.productImageUrl,
    required this.createdAt,
  });

  factory CartOrdersModel.fromJson(Map<String, dynamic> json) {
    return CartOrdersModel(
      productId: json['productId'],
      productTitle: json['productTitle'],
      productColor: json['productColor'],
      productSize: json['productSize'],
      productQuantity: json['productQuantity'],
      productPrice: json['productPrice'],
      totalPrice: json['totalPrice'],
      productImageUrl: json['productImageUrl'],
      createdAt: json['createdAt'],
    );
  }
}

extension CartOrdersXModel on CartOrdersModel {
  CartOrdersEntity toEntity() {
    return CartOrdersEntity(
      productId: productId,
      productTitle: productTitle,
      productColor: productColor,
      productSize: productSize,
      productQuantity: productQuantity,
      productPrice: productPrice,
      totalPrice: totalPrice,
      productImageUrl: productImageUrl,
      createdAt: createdAt,
    );
  }
}
