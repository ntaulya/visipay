class Riwayat {
  String id;
  String user_id;
  String wallet_id;
  int amount;
  String? notes;
  String transaction_type;
  String transaction_status;
  DateTime createdAt;

  Riwayat({
    required this.id,
    required this.user_id,
    required this.wallet_id,
    required this.amount,
    required this.notes,
    required this.transaction_type,
    required this.transaction_status,
    required this.createdAt,
  });
}

enum TransactionType { debit, credit }
enum TransactionStatus { pending, done, failed }
