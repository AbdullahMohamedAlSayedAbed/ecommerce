import 'package:ecommerce/features/checkout/domin/entites/shipping_address_entity.dart';

class ShippingAddressModel {
  String? name;
  String? address;
  String? phone;
  String? city;
  String? state;
  String? email;
  String? addressDetails;
  ShippingAddressModel({
    this.name,
    this.address,
    this.phone,
    this.city,
    this.state,
    this.email,
    this.addressDetails,
  });
  factory ShippingAddressModel.fromJson(Map<String, dynamic> json) {
    return ShippingAddressModel(
      name: json['name'],
      address: json['address'],
      phone: json['phone'],
      city: json['city'],
      state: json['state'],
      email: json['email'],
      addressDetails: json['addressDetails'],
    );
  }
  factory ShippingAddressModel.fromEntity(ShippingAddressEntity entity) {
    return ShippingAddressModel(
      name: entity.name,
      address: entity.address,
      phone: entity.phone,
      city: entity.city,
      state: entity.state,
      email: entity.email,
      addressDetails: entity.addressDetails,
    );
  }
  @override
  String toString() {
    return '$address $city $addressDetails';
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'address': address,
      'phone': phone,
      'city': city,
      'state': state,
      'email': email,
      'addressDetails': addressDetails,
    };
  }
}
