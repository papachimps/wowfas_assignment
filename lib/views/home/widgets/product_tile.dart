import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cached_network_image/cached_network_image.dart';

import '/model/product.dart';
import '../constants.dart';

class ProductTileButton extends StatelessWidget {
  final Product product;
  final VoidCallback? onPressed;

  const ProductTileButton({
    Key? key,
    required this.product,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      color: Colors.white,
      padding: const EdgeInsets.all(defaultMarginFactor),
      // color: const Color(0xffE9F1FC),
      elevation: 0,
      shape: ContinuousRectangleBorder(
        borderRadius: BorderRadius.circular(defaultMarginFactor * 2),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(defaultMarginFactor),
              child: CachedNetworkImage(
                cacheKey: product.imageUrl,
                imageUrl: product.imageUrl,
                fit: BoxFit.cover,
                width: double.infinity,
                placeholder: (context, url) => Center(
                  child: CircularProgressIndicator(
                    color: Get.theme.primaryColor,
                    strokeWidth: 1.5,
                  ),
                ),
                errorWidget: (_context, _error, _) => const Center(
                  child: Icon(Icons.error_outline),
                ),
              ),
            ),
          ),
          const SizedBox(height: defaultMarginFactor * 2),
          Text(
            product.name,
            // textAlign: TextAlign.center,
            style: headerTextStyle.copyWith(
              fontSize: defaultMarginFactor * 2,
              fontWeight: FontWeight.w400,
            ),
          ),
          const SizedBox(height: defaultMarginFactor),
          Text(
            product.category,
            // textAlign: TextAlign.center,
            style: headerTextStyle.copyWith(
              fontSize: defaultMarginFactor * 1.5,
              color: Colors.grey,
              fontWeight: FontWeight.w400,
            ),
          ),
          const SizedBox(height: defaultMarginFactor),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Chip(
                label: Text(
                  'Promo',
                  style: headerTextStyle.copyWith(
                    color: Colors.orange,
                    fontSize: defaultMarginFactor * 1.5,
                  ),
                ),
                labelPadding: const EdgeInsets.symmetric(
                  horizontal: defaultMarginFactor * 1.5,
                ),
                backgroundColor: Colors.orange[50],
              ),
              Text(
                product.price.split('.')[0],
                // textAlign: TextAlign.center,
                style: headerTextStyle.copyWith(
                  fontSize: defaultMarginFactor * 2,
                  color: Colors.blue,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
