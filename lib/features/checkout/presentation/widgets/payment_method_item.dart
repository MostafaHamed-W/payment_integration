import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class PaymentMethodItem extends StatefulWidget {
  final String paymentImage;

  final bool isSelected;
  final void Function()? onTap;
  const PaymentMethodItem({
    super.key,
    required this.paymentImage,
    this.onTap,
    required this.isSelected,
  });

  @override
  State<PaymentMethodItem> createState() => _PaymentMethodItemState();
}

class _PaymentMethodItemState extends State<PaymentMethodItem> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      child: AnimatedContainer(
        duration: const Duration(microseconds: 700),
        width: 111,
        height: 70,
        decoration: ShapeDecoration(
          shape: RoundedRectangleBorder(
            side: widget.isSelected
                ? const BorderSide(
                    width: 1.50,
                    color: Color(0xFF34A853),
                  )
                : const BorderSide(
                    color: Colors.grey,
                    width: 1.5,
                  ),
            borderRadius: BorderRadius.circular(15),
          ),
          shadows: [
            widget.isSelected
                ? const BoxShadow(
                    color: Color(0xFF34A853),
                    blurRadius: 4,
                    offset: Offset(0, 0),
                    spreadRadius: 0,
                  )
                : const BoxShadow(
                    offset: Offset.zero,
                    color: Colors.transparent,
                  )
          ],
        ),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Center(
            child: SvgPicture.asset(
              widget.paymentImage,
              fit: BoxFit.scaleDown,
            ),
          ),
        ),
      ),
    );
  }
}
