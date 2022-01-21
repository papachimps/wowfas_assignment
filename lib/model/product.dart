import 'dart:convert';

class Product {
  final String id;
  final String name;
  final String imageUrl;
  final String category;
  final bool isPromoAvailable;
  final String price;
  Product({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.category,
    required this.isPromoAvailable,
    required this.price,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'imageUrl': imageUrl,
      'category': category,
      'isPromoAvailable': isPromoAvailable,
      'price': price,
    };
  }

  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      id: map['id'] ?? '',
      name: map['name'] ?? '',
      imageUrl: map['imageUrl'] ?? '',
      category: map['category'] ?? '',
      isPromoAvailable: map['isPromoAvailable'] ?? false,
      price: map['price'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Product.fromJson(String source) =>
      Product.fromMap(json.decode(source));
}
