import '../../domain/entities/user.dart';

class UserModel {
  final String userId;
  final String email;
  final String firstName;
  final String lastName;
  final String age;
  final String image;
  final int gender;

  UserModel({
    required this.userId,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.age,
    required this.image,
    required this.gender,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      userId: json['userId'] as String,
      email: json['email'] as String,
      firstName: json['firstName'] as String,
      lastName: json['lastName'] as String,
      age: json['age'] as String,
      image: json['image'] ?? '',
      gender: json['gender'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
      'email': email,
      'firstName': firstName,
      'lastName': lastName,
      'age': age,
      'image': image,
      'gender': gender,
    };
  }
}

extension UserXModel on UserModel {
  UserEntity toEntity() {
    return UserEntity(
      userId: userId,
      email: email,
      firstName: firstName,
      lastName: lastName,
      image: image,
      age: age,
      gender: gender,
    );
  }
}
