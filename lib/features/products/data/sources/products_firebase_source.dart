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
              .limit(5)
              .orderBy('salesNumber')
              .where('salesNumber', isGreaterThan: 10)
              .get();

      return Right(returnedData.docs.map((data) => data.data()).toList());
    } catch (e) {
      return Left('Error Occurred, $e');
    }
  }
}
