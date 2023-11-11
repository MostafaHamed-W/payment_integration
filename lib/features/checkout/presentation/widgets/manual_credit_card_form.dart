import 'package:flutter/material.dart';
import 'package:payment/features/checkout/presentation/widgets/page_view_item.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'complete_pay_button.dart';
import 'custom_pay_text_field.dart';

class ManualCreditCardForm extends StatelessWidget {
  const ManualCreditCardForm({
    super.key,
    required this.pageController,
  });

  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          const SizedBox(height: 34),
          SizedBox(
            height: 192,
            child: PageView(
              controller: pageController,
              children: const [
                PageViewItem(),
                PageViewItem(),
                PageViewItem(),
              ],
            ),
          ),
          const SizedBox(height: 14),
          Center(
            child: SmoothPageIndicator(
              controller: pageController,
              count: 3,
              effect: const SlideEffect(activeDotColor: Colors.black, dotHeight: 12, dotWidth: 12),
              onDotClicked: (index) {
                pageController.animateToPage(
                  index,
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.easeInOut,
                );
              },
            ),
          ),
          const Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 25),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  SizedBox(height: 14),
                  CustomPayTextField(
                    fieldName: 'Card Number',
                  ),
                  SizedBox(height: 35),
                  Row(
                    children: [
                      Expanded(
                        flex: 2,
                        child: CustomPayTextField(
                          fieldName: 'Name',
                        ),
                      ),
                      Spacer(),
                      Expanded(
                        flex: 2,
                        child: CustomPayTextField(
                          fieldName: 'Card ID',
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 35),
                  Row(
                    children: [
                      Expanded(
                        flex: 2,
                        child: CustomPayTextField(
                          fieldName: 'Expiration Date',
                        ),
                      ),
                      Spacer(
                        flex: 1,
                      ),
                      Expanded(
                        flex: 2,
                        child: CustomPayTextField(
                          fieldName: 'Cvv',
                        ),
                      ),
                      // Spacer(),
                    ],
                  ),
                  Spacer(),
                  CompletePayButton(
                    btnText: 'Pay',
                  ),
                  SizedBox(height: 30)
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
