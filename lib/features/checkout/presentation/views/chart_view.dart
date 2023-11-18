import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:payment/core/utils/styles.dart';
import 'package:payment/features/checkout/data/models/payment_input_model.dart/payment_input_model.dart';
import 'package:payment/features/checkout/data/repos/checkout_repo.dart';
import 'package:payment/features/checkout/data/repos/checkout_repo_impl.dart';
import 'package:payment/features/checkout/presentation/manager/cubit/payment_cubit.dart';
import 'package:payment/features/checkout/presentation/views/thank_you_view.dart';
import 'package:payment/features/checkout/presentation/widgets/payment_methods_bottom_sheet.dart';
import '../widgets/complete_pay_button.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/order_info_item.dart';
import '../widgets/payment_method_listview.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context, title: 'My Cart', isFirstPage: true),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              const SizedBox(height: 20),
              Expanded(
                child: Image.asset(
                  'assets/images/paymentPhoto.png',
                  fit: BoxFit.fitWidth,
                ),
              ),
              const SizedBox(height: 30),
              const OrderInfoItem(
                mainText: 'Order Subtotal',
                priceText: r'$42.97',
                mainTextStyle: Styles.style20,
              ),
              const OrderInfoItem(
                mainText: 'Discount',
                priceText: r'$0',
                mainTextStyle: Styles.style20,
              ),
              const OrderInfoItem(
                mainText: 'Shipping',
                priceText: r'$9',
                mainTextStyle: Styles.style20,
              ),
              const Divider(
                thickness: 2,
                height: 50,
                color: Color(0xFFC7C7C7),
                indent: 15,
                endIndent: 15,
              ),
              const OrderInfoItem(
                mainText: 'Total',
                priceText: r'$50.97',
                mainTextStyle: Styles.styleBold20,
              ),
              const SizedBox(height: 17),
              CompletePayButton(
                  btnText: 'Complete Payment',
                  onPress: () {
                    showModalBottomSheet(
                        context: context,
                        builder: (BuildContext context) {
                          return BlocProvider(
                            create: (context) => PaymentCubit(CheckoutRepoImpl()),
                            child: const PaymentMethodsBottomSheet(),
                          );
                        });
                  }),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
