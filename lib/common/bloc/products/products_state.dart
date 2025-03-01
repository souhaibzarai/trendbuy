import '../../../features/products/domain/entities/product.dart';

abstract class ProductsDisplayState {}

class ProductsLoading extends ProductsDisplayState {}

class ProductsLoaded extends ProductsDisplayState {
  List<ProductEntity> products;

  ProductsLoaded(this.products);
}

class LoadProductsFailure extends ProductsDisplayState {
  final String error;

  LoadProductsFailure(this.error);
}
