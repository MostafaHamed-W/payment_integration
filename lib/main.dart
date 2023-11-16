import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:payment/core/utils/constants.dart';
import 'package:payment/features/checkout/presentation/views/chart_view.dart';

void main() async {
  Stripe.publishableKey = stripePublishableKey;
  runApp(const HomeView());
}

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CartView(),
    );
  }
}

//steps of integration process
/*
1- PaymentIntentObject createPaymentIntent(amount,currency)
2- initPaymentSheet()
3- presentPaymentSheet()
*/
