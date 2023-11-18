import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:payment/core/utils/api_keys.dart';
import 'package:payment/core/utils/services/api_service.dart';
import 'package:payment/features/checkout/data/models/payment_input_model.dart/payment_input_model.dart';
import 'package:payment/features/checkout/data/models/payment_intent_model/payment_intent_model.dart';

//steps of integration process
/*
1- PaymentIntentObject createPaymentIntent(amount,currency)
2- initPaymentSheet()
3- presentPaymentSheet()
*/

class StripeServices {
  final ApiService apiService = ApiService();

  // 1- create payment intent
  Future<PaymentIntentModel> createPaymentIntent(PaymentInputModel paymentInputModel) async {
    var response = await apiService.post(
      url: 'https://api.stripe.com/v1/payment_intents',
      body: paymentInputModel.toJson(),
      token: ApiKeys.apiSecretKey,
      contentType: 'application/x-www-form-urlencoded',
    );

    var model = PaymentIntentModel.fromJson(response.data);
    return model;
  }

  //2- init payment sheet
  Future<void> initPaymentSheet(paymentIntentClientSecret) async {
    await Stripe.instance.initPaymentSheet(
      paymentSheetParameters: SetupPaymentSheetParameters(
        paymentIntentClientSecret: paymentIntentClientSecret,
        merchantDisplayName: 'Flutter Stripe Store Demo',
      ),
    );
  }

  Future<void> presentPaymentSheet() async {
    await Stripe.instance.presentPaymentSheet();
  }

  // make one method that call the previous three models to make payment process
  Future<void> makePayment({required PaymentInputModel paymentInputModel}) async {
    var paymentIntentModel = await createPaymentIntent(paymentInputModel);
    await initPaymentSheet(paymentIntentModel.clientSecret);
    await presentPaymentSheet();
  }
}
