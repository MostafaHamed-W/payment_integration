class PaymentInputModel {
  double amount;
  String currency;

  PaymentInputModel({required this.amount, required this.currency});

  toJson() {
    return {
      "amount": amount,
      "currency": currency,
    };
  }
}
