import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';

abstract class ProductsFirebaseSource {
  Future<Either> getTopSelling();

  Future<Either> fetchNewProducts();

  Future<Either> fetchProductsByCategory(String categoryId);

  Future<Either> fetchProductsByTitle(String title);
}

class ProductsFirebaseSourceImpl implements ProductsFirebaseSource {
  @override
  Future<Either> getTopSelling() async {
    try {
      final returnedData =
          await FirebaseFirestore.instance
              .collection('products')
              .orderBy('salesNumber', descending: true)
              .limit(10)
              .get();

      return Right(returnedData.docs.map((data) => data.data()).toList());
    } catch (e, stackTrace) {
      print('Error details: $e');
      print('Stack trace: $stackTrace');
      return Left('Error Occurred, $e');
    }
  }

  @override
  Future<Either> fetchNewProducts() async {
    final now = DateTime.now();
    try {
      final response =
          await FirebaseFirestore.instance
              .collection('products')
              .where(
                'createdAt',
                isGreaterThanOrEqualTo: Timestamp.fromDate(
                  now.subtract(Duration(days: 2)),
                ),
              )
              .limit(10)
              .orderBy('createdAt', descending: true)
              .get();

      return Right(response.docs.map((data) => data.data()).toList());
    } catch (e) {
      return Left('Error Occurred during fetching new in Products, $e');
    }
  }

  @override
  Future<Either> fetchProductsByCategory(String categoryId) async {
    try {
      final response =
          await FirebaseFirestore.instance
              .collection('products')
              .where('categoryId', isEqualTo: categoryId)
              .get();

      return Right(response.docs.map((data) => data.data()).toList());
    } catch (e) {
      return Left('Error Occurred during fetching new in Products, $e');
    }
  }

  @override
  Future<Either> fetchProductsByTitle(String title) async {
    try {
      final returnedData =
          await FirebaseFirestore.instance
              .collection('products')
              .where('title', isGreaterThanOrEqualTo: title)
              .get();

      return Right(returnedData.docs.map((item) => item.data()).toList());
    } catch (e) {
      return Left('Error Occurred during fetching new in Products, $e');
    }
  }
}
