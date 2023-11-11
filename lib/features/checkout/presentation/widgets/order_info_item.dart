import 'package:flutter/material.dart';

class OrderInfoItem extends StatelessWidget {
  final String mainText;
  final String priceText;
  final TextStyle textStyle;
  const OrderInfoItem({
    super.key,
    required this.mainText,
    required this.priceText,
    required this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          mainText,
          style: textStyle,
        ),
        Text(
          priceText,
          style: textStyle,
        ),
      ],
    );
  }
}
