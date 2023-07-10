import 'package:visipay/data/model/riwayat.dart';

class RiwayatModel extends Riwayat {
  RiwayatModel({
    required super.user_id,
    required super.wallet_id,
    required super.amount,
    super.notes,
    required super.transaction_type,
    required super.transaction_status,
    required super.id,
    required super.createdAt,
  });
  Map<String, dynamic> toJson() {
    return {
      'user_id': user_id,
      'wallet_id': wallet_id,
      'amount': amount,
      'notes': notes,
      'transaction_type': transaction_type,
      'transaction_status': transaction_status,
      'createdAt': createdAt,
    };
  }

  factory RiwayatModel.fromJson(Map<String, dynamic> json) {
    return RiwayatModel(
      user_id: json['user_id'],
      wallet_id: json['wallet_id'],
      amount: json['amount'],
      notes: json['notes'],
      transaction_type: json['transaction_type'],
      transaction_status: json['transaction_status'],
      id: '',
      createdAt: DateTime.parse(json['createdAt']),
    );
  }
}
