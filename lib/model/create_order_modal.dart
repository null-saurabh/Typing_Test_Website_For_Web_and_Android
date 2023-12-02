class OrderResponse {
  final String id;
  final String entity;
  final int amount;
  final int amountPaid;
  final int amountDue;
  final String currency;
  final String receipt;
  final String? offerId;
  final String status;
  final int attempts;
  final List<dynamic> notes;
  final int createdAt;
  final String razorpayKeyId;

  OrderResponse({
    required this.id,
    required this.entity,
    required this.amount,
    required this.amountPaid,
    required this.amountDue,
    required this.currency,
    required this.receipt,
    required this.offerId,
    required this.status,
    required this.attempts,
    required this.notes,
    required this.createdAt,
    required this.razorpayKeyId,
  });

  factory OrderResponse.fromJson(Map<String, dynamic> json) {
    return OrderResponse(
      id: json['id'],
      entity: json['entity'],
      amount: json['amount'],
      amountPaid: json['amount_paid'],
      amountDue: json['amount_due'],
      currency: json['currency'],
      receipt: json['receipt'],
      offerId: json['offer_id'],
      status: json['status'],
      attempts: json['attempts'],
      notes: json['notes'],
      createdAt: json['created_at'],
      razorpayKeyId: json['razorpay_key_id'],
    );
  }
}