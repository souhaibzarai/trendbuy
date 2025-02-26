import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';

abstract class CategoriesFirebaseService {
  Future<Either> getCategories();
}

class CategoriesFirebaseServiceImpl implements CategoriesFirebaseService {
  @override
  Future<Either> getCategories() async {
    try {
      final categories =
          await FirebaseFirestore.instance.collection('categories').get();
      return Right(categories.docs.map((e) => e.data()).toList());
    } catch (e) {
      return const Left('Error while fetching categories.');
    }
  }
}
