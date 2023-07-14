part of 'transaction_method_bloc.dart';

abstract class TransactionMethodState {}

class TransactionMethodLoading extends TransactionMethodState {
}

class TransactionMethodLoaded extends TransactionMethodState {
  final List<Transaction_Method> items;

  TransactionMethodLoaded({
    this.items = const <Transaction_Method>[]
  });
}

class TransactionMethodError extends TransactionMethodState {
  final String error_message;

  TransactionMethodError(this.error_message);
}