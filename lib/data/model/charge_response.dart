class ChargeResponse {
    Midtrans midtrans;
    UserTransaction userTransaction;

    ChargeResponse({
        required this.midtrans,
        required this.userTransaction,
    });

}

class Midtrans {
    String statusCode;
    String statusMessage;
    String transactionId;
    String orderId;
    String merchantId;
    String grossAmount;
    String currency;
    String paymentType;
    DateTime transactionTime;
    String transactionStatus;
    String fraudStatus;
    List<VaNumber> vaNumbers;
    DateTime expiryTime;

    Midtrans({
        required this.statusCode,
        required this.statusMessage,
        required this.transactionId,
        required this.orderId,
        required this.merchantId,
        required this.grossAmount,
        required this.currency,
        required this.paymentType,
        required this.transactionTime,
        required this.transactionStatus,
        required this.fraudStatus,
        required this.vaNumbers,
        required this.expiryTime,
    });

}

class VaNumber {
    String bank;
    String vaNumber;

    VaNumber({
        required this.bank,
        required this.vaNumber,
    });

}

class UserTransaction {
    String id;
    String userId;
    String walletId;
    String transactionMethodId;
    int amount;
    String notes;
    String transactionType;
    String transactionStatus;
    DateTime updatedAt;
    DateTime createdAt;

    UserTransaction({
        required this.id,
        required this.userId,
        required this.walletId,
        required this.transactionMethodId,
        required this.amount,
        required this.notes,
        required this.transactionType,
        required this.transactionStatus,
        required this.updatedAt,
        required this.createdAt,
    });

}
