class AddToCartModel {
  // final String userId;
  final String productId;
  final String productTitle;
  final String productColor;
  final String productSize;
  final int productQuantity;
  final double productPrice;
  final double totalPrice;
  final String productImageUrl;
  final String createdAt;

  AddToCartModel({
    // required this.userId,
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

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      // 'userId': userId,
      'productId': productId,
      'productTitle': productTitle,
      'productColor': productColor,
      'productSize': productSize,
      'productQuantity': productQuantity,
      'productPrice': productPrice,
      'totalPrice': totalPrice,
      'productImageUrl': productImageUrl,
      'createdAt': createdAt,
    };
  }
}
