import 'package:visipay/data/model/wallet.dart';

class WalletModel extends Wallet {
  WalletModel({required super.user_id, required super.balance});
  Map<String, dynamic> toJson() {
    return {
      'user_id': user_id,
      'balance' : balance,
    };
  }
  factory WalletModel.fromJson(Map<String, dynamic> json) {
    return WalletModel(
      user_id: json['user_id'],
      balance: (json['balance'] as int).toDouble(),
    );
  }
}