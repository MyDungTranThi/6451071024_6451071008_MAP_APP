class AddressModel {
  final String id;
  final String city;
  final String ward;
  final String street;
  final String number;
  final String receiverName;
  final String phoneNumber;
  final bool isDefault;
  final double latitude;
  final double longitude;

  AddressModel({
    required this.id,
    required this.city,
    required this.ward,
    required this.street,
    required this.number,
    required this.receiverName,
    required this.phoneNumber,
    required this.isDefault,
    required this.latitude,
    required this.longitude,
  });

  factory AddressModel.fromMap(String id, Map<String, dynamic> map) {
    return AddressModel(
      id: id,
      city: map['city'] ?? '',
      ward: map['ward'] ?? '',
      street: map['street'] ?? '',
      number: map['number'] ?? '',
      receiverName: map['receiverName'] ?? '',
      phoneNumber: map['phoneNumber'] ?? '',
      isDefault: map['isDefault'] ?? false,
      latitude: 0.0,
      longitude: 0.0,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'city': city,
      'ward': ward,
      'street': street,
      'number': number,
      'receiverName': receiverName,
      'phoneNumber': phoneNumber,
      'isDefault': isDefault,
      'createdAt': DateTime.now().toIso8601String(),
    };
  }

  String get fullAddress => '$number, $street, $ward, $city';
}
