import 'package:visipay/data/model/wallet_withdrawal.dart';
import 'package:visipay/data/model/user.dart';

class Wallet_Withdrawal_Model extends Wallet_Withdrawal{
  Wallet_Withdrawal_Model({required super.user_id, required super.wallet_id, required super.withdrawal_destination_id, required super.amount, required super.notes,  required super.status});
  Map<String, dynamic> toJson() {
    return {
      'user_id': user_id,
      'wallet_id' : wallet_id,
      'withdrawal_destination_id' : withdrawal_destination_id,
      'amount' : amount,
      'notes' : notes,
      'status' : status,
    };
  }
  factory Wallet_Withdrawal_Model.fromJson(Map<String, dynamic> json) {
    return Wallet_Withdrawal_Model(
      user_id: json['user_id'],
      wallet_id: json['wallet_id'],
      withdrawal_destination_id:json['withdrawal_destination_id'],
      amount:json['amount'],
      notes:json['notes'],
      status:json['status'],
    );
  }
}