class TransactionModel {
  final String id;
  final String userId;
  final double amount;
  final String transactionDate;
  final String transactionType;
  final String status;

  TransactionModel({
    required this.id,
    required this.userId,
    required this.amount,
    required this.transactionDate,
    required this.transactionType,
    required this.status,
  });

  factory TransactionModel.fromJson(Map<String, dynamic> json) {
    return TransactionModel(
      id: json['id'],
      userId: json['user_id'],
      amount: json['amount'],
      transactionDate: json['transaction_date'],
      transactionType: json['transaction_type'],
      status: json['status'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'user_id': userId,
      'amount': amount,
      'transaction_date': transactionDate,
      'transaction_type': transactionType,
      'status': status,
    };
  }
}
