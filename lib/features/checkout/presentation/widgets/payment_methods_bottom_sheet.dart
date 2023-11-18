import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:payment/features/checkout/data/models/payment_input_model.dart/payment_input_model.dart';
import 'package:payment/features/checkout/presentation/manager/cubit/payment_cubit.dart';
import 'package:payment/features/checkout/presentation/views/thank_you_view.dart';
import 'package:payment/features/checkout/presentation/widgets/complete_pay_button.dart';
import 'package:payment/features/checkout/presentation/widgets/payment_method_listview.dart';

class PaymentMethodsBottomSheet extends StatelessWidget {
  const PaymentMethodsBottomSheet({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    PaymentInputModel inputModel = PaymentInputModel(amount: 350, currency: 'usd');
    return SafeArea(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 30),
            child: PaymentMethodsListView(),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 20, left: 20, bottom: 20),
            child: CustomButtonBlocConsumer(inputModel: inputModel),
          ),
        ],
      ),
    );
  }
}

class CustomButtonBlocConsumer extends StatelessWidget {
  const CustomButtonBlocConsumer({
    super.key,
    required this.inputModel,
  });

  final PaymentInputModel inputModel;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PaymentCubit, PaymentState>(
      listener: (context, state) {
        if (state is PaymentSuccess) {
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => ThankYouView(amount: state.amount)));
        }

        if (state is PaymentFailure) {
          Navigator.pop(context);
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.errMessage)));
        }
      },
      builder: (context, state) {
        return CompletePayButton(
          btnText: 'Continue',
          isLoading: state is PaymentLoading ? true : false,
          onPress: () async {
            BlocProvider.of<PaymentCubit>(context).makePayment(inputModel);
          },
        );
      },
    );
  }
}
