class Person {
  int docNumber;
  String lastName;
  String name;
  String phone;

  Person({
    required this.docNumber,
    required this.lastName,
    required this.name,
    required this.phone,
  });

  factory Person.fromJson(Map<String, dynamic> json) => Person(
    docNumber: json["doc_number"],
    lastName: json["last_name"],
    name: json["name"],
    phone: json["phone"],
  );

  Map<String, dynamic> toJson() => {
    "doc_number": docNumber,
    "last_name": lastName,
    "name": name,
    "phone": phone,
  };

  String fullName() {
    return '$name $lastName';
  }
}