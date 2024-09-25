class User {
  final int id;
  final String firstName;
  final String lastName;
  final String userName;
  final String email;
  final String phoneNumber;
  String password;
  final String? bio;
  final String? profileImageUri;
  final int authEnabled;
  final int deleted;

  User({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.userName,
    required this.email,
    required this.phoneNumber,
    required this.password,
    this.bio,
    this.profileImageUri,
    required this.authEnabled,
    required this.deleted,
  });

  // Factory constructor to create a User from a JSON object
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],