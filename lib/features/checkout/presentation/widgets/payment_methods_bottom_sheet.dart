import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_paypal_payment/flutter_paypal_payment.dart';
import 'package:payment/core/utils/api_keys.dart';
import 'package:payment/core/utils/services/stripe_service.dart';
import 'package:payment/features/checkout/data/item_model/item.dart';
import 'package:payment/features/checkout/data/item_model/item_model.dart';
import 'package:payment/features/checkout/data/models/amount_model/amount_model.dart';
import 'package:payment/features/checkout/data/models/amount_model/details.dart';
import 'package:payment/features/checkout/data/models/payment_input_model.dart/payment_input_model.dart';
import 'package:payment/features/checkout/presentation/manager/cubit/payment_cubit.dart';
import 'package:payment/features/checkout/presentation/views/thank_you_view.dart';
import 'package:payment/features/checkout/presentation/widgets/complete_pay_button.dart';
import 'package:payment/features/checkout/presentation/widgets/payment_method_listview.dart';

class PaymentMethodsBottomSheet extends StatelessWidget {
  const PaymentMethodsBottomSheet({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    PaymentInputModel inputModel =
        PaymentInputModel(amount: 350, currency: 'usd', customId: ApiKeys.customerId);
    return SafeArea(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 30),
            child: PaymentMethodsListView(),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 20, left: 20, bottom: 20),
            child: CustomButtonBlocConsumer(inputModel: inputModel),
          ),
        ],
      ),
    );
  }
}

class CustomButtonBlocConsumer extends StatelessWidget {
  const CustomButtonBlocConsumer({
    super.key,
    required this.inputModel,
  });

  final PaymentInputModel inputModel;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PaymentCubit, PaymentState>(
      listener: (context, state) {
        if (state is PaymentSuccess) {
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => ThankYouView(amount: state.amount)));
        }

        if (state is PaymentFailure) {
          Navigator.pop(context);
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.errMessage)));
        }
      },
      builder: (context, state) {
        return CompletePayButton(
          btnText: 'Continue',
          isLoading: state is PaymentLoading ? true : false,
          onPress: () {
            // Credit Card Payment Method
            // BlocProvider.of<PaymentCubit>(context).makePayment(inputModel);

            //Paypal Payment Method
            var transactionsData = getTransactions();
            executePaypalPayment(context, transactionsData);
          },
        );
      },
    );
  }

  void executePaypalPayment(
      BuildContext context, ({AmountModel amount, ItemModel item}) transactionsData) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (BuildContext context) => PaypalCheckoutView(
        sandboxMode: true,
        clientId: PaypalKeys.clientId,
        secretKey: PaypalKeys.secretKey,
        transactions: [
          {
            "amount": transactionsData.amount.toJson(),
            "description": "The payment transaction description.",
            "item_list": transactionsData.item.toJson()
          }
        ],
        note: "Contact us for any questions on your order.",
        onSuccess: (Map params) async {
          log("onSuccess: $params");
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => const ThankYouView(amount: 100)));
        },
        onError: (error) {
          log("onError: $error");
          Navigator.pop(context);
        },
        onCancel: () {
          print('cancelled:');
          Navigator.pop(context);
        },
      ),
    ));
  }
}

({AmountModel amount, ItemModel item}) getTransactions() {
  Details details = Details(subtotal: '100', shipping: '0', shippingDiscount: 0);
  AmountModel amountModel = AmountModel(total: '100', currency: 'USD', details: details);
  ItemModel itemModel = ItemModel(items: [
    Item(name: "Apple", quantity: 4, price: '10', currency: "USD"),
    Item(name: "Pineapple", quantity: 5, price: '12', currency: "USD"),
  ]);

  return (amount: amountModel, item: itemModel);
}
