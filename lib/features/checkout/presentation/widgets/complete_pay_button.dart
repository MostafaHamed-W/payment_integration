import 'package:flutter/material.dart';

import '../../../../core/utils/styles.dart';

class CompletePayButton extends StatelessWidget {
  final void Function()? onPress;
  final String btnText;
  final bool isLoading;
  const CompletePayButton({
    super.key,
    this.onPress,
    this.isLoading = false,
    required this.btnText,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Container(
        width: double.infinity,
        height: 57,
        decoration: BoxDecoration(
          color: const Color(0xFF34A853),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Center(
          child: isLoading
              ? const CircularProgressIndicator(
                  color: Colors.white,
                )
              : Text(
                  btnText,
                  style: Styles.style22,
                ),
        ),
      ),
    );
  }
}
