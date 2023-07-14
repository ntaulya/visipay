import 'package:visipay/data/model/transaction_method.dart';
import 'package:visipay/data/model/user.dart';

class Transaction_Method_Model extends Transaction_Method {
  Transaction_Method_Model({required super.method_name, required super.icon, required super.instruction, required super.category, required super.status});
  Map<String, dynamic> toJson() {
    return {
      'method_name': method_name,
      'icon' : icon,
      'instruction' : instruction,
      'category' : category,
      'status' : status,
    };
  }
  factory Transaction_Method_Model.fromJson(Map<String, dynamic> json) {
    return Transaction_Method_Model(
      method_name: json['method_name'],
      icon: "",
      instruction:json['instruction'],
      category:json['category'],
      status:json['status'],
    );
  }
}