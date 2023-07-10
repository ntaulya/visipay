import 'package:visipay/data/model/wallet_transaction.dart';

class Wallet_Transaction_Model extends Wallet_Transaction {
  Wallet_Transaction_Model({required super.user_id, required super.wallet_id, required super.transaction_method, required super.amount, required super.notes, required super.transaction_type, required super.transaction_status});
  Map<String, dynamic> toJson() {
    return {
      'user_id': user_id,
      'wallet_id' : wallet_id,
      'transaction_method' : transaction_method,
      'amount' : amount,
      'notes' : notes,
      'transaction_type' : transaction_type,
      'transaction_status' : transaction_status
    };
  }
  factory Wallet_Transaction_Model.fromJson(Map<String, dynamic> json) {
    return Wallet_Transaction_Model(
      user_id: json['user_id'],
      wallet_id: json['wallet_id'],
      transaction_method:json['transaction_method'],
      amount:json['amount'],
      notes:json['notes'],
      transaction_type:json['transaction_type'],
      transaction_status:json['transaction_status'],
    );
  }
}