import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

class PaymentRepo extends StatefulWidget {
  const PaymentRepo({super.key});

  @override
  State<PaymentRepo> createState() => _PaymentRepoState();
}

class _PaymentRepoState extends State<PaymentRepo> {
  bool _ready = false;
  Future<void> initPaymentSheet() async {
    try {
      // 2. initialize the payment sheet
      await Stripe.instance.initPaymentSheet(
        paymentSheetParameters: SetupPaymentSheetParameters(
          // Main params
          merchantDisplayName: 'Flutter Stripe Store Demo',
          // paymentIntentClientSecret: data['paymentIntent'],
        ),
      );
      setState(() {
        _ready = true;
      });
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error: $e')),
      );
      rethrow;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
