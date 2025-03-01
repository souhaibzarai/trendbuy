import 'package:dartz/dartz.dart';

abstract class ProductsRepository {
  Future<Either> fetchTopSelling();

  Future<Either> fetchNewProducts();

  Future<Either> fetchProductsByCategory(String categoryId);
}
