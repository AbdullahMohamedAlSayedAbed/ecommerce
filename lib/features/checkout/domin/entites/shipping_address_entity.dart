class ShippingAddressEntity {
  String? name;
  String? address;
  String? phone;
  String? city;
  String? state;
  String? email;
  String? addressDetails;

  ShippingAddressEntity({
    this.name,
    this.address,
    this.phone,
    this.city,
    this.state,
    this.email,
    this.addressDetails,
  });
  @override
  String toString() {
    return '$address $city $addressDetails';
  }
}
