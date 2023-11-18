import 'package:dartz/dartz.dart';
import 'package:payment/core/errors/failures.dart';
import 'package:payment/features/checkout/data/models/payment_input_model.dart/payment_input_model.dart';

abstract class CheckoutRepo {
  // we used dartz package to make Either class
  // we make either class to return left side in case of failure
  // and return void in case of success because our process did not return any thing
  Future<Either<Failure, double>> makePayment({required PaymentInputModel paymentInputModel});

  //in errors folder we make class called Failure and class named ServerFailure extends Failure
}
