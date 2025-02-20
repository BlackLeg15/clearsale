import 'dart:convert';

import 'package:clearsale/src/domain/models/chargeback_marking_response_model.dart';

class ChargebackMarkingResponseModelMapper extends ChargebackMarkingResponseModel {
  Map<String, dynamic> toMap() {
    return {
      if (orderCode != null) 'code': orderCode,
      if (status != null) 'status': status,
    };
  }

  static ChargebackMarkingResponseModel fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return ChargebackMarkingResponseModel(
      orderCode: map['code'],
      status: map['status'],
    );
  }

  String toJson() => json.encode(toMap());

  static ChargebackMarkingResponseModel fromJson(String source) => fromMap(json.decode(source));
}
