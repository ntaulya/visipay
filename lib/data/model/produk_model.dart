import 'package:visipay/data/model/produk.dart';

class ProdukModel extends Produk {
  ProdukModel({
    required super.id,
    required super.name,
    required super.category,
    required super.code,
    required super.price,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'category': category,
      'code': code,
      'price': price,
    };
  }

  factory ProdukModel.fromJson(Map<String, dynamic> json) {
    return ProdukModel(
      id: json['id'],
      name: json['name'],
      category: json['category'],
      code: json['code'],
      price: json['price'],
    );
  }
}
