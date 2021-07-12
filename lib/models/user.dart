class User {
  final String firstName;
  final String lastName;
  final String userName;
  final String phoneNumber;
  final String email;
  final String country;
  final String city;
  final String address;
  final String zipCode;
  final bool isFoodie;
  final bool isKitchen;
  final String password;

  final String? token;
  final int? accountId;

  User(
      {this.accountId,
      this.token,
      required this.firstName,
      required this.lastName,
      required this.phoneNumber,
      required this.country,
      required this.city,
      required this.address,
      required this.zipCode,
      required this.userName,
      required this.email,
      required this.isFoodie,
      required this.isKitchen,
      required this.password});

  User.fromJson(Map<String, dynamic> json)
      : accountId = json['account-id'],
        token = json['token'],
        address = json['address'],
        city = json['city'],
        country = json['country'],
        email = json['email-id'],
        firstName = json['first-name'],
        isFoodie = json['is-foodie-account'],
        isKitchen = json['is-kitchen-account'],
        lastName = json['last-name'],
        password = json['password'],
        phoneNumber = json['phone-number'],
        userName = json['username'],
        zipCode = json['zip-code'];

  Map<String, dynamic> toJson() => {
        "address": address,
        "city": city,
        "country": country,
        "email-id": email,
        "first-name": firstName,
        "is-foodie-account": isFoodie,
        "is-kitchen-account": isKitchen,
        "last-name": lastName,
        "password": password,
        "phone-number": phoneNumber,
        "username": userName,
        "zip-code": zipCode
      };
}
