class Student {
  int id;
  String name;
  String phone;
  String address;

  Student({required this.id, required this.name, required this.phone, required this.address});

  factory Student.fromJSON(Map<String, dynamic> data) {
    return Student(
      id: data["id"],
      name: data["name"],
      phone: data["phone"],
      address: data["address"]
    );
  }

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "phone": phone,
    "address": address,
  };
}