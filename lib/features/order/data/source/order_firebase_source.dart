import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:trendbuy/features/order/data/models/add_to_cart.dart';

abstract class OrderFirebaseSource {
  Future<Either> addToCart(AddToCartModel addToCartRequest);
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
}
