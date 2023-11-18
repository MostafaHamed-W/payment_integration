import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../widgets/custom_app_bar.dart';
import '../widgets/custom_dashed_line.dart';
import '../widgets/custom_white_circle.dart';
import '../widgets/thank_you_card.dart';

class ThankYouView extends StatelessWidget {
  final double amount;
  const ThankYouView({super.key, required this.amount});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context, title: ''),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              ThankYouCard(
                amount: amount,
              ),
              Positioned(
                  bottom: MediaQuery.of(context).size.height * 0.2 + 17,
                  left: 0,
                  right: 0,
                  child: const CustomDashedLine()),
              const LeftWhiteCircle(),
              const RightWhiteCircle(),
              const Positioned(
                left: 0,
                right: 0,
                top: -50,
                child: CircleAvatar(
                  radius: 50,
                  backgroundColor: Color(0xFFe2e2e2),
                  child: CustomCheckShape(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomCheckShape extends StatelessWidget {
  const CustomCheckShape({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 40,
      backgroundColor: Colors.green,
      child: SvgPicture.asset('assets/images/check.svg'),
    );
  }
}
