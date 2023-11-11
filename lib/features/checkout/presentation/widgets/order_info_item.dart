import 'package:flutter/material.dart';

class OrderInfoItem extends StatelessWidget {
  final String mainText;
  final String priceText;
  final TextStyle mainTextStyle;
  final TextStyle? priceTextStyle;
  const OrderInfoItem({
    super.key,
    required this.mainText,
    required this.priceText,
    required this.mainTextStyle,
    this.priceTextStyle,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          mainText,
          style: mainTextStyle,
        ),
        Text(
          priceText,
          style: priceTextStyle ?? mainTextStyle,
        ),
      ],
    );
  }
}
