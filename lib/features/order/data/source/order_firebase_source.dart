import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:trendbuy/features/order/data/models/add_to_cart.dart';

abstract class OrderFirebaseSource {
  Future<Either> addToCart(AddToCartModel addToCartRequest);

  Future<Either> getCartOrders();
}

class OrderFirebaseSourceImpl implements OrderFirebaseSource {
  @override
  Future<Either> addToCart(AddToCartModel addToCartRequest) async {
    try {
      var user = FirebaseAuth.instance.currentUser;

      await FirebaseFirestore.instance
          .collection('users')
          .doc(user!.uid)
          .collection('cart')
          .add(addToCartRequest.toJson());

      return const Right('Added to cart successfully');
    } catch (e) {
      return Left('Error Occurred, $e');
    }
  }

  @override
  Future<Either> getCartOrders() async {
    try {
      final user = FirebaseAuth.instance.currentUser;
      final response =
          await FirebaseFirestore.instance
              .collection('users')
              .doc(user!.uid)
              .collection('cart')
              .get();
      return Right(response.docs.map((e) => e.data()).toList());
    } catch (e) {
      return Left('Error Occurred, $e');
    }
  }
}
