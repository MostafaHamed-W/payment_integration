import 'package:dio/dio.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:payment/core/utils/api_keys.dart';
import 'package:payment/core/utils/services/api_service.dart';
import 'package:payment/features/checkout/data/models/ephemeral_key/ephemeral_key.dart';
import 'package:payment/features/checkout/data/models/init_sheet_model/init_sheet_model.dart';
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
  /* 
    if we didnot add customerId ,customerEphemeralKeySecret 
    we wan't be able to save the customer credit card for future using
    and it will be like a guest payment process
  */
  Future<void> initPaymentSheet(InitSheetModel initSheetModel) async {
    await Stripe.instance.initPaymentSheet(
      paymentSheetParameters: SetupPaymentSheetParameters(
        paymentIntentClientSecret: initSheetModel.clientSecret,
        customerEphemeralKeySecret: initSheetModel.ephemeralKey,
        customerId: initSheetModel.customerId,
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
    EphemeralKeyModel ephemeralKeyModel = await createEphemeralKey(paymentInputModel);
    await initPaymentSheet(InitSheetModel(
      clientSecret: paymentIntentModel.clientSecret,
      ephemeralKey: ephemeralKeyModel.secret,
      customerId: paymentIntentModel.customer,
    ));
    await presentPaymentSheet();
  }

  //create ephemeral key
  Future<EphemeralKeyModel> createEphemeralKey(PaymentInputModel paymentInputModel) async {
    Dio dio = Dio();
    final response = await dio.post(
      'https://api.stripe.com/v1/ephemeral_keys',
      queryParameters: {'customer': ApiKeys.customerId},
      options: Options(
        headers: {
          "Authorization": "Bearer ${ApiKeys.apiSecretKey}",
          'Stripe-Version': '2020-08-27',
        },
      ),
    );
    var model = EphemeralKeyModel.fromJson(response.data);
    return model;
  }
}
