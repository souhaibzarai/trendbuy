import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';

abstract class ProductsFirebaseSource {
  Future<Either> getTopSelling();
}

class ProductsFirebaseSourceImpl implements ProductsFirebaseSource {
  @override
  Future<Either> getTopSelling() async {
    try {
      final returnedData =
          await FirebaseFirestore.instance
              .collection('products')
              .orderBy('salesNumber', descending: true)
              .limit(5)
              .get();

      return Right(returnedData.docs.map((data) => data.data()).toList());
    } catch (e, stackTrace) {
      print('Error details: $e');
      print('Stack trace: $stackTrace');
      return Left('Error Occurred, $e');
    }
  }
}
