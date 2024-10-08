import 'package:widgets_responsive/local_database/product_local/duplicate_order.dart';

class OrderModel {
  final int? id;
  final int productId;
  final int quantity;
  final double totalPrice;
  final DateTime orderDate;

  // Constructor
  OrderModel({
    this.id,
    required this.productId,
    required this.quantity,
    required this.totalPrice,
    required this.orderDate,
  });

  // Convert OrderModel to a Map (for database operations)
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'product_id': productId,
      'quantity': quantity,
      'total_price': totalPrice,
      'order_date': orderDate.toIso8601String(),
    };
  }

  // Factory constructor to create OrderModel from a Map
  factory OrderModel.fromMap(Map<String, dynamic> map) {
    return OrderModel(
      id: map['id'] as int?,
      productId: map['product_id'] as int,
      quantity: map['quantity'] as int,
      totalPrice: (map['total_price'] as num).toDouble(),
      orderDate: DateTime.parse(map['order_date'] as String),
    );
  }

  // Method to convert OrderModel to OrderSummary (lightweight)
  // OrderSummary toSummary() {
  //   return OrderSummary(
  //     id: id,
  //     productId: productId,
  //     totalPrice: totalPrice,
  //   );
  // }
  OrderSummary toSummary() {
    return OrderSummary(
      id: id,
      productId: productId,
      totalPrice: totalPrice,
    );
  }
}
