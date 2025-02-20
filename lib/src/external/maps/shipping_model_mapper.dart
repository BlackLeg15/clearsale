import 'dart:convert';

import 'package:clearsale/src/domain/models/shipping_model.dart';

import 'address_model_mapper.dart';
import 'phone_model_mapper.dart';

class ShippingModelMapper {
  static Map<String, dynamic> toMap(ShippingModel model) {
    if (model == null) return null;

    return {
      if (model.clientId != null) 'clientId': model.clientId,
      if (model.type != null) 'type': model.type?.toMap(),
      if (model.primaryDocument != null) 'primaryDocument': model.primaryDocument,
      if (model.secondaryDocument != null) 'secondaryDocument': model.secondaryDocument,
      if (model.name != null) 'name': model.name,
      if (model.birthDate != null) 'birthDate': model.birthDate?.toIso8601String(),
      if (model.email != null) 'email': model.email,
      if (model.gender != null) 'gender': model.gender?.toMap(),
      if (model.address != null) 'address': AddressModelMapper.toMap(model.address),
      if (model.phones != null) 'phones': model.phones?.map((x) => PhoneModelMapper.toMap(x))?.toList(),
      if (model.deliveryType != null) 'deliveryType': model.deliveryType?.toMap(),
      if (model.deliveryTime != null) 'deliveryTime': model.deliveryTime,
      if (model.price != null) 'price': model.price,
      if (model.pickUpStoreDocument != null) 'pickUpStoreDocument': model.pickUpStoreDocument,
    };
  }

  static ShippingModel fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return ShippingModel(
      clientId: map['clientId'],
      type: PersonTypeEnumExtension.fromMap(map['type']),
      primaryDocument: map['primaryDocument'],
      secondaryDocument: map['secondaryDocument'],
      name: map['name'],
      birthDate: DateTime.tryParse(map['birthDate']),
      email: map['email'],
      gender: GenderEnumExtension.fromMap(map['gender']),
      address: AddressModelMapper.fromMap(map['address']),
      phones: List<PhoneModel>.from(map['phones']?.map((x) => PhoneModelMapper.fromMap(x))),
      deliveryType: DeliveryTypeEnumExtension.fromMap(map['deliveryType']),
      deliveryTime: map['deliveryTime'],
      price: map['price'],
      pickUpStoreDocument: map['pickUpStoreDocument'],
    );
  }

  static String toJson(ShippingModel model) {
    if (model == null) return null;
    return json.encode(toMap(model));
  }

  static ShippingModel fromJson(String source) {
    if (source == null) return null;
    return fromMap(json.decode(source));
  }
}
