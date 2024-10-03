class User {
  String id;
  String firstName;
  String lastName;
  String userName;
  String email;
  String phoneNumber;
  String password;
  String? bio;
  String? pfpURI;
  int isAuthenticated;
  int isDeleted;

  User({
    this.id = '0',
    this.firstName = '',
    this.lastName = '',
    this.userName = '',
    this.email = '',
    this.phoneNumber = '',
    this.password = '',
    this.bio,
    this.pfpURI,
    this.isAuthenticated = 0,
    this.isDeleted = 0,
  });

  // Factory constructor to create a User from a JSON object
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      userName: json['userName'],
      email: json['email'],
      phoneNumber: json['phoneNumber'],
      password: json['password'],
      bio: json['bio'],
      pfpURI: json['profileImageUri'],
      isAuthenticated: json['authEnabled'],
      isDeleted: json['deleted'],);
  }

  // Method to convert a User object to a JSON object
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'firstName': firstName,
      'lastName': lastName,
      'userName': userName,
      'email': email,
      'phoneNumber': phoneNumber,
      'password': password,
      'bio': bio,
      'profileImageUri': pfpURI,
      'authEnabled': isAuthenticated,
      'deleted': isDeleted,
    };
  }
}