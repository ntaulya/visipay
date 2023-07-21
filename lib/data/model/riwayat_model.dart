// To parse this JSON data, do
//
//     final riwayatModel = riwayatModelFromJson(jsonString);

import 'dart:convert';

import 'package:visipay/data/model/riwayat.dart';

class RiwayatModel extends Riwayat {
  RiwayatModel(
      {super.promoId,
      super.notes,
      super.transactionDiscount,
      required super.id,
      required super.userId,
      required super.walletId,
      required super.transactionMethodId,
      required super.productId,
      required super.amount,
      required super.transactionType,
      required super.transactionStatus,
      required super.createdAt,
      required super.updatedAt,
      required super.userTransaction,
      required super.walletTransaction,
      required super.transactionMethod,
      super.transactionProduct,
      super.billing_number});

  factory RiwayatModel.fromRawJson(String str) => RiwayatModel.fromJson(json.decode(str));

  factory RiwayatModel.fromJson(Map<String, dynamic> json) => RiwayatModel(
      id: json["id"],
      userId: json["user_id"],
      walletId: json["wallet_id"],
      transactionMethodId: json["transaction_method_id"],
      productId: json["product_id"] ?? '',
      promoId: json["promo_id"] ?? '',
      amount: json["amount"],
      notes: json["notes"] ?? '',
      transactionType: json["transaction_type"],
      transactionStatus: json["transaction_status"],
      createdAt: DateTime.parse(json["createdAt"]),
      updatedAt: DateTime.parse(json["updatedAt"]),
      userTransaction: UserTransactionModel.fromJson(json["user_transaction"]),
      walletTransaction: WalletTransactionModel.fromJson(json["wallet_transaction"]),
      transactionMethod: TransactionMethodModel.fromJson(json["transaction_method"]),
      transactionProduct: json['transaction_product'] != null
          ? TransactionProductModel.fromJson(json['transaction_product'])
          : null,
      transactionDiscount: json["transaction_discount"] != null
          ? TransactionDiscountModel.fromJson(json['transaction_discount'])
          : null,
      billing_number: json['billing_number']);
}

class TransactionMethodModel extends TransactionMethod {
  TransactionMethodModel(
      {super.instruction,
      required super.id,
      required super.methodName,
      required super.category,
      required super.status});

  factory TransactionMethodModel.fromRawJson(String str) =>
      TransactionMethodModel.fromJson(json.decode(str));

  factory TransactionMethodModel.fromJson(Map<String, dynamic> json) => TransactionMethodModel(
        id: json["id"],
        methodName: json["method_name"],
        instruction: json["instruction"],
        category: json["category"],
        status: json["status"],
      );
}

class TransactionProductModel extends TransactionProduct {
  TransactionProductModel(
      {required super.id,
      required super.name,
      required super.category,
      required super.code,
      required super.price});

  factory TransactionProductModel.fromRawJson(String str) =>
      TransactionProductModel.fromJson(json.decode(str));

  factory TransactionProductModel.fromJson(Map<String, dynamic> json) => TransactionProductModel(
        id: json["id"],
        name: json["name"],
        category: json["category"],
        code: json["code"],
        price: json["price"],
      );
}

class UserTransactionModel extends UserTransaction {
  UserTransactionModel(
      {required super.id, required super.name, required super.phone, required super.email});

  factory UserTransactionModel.fromRawJson(String str) =>
      UserTransactionModel.fromJson(json.decode(str));

  factory UserTransactionModel.fromJson(Map<String, dynamic> json) => UserTransactionModel(
        id: json["id"],
        name: json["name"],
        phone: json["phone"],
        email: json["email"],
      );
}

class WalletTransactionModel extends WalletTransaction {
  WalletTransactionModel({required super.id, required super.userId, required super.balance});

  factory WalletTransactionModel.fromRawJson(String str) =>
      WalletTransactionModel.fromJson(json.decode(str));

  factory WalletTransactionModel.fromJson(Map<String, dynamic> json) => WalletTransactionModel(
        id: json["id"],
        userId: json["user_id"],
        balance: json["balance"],
      );
}

class TransactionDiscountModel extends TransactionDiscount {
  TransactionDiscountModel({required super.name});

  factory TransactionDiscountModel.fromJson(Map<String, dynamic> json) =>
      TransactionDiscountModel(name: json['name']);
}
