import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:payment/features/checkout/presentation/views/thank_you_view.dart';
import 'package:payment/features/checkout/presentation/widgets/complete_pay_button.dart';
import 'package:payment/features/checkout/presentation/widgets/custom_app_bar.dart';
import '../widgets/custom_credit_card.dart';

class PaymentDetailsView extends StatefulWidget {
  const PaymentDetailsView({super.key});

  @override
  State<PaymentDetailsView> createState() => _PaymentDetailsViewState();
}

class _PaymentDetailsViewState extends State<PaymentDetailsView> {
  GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context, title: 'Payment Details'),
      body: SafeArea(
        //replace singleChildScrollView with CustomScrollView
        // to can make the effect of spacer widget to button of payment

        child: CustomScrollView(
          slivers: [
            // const SliverToBoxAdapter(
            //   child: PaymentMethodsListView(),
            // ),
            SliverToBoxAdapter(
              // using credit card package
              child: CustomCreditCard(
                formKey: formKey,
                autovalidateMode: autovalidateMode,
              ),
              // manual page i made to pay
              // ManualCreditCardForm(pageController: pageController)
            ),
            SliverFillRemaining(
              hasScrollBody: false,
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding:
                      const EdgeInsets.only(left: 20, right: 20, bottom: 20),
                  child: CompletePayButton(
                    btnText: 'Pay',
                    onPress: () {
                      if (formKey.currentState!.validate()) {
                        formKey.currentState!.save();
                        log('payment process success');
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const ThankYouView(
                                    amount: 20,
                                  )),
                        );
                      } else {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const ThankYouView(
                                    amount: 20,
                                  )),
                        );
                        autovalidateMode = AutovalidateMode.always;
                      }
                    },
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
