

class CustomerPostModel {
  String name;
  String phone_number;
  CustomerPostModel({
    required this.name,
    required this.phone_number,
  });


  CustomerPostModel copyWith({
    String? name,
    String? phone_number,
  }) {
    return CustomerPostModel(
      name: name ?? this.name,
      phone_number: phone_number ?? this.phone_number,
    );
  }

  Map<String, dynamic> toJson(CustomerPostModel customerPostModel) {
    return <String, dynamic>{
      'name': customerPostModel.name,
      'phone_number': customerPostModel.phone_number,
    };
  }

  factory CustomerPostModel.fromJson(Map<String, dynamic> map) {
    return CustomerPostModel(
      name: map['name'] as String? ?? "null",
      phone_number: map['phone_number'] as String? ?? "null",
    );
  }

 
  @override
  String toString() => 'CustomerPostModel(name: $name, phone_number: $phone_number)';

  @override
  bool operator ==(covariant CustomerPostModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.name == name &&
      other.phone_number == phone_number;
  }

  @override
  int get hashCode => name.hashCode ^ phone_number.hashCode;
}
