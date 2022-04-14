class User {
  String id = '';
  final String name;
  final String phone;
  final String address;
  final String pincode;

  User(
      {required this.name,
      required this.phone,
      required this.address,
      required this.pincode});

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'address': address,
        'phone': phone,
        'pincode': pincode
      };
}
