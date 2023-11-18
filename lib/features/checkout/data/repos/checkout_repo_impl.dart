import 'package:dartz/dartz.dart';
import 'package:payment/core/errors/failures.dart';
import 'package:payment/core/utils/services/stripe_service.dart';
import 'package:payment/features/checkout/data/models/payment_input_model.dart/payment_input_model.dart';
import 'package:payment/features/checkout/data/repos/checkout_repo.dart';

class CheckoutRepoImpl extends CheckoutRepo {
  StripeServices stripeServices = StripeServices();

  @override
  Future<Either<Failure, double>> makePayment(
      {required PaymentInputModel paymentInputModel}) async {
    try {
      await stripeServices.makePayment(paymentInputModel: paymentInputModel);
      return right(paymentInputModel.amount);
    } catch (e) {
      return left(ServerFailure(errMessage: e.toString()));
    }
  }
}
