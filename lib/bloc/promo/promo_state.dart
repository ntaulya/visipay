part of 'promo_bloc.dart';

abstract class PromoState {}

class PromoLoading extends PromoState {
}

class PromoLoaded extends PromoState {
  final List<Promo> promo;

  PromoLoaded(this.promo);
}

class PromoError extends PromoState {
  final String error_message;

  PromoError(this.error_message);
}