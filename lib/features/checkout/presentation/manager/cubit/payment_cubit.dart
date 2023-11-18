import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:payment/features/checkout/data/models/ephemeral_key/ephemeral_key.dart';
import 'package:payment/features/checkout/data/models/payment_input_model.dart/payment_input_model.dart';
import 'package:payment/features/checkout/data/repos/checkout_repo.dart';

part 'payment_state.dart';

class PaymentCubit extends Cubit<PaymentState> {
  PaymentCubit(this.checkoutRepo) : super(PaymentInitial());
  final CheckoutRepo checkoutRepo;

  Future makePayment(PaymentInputModel paymentInputModel) async {
    emit(PaymentLoading());
    var data = await checkoutRepo.makePayment(paymentInputModel: paymentInputModel);
    data.fold((l) {
      emit(PaymentFailure(errMessage: l.toString()));
    }, (r) {
      emit(PaymentSuccess(amount: r));
    });
  }
}
