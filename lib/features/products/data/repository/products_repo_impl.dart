import 'package:dartz/dartz.dart';
import 'package:trendbuy/features/products/data/models/product.dart';
import 'package:trendbuy/features/products/data/sources/products_firebase_source.dart';
import 'package:trendbuy/features/products/domain/repository/products_repo.dart';
import 'package:trendbuy/service_locator.dart';

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
}
