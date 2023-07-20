class Riwayat {
  final String id;
  final String userId;
  final String walletId;
  final String transactionMethodId;
  final String productId;
  final dynamic promoId;
  final int amount;
  final dynamic notes;
  final String transactionType;
  final String transactionStatus;
  final DateTime createdAt;
  final DateTime updatedAt;
  final UserTransaction userTransaction;
  final WalletTransaction walletTransaction;
  final TransactionMethod transactionMethod;
  final TransactionProduct? transactionProduct;
  final dynamic transactionDiscount;

  Riwayat({
    required this.id,
    required this.userId,
    required this.walletId,
    required this.transactionMethodId,
    required this.productId,
    this.promoId,
    required this.amount,
    this.notes,
    required this.transactionType,
    required this.transactionStatus,
    required this.createdAt,
    required this.updatedAt,
    required this.userTransaction,
    required this.walletTransaction,
    required this.transactionMethod,
    required this.transactionProduct,
    this.transactionDiscount,
  });
}

class TransactionMethod {
  final String id;
  final String methodName;
  final dynamic instruction;
  final String category;
  final bool status;

  TransactionMethod({
    required this.id,
    required this.methodName,
    this.instruction,
    required this.category,
    required this.status,
  });
}

class TransactionProduct {
  final String id;
  final String name;
  final String category;
  final String code;
  final int price;

  TransactionProduct({
    required this.id,
    required this.name,
    required this.category,
    required this.code,
    required this.price,
  });
}

class UserTransaction {
  final String id;
  final String name;
  final String phone;
  final String email;

  UserTransaction({
    required this.id,
    required this.name,
    required this.phone,
    required this.email,
  });
}

class WalletTransaction {
  final String id;
  final String userId;
  final int balance;

  WalletTransaction({
    required this.id,
    required this.userId,
    required this.balance,
  });
}
