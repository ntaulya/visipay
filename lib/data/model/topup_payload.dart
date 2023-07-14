class TopupPayload {
    String paymentType;
    String notes;
    BankTransfer bankTransfer;
    TransactionDetails transactionDetails;

    TopupPayload({
        required this.paymentType,
        required this.notes,
        required this.bankTransfer,
        required this.transactionDetails,
    });

}

class BankTransfer {
    String bank;

    BankTransfer({
        required this.bank,
    });

}

class TransactionDetails {
    int grossAmount;

    TransactionDetails({
        required this.grossAmount,
    });

}
