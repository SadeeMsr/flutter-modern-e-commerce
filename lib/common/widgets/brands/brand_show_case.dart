import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../features/shop/models/brand_model.dart';
import '../../../features/shop/screens/brand/brand.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/helpers/helper_functions.dart';
import '../custom_shapes/containers/rounded_container.dart';
import '../shimmers/shimmer.dart';
import 'brand_card.dart';

class TBrandShowcase extends StatelessWidget {
  const TBrandShowcase({super.key, required this.brand, required this.images});

  final BrandModel brand;
  final List<String> images;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.to(BrandScreen(brand: brand)),
      child: TRoundedContainer(
        margin: const EdgeInsets.only(bottom: TSizes.spaceBtwItems),
        showBorder: true,
        borderColor: TColors.darkGrey,
        backgroundColor: Colors.transparent,
        child: Column(
          children: [
            TBrandCard(showBorder: false, brand: brand),
            const SizedBox(height: TSizes.spaceBtwItems / 2),
            Row(
                children: images
                    .map((e) => brandTopProductImageWidget(e, context))
                    .toList()),
          ],
        ),
      ),
    );
  }

  Widget brandTopProductImageWidget(String image, context) {
    return Expanded(
      child: TRoundedContainer(
        height: 100,
        padding: const EdgeInsets.all(TSizes.md),
        margin: const EdgeInsets.only(right: TSizes.sm),
        backgroundColor: THelperFunctions.isDarkMode(context)
            ? TColors.darkerGrey
            : TColors.light,
        child: CachedNetworkImage(
          fit: BoxFit.contain,
          imageUrl: image,
          progressIndicatorBuilder: (context, url, downloadProgress) =>
              const TShimmerEffect(width: 100, height: 100),
          errorWidget: (context, url, error) => const Icon(Icons.error),
        ),
      ),
    );
  }
}
