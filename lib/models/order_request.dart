import 'dart:convert';

RequestOrder requestOrderFromJson(String str) => RequestOrder.fromJson(json.decode(str));

String requestOrderToJson(RequestOrder data) => json.encode(data.toJson());

class RequestOrder {
    final String userId;
    final List<OrderItem> orderItem;
    final int ordertotal;
    final int deliverycharge;
    final int grandtotal;
    final String deliveryAddress;
    final String storeAddress;
    final String paymentMethod;
    final String storeId;
    final List<double> storecoords;
    final List<double> recipientcoords;
    final String driverId;
    final String promoCode;
    final int discount;

    RequestOrder({
        required this.userId,
        required this.orderItem,
        required this.ordertotal,
        required this.deliverycharge,
        required this.grandtotal,
        required this.deliveryAddress,
        required this.storeAddress,
        required this.paymentMethod,
        required this.storeId,
        required this.storecoords,
        required this.recipientcoords,
        required this.driverId,
        required this.promoCode,
        required this.discount,
    });

    factory RequestOrder.fromJson(Map<String, dynamic> json) => RequestOrder(
        userId: json["userId"],
        orderItem: List<OrderItem>.from(json["orderItem"].map((x) => OrderItem.fromJson(x))),
        ordertotal: json["ordertotal"],
        deliverycharge: json["deliverycharge"],
        grandtotal: json["grandtotal"],
        deliveryAddress: json["deliveryAddress"],
        storeAddress: json["storeAddress"],
        paymentMethod: json["paymentMethod"],
        storeId: json["storeId"],
        storecoords: List<double>.from(json["storecoords"].map((x) => x?.toDouble())),
        recipientcoords: List<double>.from(json["recipientcoords"].map((x) => x?.toDouble())),
        driverId: json["driverId"],
        promoCode: json["promoCode"],
        discount: json["discount"],
    );

    Map<String, dynamic> toJson() => {
        "userId": userId,
        "orderItem": List<dynamic>.from(orderItem.map((x) => x.toJson())),
        "ordertotal": ordertotal,
        "deliverycharge": deliverycharge,
        "grandtotal": grandtotal,
        "deliveryAddress": deliveryAddress,
        "storeAddress": storeAddress,
        "paymentMethod": paymentMethod,
        "storeId": storeId,
        "storecoords": List<dynamic>.from(storecoords.map((x) => x)),
        "recipientcoords": List<dynamic>.from(recipientcoords.map((x) => x)),
        "driverId": driverId,
        "promoCode": promoCode,
        "discount": discount,
    };
}

class OrderItem {
    final String itemId;
    final int quantity;
    final int price;
    final List<String>? additives;
    final String? instruction;
    final List<DateTime> deliveryTime;

    OrderItem({
        required this.itemId,
        required this.quantity,
        required this.price,
        this.additives,
        this.instruction,
        required this.deliveryTime,
    });

    factory OrderItem.fromJson(Map<String, dynamic> json) => OrderItem(
        itemId: json["itemId"],
        quantity: json["quantity"],
        price: json["price"],
        additives: List<String>.from(json["additives"].map((x) => x)),
        instruction: json["instruction"],
        deliveryTime: List<DateTime>.from(json["deliveryTime"].map((x) => DateTime.parse(x))),
    );

    Map<String, dynamic> toJson() => {
        "itemId": itemId,
        "quantity": quantity,
        "price": price,
        "additives": List<dynamic>.from(additives!.map((x) => x)),
        "instruction": instruction,
        "deliveryTime": List<dynamic>.from(deliveryTime.map((x) => x.toIso8601String())),
    };
}