// To parse this JSON data, do
//
//     final productEntry = productEntryFromJson(jsonString);

import 'dart:convert';

List<ProductEntry> productEntryFromJson(String str) => List<ProductEntry>.from(json.decode(str).map((x) => ProductEntry.fromJson(x)));

String productEntryToJson(List<ProductEntry> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ProductEntry {
    String pk;
    String name;
    int price;
    String description;
    String thumbnail;
    String category;
    bool isFeatured;
    int user;

    ProductEntry({
        required this.pk,
        required this.name,
        required this.price,
        required this.description,
        required this.thumbnail,
        required this.category,
        required this.isFeatured,
        required this.user,
    });

    factory ProductEntry.fromJson(Map<String, dynamic> json) => ProductEntry(
        pk: json["pk"],
        name: json["name"],
        price: json["price"],
        description: json["description"],
        thumbnail: json["thumbnail"],
        category: json["category"],
        isFeatured: json["is_featured"],
        user: json["user"],
    );

    Map<String, dynamic> toJson() => {
        "pk": pk,
        "name": name,
        "price": price,
        "description": description,
        "thumbnail": thumbnail,
        "category": category,
        "is_featured": isFeatured,
        "user": user,
    };
}
