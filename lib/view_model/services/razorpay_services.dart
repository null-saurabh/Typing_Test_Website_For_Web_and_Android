
import 'package:flutter/material.dart';
import 'package:flutter_razorpay_web/flutter_razorpay_web.dart';


class RazorpayService {
  late RazorpayWeb _razorpay = RazorpayWeb();

  VoidCallback? _onSuccess;
  VoidCallback? _onError;
  VoidCallback? _onPaymentFailure;

  set onSuccess(VoidCallback? callback) => _onSuccess = callback;
  set onError(VoidCallback? callback) => _onError = callback;
  set onPaymentFailure(VoidCallback? callback) => _onPaymentFailure = callback;


  void initialize() {
    _razorpay = RazorpayWeb(
      onSuccess: _handlePaymentSuccess,
      onCancel: _handlePaymentCancel,
      onFailed: _handlePaymentError,
    );
  //   _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
  //   _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
  //   _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handlePaymentCancel);
  }

  void _handlePaymentSuccess(RpaySuccessResponse response) {
    if (_onSuccess != null) _onSuccess!();
  }

  void _handlePaymentError(RpayFailedResponse response) {
    if (_onError != null) _onError!();
    if (_onPaymentFailure != null) _onPaymentFailure!();
  }

  void _handlePaymentCancel(RpayCancelResponse response) {
    // Handle external wallet event
  }

  void openCheckout({required int amount,required String key,required String name,required String email,required String orderId}) {

    final options = {
      'key': key,
      'amount': amount,
      'currency' : "INR",
      'name': "A1 Typing",
      'timeout': 200,
      'order_id': orderId,
      'description':'Subscription Fee',
      'retry': {'enabled': true, 'max_count': 1},
      'send_sms_hash': true,
      'prefill': {'email': email,'name':name},
    };
    try{
      _razorpay.open(options);
    }
    catch(error){
      throw Exception("RazorPay error$error");
    }
  }

  void dispose() {
    _razorpay.clear();
  }
}
