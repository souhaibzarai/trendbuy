class UserCreation {
  final String firstName;
  final String lastName;
  final String email;
  final String password;
  int? gender;
  String? age;

  UserCreation({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.password,
    this.gender,
    this.age,
  });
}