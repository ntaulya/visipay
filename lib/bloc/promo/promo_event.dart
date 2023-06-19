part of 'promo_bloc.dart';

abstract class PromoEvent {}

class PromoListInisiate extends PromoEvent{}

class PromoDetailInisiate extends PromoEvent{
  final String id;

  PromoDetailInisiate(this.id);
}
