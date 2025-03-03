import 'package:dartz/dartz.dart';
import '../models/product.dart';
import '../sources/products_firebase_source.dart';
import '../../domain/repository/products_repo.dart';
import '../../../../service_locator.dart';

class ProductsRepositoryImpl implements ProductsRepository {
  @override
  Future<Either> fetchTopSelling() async {
    try {
      final products =
          await serviceLocator<ProductsFirebaseSource>().getTopSelling();

      return products.fold(
        (error) => Left(error),
        (data) => Right(
          List.from(
            data,
          ).map((item) => ProductModel.fromJson(item).toEntity()).toList(),
        ),
      );
    } catch (e, stackTrace) {
      print('Error details: $e');
      print('Stack trace: $stackTrace');
      return Left('Error Occurred, $e');
    }
  }

  @override
  Future<Either> fetchNewProducts() async {
    try {
      final products =
          await serviceLocator<ProductsFirebaseSource>().fetchNewProducts();

      return products.fold(
        (error) => Left(error), //
        (data) => Right(
          List.from(
            data,
          ).map((item) => ProductModel.fromJson(item).toEntity()).toList(),
        ),
      );
    } catch (e) {
      return Left('Error Occurred during fetching new in Products, $e');
    }
  }

  @override
  Future<Either> fetchProductsByCategory(String categoryId) async {
    try {
      final returnedData = await serviceLocator<ProductsFirebaseSource>()
          .fetchProductsByCategory(categoryId);

      return returnedData.fold(
        (error) => Left(error),
        (data) => Right(
          List.from(
            data,
          ).map((item) => ProductModel.fromJson(item).toEntity()).toList(),
        ),
      );
    } catch (e) {
      return Left('Error Occurred during fetching Products, $e');
    }
  }

  @override
  Future<Either> fetchProductsByTitle(String title) async {
    try {
      final products = await serviceLocator<ProductsFirebaseSource>()
          .fetchProductsByTitle(title);

      return products.fold(
        (error) => Left('Error Occurred during fetching Products, $error'),
        (data) => Right(
          List.from(
            data,
          ).map((item) => ProductModel.fromJson(item).toEntity()).toList(),
        ), //
      );
    } catch (e) {
      return Left('Error Occurred during fetching Products, $e');
    }
  }
}
