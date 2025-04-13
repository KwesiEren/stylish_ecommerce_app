class OrderModel {
  final String orderId;
  final String productId;
  final int quantity;
  final String userId;
  final int credit;
  final String address;
  final Map<String, dynamic> gpsLocation;

  OrderModel({
    required this.orderId,
    required this.productId,
    required this.quantity,
    required this.userId,
    required this.credit,
    required this.address,
    required this.gpsLocation,
  });

  factory OrderModel.fromMap(Map<String, dynamic> map) {
    return OrderModel(
      orderId: map['order_id'],
      productId: map['product_id'],
      quantity: map['quantity'],
      userId: map['user_id'],
      credit: map['credit'],
      address: map['address'],
      gpsLocation: Map<String, dynamic>.from(map['gps_location']),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'order_id': orderId,
      'product_id': productId,
      'quantity': quantity,
      'user_id': userId,
      'credit': credit,
      'address': address,
      'gps_location': gpsLocation,
    };
  }
}
