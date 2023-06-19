class Promo {
  String id;
  String name;
  String description;
  double discount;
  int min_order;
  DateTime expired_at;
  
  Promo({
    required this.id,
    required this.name,
    required this.description,
    required this.discount,
    required this.min_order,
    required this.expired_at,
  });
}