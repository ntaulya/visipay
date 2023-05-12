class Wallet_Withdrawal {
  String user_id;
  String wallet_id;
  String withdrawal_destination_id;
  int amount;
  String notes;
  Status status;

  Wallet_Withdrawal({
    required this.user_id,
    required this.wallet_id,
    required this.withdrawal_destination_id,
    required this.amount,
    required this.notes,
    required this.status,
  });
}

enum Status { pending, done, failed }
