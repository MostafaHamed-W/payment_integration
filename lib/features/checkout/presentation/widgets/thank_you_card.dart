import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:payment/core/utils/styles.dart';

import 'order_info_item.dart';

class ThankYouCard extends StatelessWidget {
  const ThankYouCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: ShapeDecoration(
        color: const Color(0xFFe2e2e2),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 65, left: 22, right: 22),
        child: Column(
          children: [
            const Text(
              'Thank You!',
              style: Styles.styleBold25,
            ),
            const Text(
              'Your transaction was successful',
              style: Styles.style20,
            ),
            const SizedBox(height: 42),
            const OrderInfoItem(
              mainText: 'Date',
              priceText: '01/24/2023',
              mainTextStyle: Styles.style18,
              priceTextStyle: Styles.styleBold18,
            ),
            const SizedBox(height: 20),
            const OrderInfoItem(
              mainText: 'Time',
              priceText: '10:15 AM',
              mainTextStyle: Styles.style18,
              priceTextStyle: Styles.styleBold18,
            ),
            const SizedBox(height: 20),
            const OrderInfoItem(
              mainText: 'To',
              priceText: 'Mostafa Hamed',
              mainTextStyle: Styles.style18,
              priceTextStyle: Styles.styleBold18,
            ),
            const Divider(
              height: 60,
              thickness: 2,
              color: Color(0xFFC6C6C6),
            ),
            const OrderInfoItem(
              mainText: 'Total',
              priceText: r'$50.97',
              mainTextStyle: Styles.styleBold24,
              priceTextStyle: Styles.styleBold24,
            ),
            const SizedBox(height: 30),
            Container(
              height: 73,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(19),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 23),
                child: Row(
                  children: [
                    SvgPicture.asset('assets/images/mastercard.svg'),
                    const SizedBox(width: 23),
                    RichText(
                      text: const TextSpan(
                        text: 'Master Card\n',
                        style: Styles.style18,
                        children: [
                          TextSpan(
                            text: 'Mastercard **78',
                            style: Styles.style16,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const Spacer(),
            SizedBox(
              height: 70,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    FontAwesomeIcons.barcode,
                    size: 70,
                  ),
                  const SizedBox(width: 50),
                  Container(
                    width: 113,
                    height: 60,
                    decoration: ShapeDecoration(
                      shape: RoundedRectangleBorder(
                        side: const BorderSide(width: 1.50, color: Color(0xFF34A853)),
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    child: const Center(
                      child: Text(
                        'PAID',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color(0xFF34A853),
                          fontSize: 24,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w600,
                          height: 0,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: ((MediaQuery.of(context).size.height * 0.2 + 17) / 2) - 35,
            )
          ],
        ),
      ),
    );
  }
}
