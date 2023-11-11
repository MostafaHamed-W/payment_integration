import 'package:flutter/cupertino.dart';
import 'package:payment/features/checkout/presentation/widgets/payment_method_item.dart';

class PaymentMethodsListView extends StatefulWidget {
  const PaymentMethodsListView({super.key});

  @override
  State<PaymentMethodsListView> createState() => _PaymentMethodsListViewState();
}

class _PaymentMethodsListViewState extends State<PaymentMethodsListView> {
  List<bool> isActive = [true, false, false];
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        PaymentMethodItem(
          paymentImage: 'assets/images/card.svg',
          onTap: () {
            setState(() {
              isActive = [true, false, false];
            });
          },
          isSelected: isActive[0],
        ),
        PaymentMethodItem(
          paymentImage: 'assets/images/paypal.svg',
          onTap: () {
            setState(() {
              isActive = [false, true, false];
            });
          },
          isSelected: isActive[1],
        ),
        PaymentMethodItem(
          paymentImage: 'assets/images/apple_pay.svg',
          onTap: () {
            setState(() {
              isActive = [false, false, true];
            });
          },
          isSelected: isActive[2],
        ),
      ],
    );
  }
}
