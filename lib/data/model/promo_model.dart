import 'package:visipay/data/model/promo.dart';

class PromoModel extends Promo {
  PromoModel({required super.id, required super.name, required super.description, required super.discount, required super.min_order, required super.expired_at});
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'description' : description,
      'discount' : discount,
      'min_order' : min_order,
      'expired_at' : expired_at,
    };
  }
  factory PromoModel.fromJson(Map<String, dynamic> json) {
    return PromoModel(
      name: json['name'],
      description: json['description'],
      discount:json['discount'],
      min_order:json['min_order'],
      expired_at:DateTime.parse(json['expired_at']), id: json['id'],
    );
  }
}