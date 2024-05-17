class User {
  int docNumber;
  String email;
  String lastName;
  String name;
  String password;
  String phone;
  String photoUrl;
  String role;
  
  User({
    required this.docNumber,
    required this.email,
    required this.lastName,
    required this.name,
    required this.password,
    required this.phone,
    required this.photoUrl,
    required this.role,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
    docNumber: json['doc_number'],
    email: json['email'],
    lastName: json['last_name'],
    name: json['name'],
    password: json['password'],
    phone: json['phone'],
    photoUrl: json['photo_url'],
    role: json['role'],
  );

  Map<String, dynamic> toJson() => {
    'doc_number': docNumber,
    'email': email,
    'last_name': lastName,
    'name': name,
    'password': password,
    'phone': phone,
    'photo_url': photoUrl,
    'role': role,
  };

  User copyWith({
    int? docNumber,
    String? email,
    String? lastName,
    String? name,
    String? password,
    String? phone,
    String? photoUrl,
    String? role,
  }) {
    return User(
      docNumber: docNumber ?? this.docNumber,
      email: email ?? this.email,
      lastName: lastName ?? this.lastName,
      name: name ?? this.name,
      password: password ?? this.password,
      phone: phone ?? this.phone,
      photoUrl: photoUrl ?? this.photoUrl,
      role: role ?? this.role,
    );
  }

  String fullName() {
    return '$name $lastName';
  }

  bool isAdmin() {
    return role == 'admin';
  }
}