import 'package:visipay/data/model/charge_response.dart';
import 'package:visipay/data/model/topup_payload.dart';

class ChargeResponseModel extends ChargeResponse {
  ChargeResponseModel(
      {required super.midtrans, required super.userTransaction});

  factory ChargeResponseModel.fromJson(Map<String, dynamic> json) => ChargeResponseModel(
        midtrans: MidtransModel.fromJson(json["midtrans"]),
        userTransaction: UserTransactionModel.fromJson(json["user_transaction"]),
      );
}

class MidtransModel extends Midtrans {
  MidtransModel(
      {required super.statusCode,
      required super.statusMessage,
      required super.transactionId,
      required super.orderId,
      required super.merchantId,
      required super.grossAmount,
      required super.currency,
      required super.paymentType,
      required super.transactionTime,
      required super.transactionStatus,
      required super.fraudStatus,
      required super.vaNumbers,
      required super.expiryTime});

  factory MidtransModel.fromJson(Map<String, dynamic> json) => MidtransModel(
        statusCode: json["status_code"],
        statusMessage: json["status_message"],
        transactionId: json["transaction_id"],
        orderId: json["order_id"],
        merchantId: json["merchant_id"],
        grossAmount: json["gross_amount"],
        currency: json["currency"],
        paymentType: json["payment_type"],
        transactionTime: DateTime.parse(json["transaction_time"]),
        transactionStatus: json["transaction_status"],
        fraudStatus: json["fraud_status"],
        vaNumbers: List<VaNumber>.from(
            json["va_numbers"].map((x) => VaNumberModel.fromJson(x))),
        expiryTime: DateTime.parse(json["expiry_time"]),
      );

  Map<String, dynamic> toJson() => {
        "status_code": statusCode,
        "status_message": statusMessage,
        "transaction_id": transactionId,
        "order_id": orderId,
        "merchant_id": merchantId,
        "gross_amount": grossAmount,
        "currency": currency,
        "payment_type": paymentType,
        "transaction_time": transactionTime.toIso8601String(),
        "transaction_status": transactionStatus,
        "fraud_status": fraudStatus,
        "va_numbers": List<dynamic>.from(vaNumbers.map((x) => VaNumberModel(bank: x.bank, vaNumber: x.vaNumber).toJson())),
        "expiry_time": expiryTime.toIso8601String(),
      };
}

class UserTransactionModel extends UserTransaction {
  UserTransactionModel(
      {required super.id,
      required super.userId,
      required super.walletId,
      required super.transactionMethodId,
      required super.amount,
      required super.notes,
      required super.transactionType,
      required super.transactionStatus,
      required super.updatedAt,
      required super.createdAt});
  factory UserTransactionModel.fromJson(Map<String, dynamic> json) =>
      UserTransactionModel(
        id: json["id"],
        userId: json["user_id"],
        walletId: json["wallet_id"],
        transactionMethodId: json["transaction_method_id"],
        amount: json["amount"],
        notes: json["notes"],
        transactionType: json["transaction_type"],
        transactionStatus: json["transaction_status"],
        updatedAt: DateTime.parse(json["updatedAt"]),
        createdAt: DateTime.parse(json["createdAt"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "wallet_id": walletId,
        "transaction_method_id": transactionMethodId,
        "amount": amount,
        "notes": notes,
        "transaction_type": transactionType,
        "transaction_status": transactionStatus,
        "updatedAt": updatedAt.toIso8601String(),
        "createdAt": createdAt.toIso8601String(),
      };
}

class VaNumberModel extends VaNumber {
  VaNumberModel({required super.bank, required super.vaNumber});

  factory VaNumberModel.fromJson(Map<String, dynamic> json) => VaNumberModel(
        bank: json["bank"],
        vaNumber: json["va_number"],
      );

  Map<String, dynamic> toJson() => {
        "bank": bank,
        "va_number": vaNumber,
      };
}
