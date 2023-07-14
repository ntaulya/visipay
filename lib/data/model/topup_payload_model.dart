import 'package:visipay/data/model/topup_payload.dart';

class TopupPayloadModel extends TopupPayload {
  TopupPayloadModel(
      {required super.paymentType,
      required super.notes,
      required super.bankTransfer,
      required super.transactionDetails});
  Map<String, dynamic> toJson() {
    return {
      'payment_type': paymentType,
      'notes': notes,
      'bank_transfer': BankTransferModel(bank: bankTransfer.bank).toJson(),
      'transaction_details': TransactionDetailsModel(grossAmount: transactionDetails.grossAmount).toJson(),
    };
  }

  factory TopupPayloadModel.fromJson(Map<String, dynamic> json) =>
      TopupPayloadModel(
        paymentType: json["payment_type"],
        notes: json["notes"],
        bankTransfer: BankTransferModel.fromJson(json["bank_transfer"]),
        transactionDetails:
            TransactionDetailsModel.fromJson(json["transaction_details"]),
      );
}

class BankTransferModel extends BankTransfer {
  BankTransferModel({required super.bank});
  Map<String, dynamic> toJson() {
    return {
      'bank': bank,
    };
  }

  factory BankTransferModel.fromJson(Map<String, dynamic> json) =>
      BankTransferModel(
        bank: json["bank"],
      );
}

class TransactionDetailsModel extends TransactionDetails {
  TransactionDetailsModel({required super.grossAmount});

  Map<String, dynamic> toJson() {
    return {
      'gross_amount': grossAmount,
    };
  }

  factory TransactionDetailsModel.fromJson(Map<String, dynamic> json) =>
      TransactionDetailsModel(
        grossAmount: json["gross_amount"],
      );
}
