// To parse this JSON data, do
//
//     final productList = productListFromJson(jsonString);

import 'dart:convert';

ProductList productListFromJson(String str) => ProductList.fromJson(json.decode(str));

String productListToJson(ProductList data) => json.encode(data.toJson());

class ProductList {
    int status;
    String message;
    List<Datum> data;

    ProductList({
        required this.status,
        required this.message,
        required this.data,
    });

    factory ProductList.fromJson(Map<String, dynamic> json) => ProductList(
        status: json["status"],
        message: json["message"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class Datum {
    int id;
    String productName;
    int qty;
    String reqularPrice;
    String salePrice;
    String image;
    String description;
    String category;
    DateTime createdAt;
    DateTime updatedAt;

    Datum({
        required this.id,
        required this.productName,
        required this.qty,
        required this.reqularPrice,
        required this.salePrice,
        required this.image,
        required this.description,
        required this.category,
        required this.createdAt,
        required this.updatedAt,
    });

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        productName: json["product_name"],
        qty: json["qty"],
        reqularPrice: json["reqular_price"],
        salePrice: json["sale_price"],
        image: json["image"],
        description: json["description"],
        category: json["category"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "product_name": productName,
        "qty": qty,
        "reqular_price": reqularPrice,
        "sale_price": salePrice,
        "image": image,
        "description": description,
        "category": category,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
    };
}
