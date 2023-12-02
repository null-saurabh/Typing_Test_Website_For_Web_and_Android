
import 'package:flutter/material.dart';
import 'package:typingtest/view_model/services/razorpay_services.dart';

class RazorPayProvider extends ChangeNotifier {
  final RazorpayService _razorpayService = RazorpayService();

  RazorPayProvider() {
    _razorpayService.initialize();
  }

  set onSuccess(VoidCallback? callback) => _razorpayService.onSuccess = callback;
  set onError(VoidCallback? callback) => _razorpayService.onError = callback;
  set onPaymentFailure(VoidCallback? callback) => _razorpayService.onPaymentFailure = callback;

  void openCheckout({required int amount,required String key, required String name, required String email, required String orderId}) {
    _razorpayService.openCheckout(amount: amount,key: key,name: name,email: email, orderId: orderId);
  }

  @override
  void dispose() {
    _razorpayService.dispose();
    super.dispose();
  }
}
