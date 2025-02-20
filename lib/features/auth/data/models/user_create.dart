class UserCreation {
  final String firstName;
  final String lastName;
  final String email;
  final String password;
  final int gender;
  final String age;

  UserCreation({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.password,
    required this.gender,
    required this.age,
  });

  // factory UserCreation.fromJson(Map<String, dynamic> json) {
  //   return UserCreate(
  //     firstName: json['firstName'],
  //     lastName: json['lastName'],
  //     email: json['email'],
  //     password: json['password'],
  //   );

  // factory UserCreation.toJson(Map<String, String> json) {}
  // }
}
