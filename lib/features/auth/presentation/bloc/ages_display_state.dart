import 'package:cloud_firestore/cloud_firestore.dart';

abstract class AgesDisplayState {}

final class AgesLoading extends AgesDisplayState {}

final class AgesLoaded extends AgesDisplayState {
  final List<QueryDocumentSnapshot<Map<String, dynamic>>> ages;

  AgesLoaded({required this.ages});
}

final class AgesLoadFailure extends AgesDisplayState {
  final String errMsg;

  AgesLoadFailure({required this.errMsg});
}
