import 'package:trendbuy/features/products/domain/entities/product.dart';

abstract class TopSellingProductsState {}

class TopSellingProductsLoading extends TopSellingProductsState {}

class TopSellingProductsLoaded extends TopSellingProductsState {
  List<ProductEntity> products;

  TopSellingProductsLoaded(this.products);
}

class LoadTopSellingProductsFailure extends TopSellingProductsState {
  final String error;

  LoadTopSellingProductsFailure(this.error);
}
