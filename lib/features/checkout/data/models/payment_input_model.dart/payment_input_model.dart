class PaymentInputModel {
  double amount;
  String currency;
  String customId;

  PaymentInputModel(
      {required this.amount, required this.currency, required this.customId});

  toJson() {
    double price = amount * 100;
    return {
      "amount": price.toInt(),
      "currency": currency,
      "customer": customId
    };
  }
}
