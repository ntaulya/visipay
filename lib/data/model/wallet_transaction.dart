class Wallet_Transaction {
  String user_id;
  String wallet_id;
  String transaction_method;
  int amount;
  String notes;
  TransactionType transaction_type;
  TransactionStatus transaction_status;

  Wallet_Transaction({
    required this.user_id,
    required this.wallet_id,
    required this.transaction_method,
    required this.amount,
    required this.notes,
    required this.transaction_type,
    required this.transaction_status,
  });
}

enum TransactionType { debit, credit }
enum TransactionStatus { pending, done, failed }
