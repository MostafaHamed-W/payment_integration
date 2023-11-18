class PaymentInputModel {
  double amount;
  String currency;

  PaymentInputModel({required this.amount, required this.currency});

  toJson() {
    double price = amount * 100;
    return {
      "amount": price.toInt(),
      "currency": currency,
    };
  }
}
