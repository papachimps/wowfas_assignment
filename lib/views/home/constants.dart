import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:faker_dart/faker_dart.dart';

import '/model/product.dart';

const double defaultMarginFactor = 8;

final TextStyle headerTextStyle = GoogleFonts.montserrat(
  fontSize: defaultMarginFactor * 5,
  fontWeight: FontWeight.w400,
  color: Colors.black,
);

const searchTextFieldDecoration = InputDecoration(
  hintStyle: TextStyle(color: Colors.grey),
  filled: true,
  fillColor: Colors.white,
  prefixIcon: Icon(
    Icons.search_rounded,
    color: Colors.lightBlue,
  ),
  contentPadding: EdgeInsets.all(defaultMarginFactor * 2),
  border: OutlineInputBorder(
    borderSide: BorderSide.none,
    borderRadius: BorderRadius.all(Radius.circular(defaultMarginFactor * 2)),
  ),
);

const Map<String, IconData> shortcutsMap = {
  'See All': Icons.grid_view_rounded,
  'Furniture': Icons.wine_bar,
  'Elctricity': Icons.lightbulb,
  'Promo': Icons.local_activity,
  'Automotive': Icons.time_to_leave,
  'My Wallet': Icons.account_balance_wallet,
  'Gadget': Icons.devices_other,
  'Travel': Icons.flight,
};


Product randomProductGenerator() {
  final faker = Faker.instance;
  final fakeProduct = faker.commerce;
  final productName = fakeProduct.productName();
  final productDept = fakeProduct.department();
  final price = fakeProduct.price();
  final isPromoAvailable = faker.datatype.boolean();
  final imageUrl = faker.image.loremPicsum.image(
    height: 100,
    width: 100,
    seed: productName,
  );
  // debugPrint(productName);
  return Product(
    id: productName,
    name: productName,
    imageUrl: imageUrl,
    category: productDept,
    isPromoAvailable: isPromoAvailable,
    price: price,
  );
}
