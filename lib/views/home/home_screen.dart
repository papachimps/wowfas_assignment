import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '/model/product.dart';
import 'constants.dart';

import 'widgets/shortcut_icon_button.dart';
import 'widgets/product_tile.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Product> products = List.generate(
      20,
      (int index) => randomProductGenerator(),
      // growable: false,
    );
    return Scaffold(
      backgroundColor: const Color(0xffF9FAFE),
      body: Padding(
        padding:
            const EdgeInsets.symmetric(horizontal: defaultMarginFactor * 2),
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            SliverList(
              delegate: SliverChildListDelegate.fixed(
                searchAndShortcutSection,
              ),
            ),
            SliverGrid(
              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                mainAxisSpacing: defaultMarginFactor * 2,
                crossAxisSpacing: defaultMarginFactor * 2,
                childAspectRatio: 1,
                maxCrossAxisExtent: Get.size.width / 4,
              ),
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  var item = shortcutsMap.keys.toList()[index];
                  return ShortcutIconButton(
                    tileName: item,
                    tileIcon: shortcutsMap[item]!,
                    onPressed: () {},
                  );
                },
                childCount: shortcutsMap.length,
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.only(
                  top: defaultMarginFactor * 6,
                  bottom: defaultMarginFactor * 3,
                ),
                child: Text(
                  'Super hot promo ⚡',
                  style: headerTextStyle.copyWith(
                    fontSize: defaultMarginFactor * 3,
                  ),
                ),
              ),
            ),
            SliverGrid(
              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                mainAxisSpacing: defaultMarginFactor * 2,
                crossAxisSpacing: defaultMarginFactor * 2,
                childAspectRatio: 2 / 3,
                maxCrossAxisExtent: Get.size.width / 2,
              ),
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return ProductTileButton(
                    product: products[index],
                    onPressed: () {},
                  );
                },
                childCount: products.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

List<Widget> searchAndShortcutSection = [
  const SizedBox(height: defaultMarginFactor * 6),
  Text(
    'Discover',
    style: headerTextStyle,
  ),
  const SizedBox(height: defaultMarginFactor),
  Text(
    'Find anything what you want',
    style: headerTextStyle.copyWith(
      fontSize: defaultMarginFactor * 2,
      fontWeight: FontWeight.normal,
    ),
  ),
  const SizedBox(height: defaultMarginFactor * 3),
  Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Expanded(
        flex: 5,
        child: TextField(
          textAlign: TextAlign.start,
          textInputAction: TextInputAction.done,
          decoration: searchTextFieldDecoration.copyWith(
            hintText: 'Search here',
          ),
          onChanged: (_value) {
            debugPrint(_value);
          },
        ),
      ),
      const SizedBox(width: defaultMarginFactor * 2),
      Expanded(
        child: MaterialButton(
          padding: EdgeInsets.zero,
          height: defaultMarginFactor * 6,
          onPressed: () {},
          elevation: 0,
          color: Colors.white,
          shape: ContinuousRectangleBorder(
            borderRadius: BorderRadius.circular(defaultMarginFactor * 2),
          ),
          child: const Icon(
            Icons.tune,
            color: Colors.lightBlue,
          ),
        ),
      ),
    ],
  ),
  const SizedBox(height: defaultMarginFactor * 4),
];
