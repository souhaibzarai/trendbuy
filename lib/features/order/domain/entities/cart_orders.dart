class CartOrdersEntity {
  final String productId;
  final String productTitle;
  final String productColor;
  final String productSize;
  final int productQuantity;
  final double productPrice;
  final double totalPrice;
  final String productImageUrl;
  final String createdAt;

  CartOrdersEntity({
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
}
