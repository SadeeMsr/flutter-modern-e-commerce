import 'package:rohan_ecommerce_app/features/shop/controllers/product/product_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/widgets/custom_shapes/containers/primary_header_container.dart';
import '../../../../common/widgets/layouts/grid_layout.dart';
import '../../../../common/widgets/products/product_cards/product_card_vertical.dart';
import '../../../../common/widgets/shimmers/vertical_product_shimmer.dart';
import '../../../../common/widgets/texts/section_heading.dart';
import '../../../../data/repositories/product/product_repository.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/constants/text_strings.dart';
import '../../../../utils/device/device_utility.dart';
import '../all_products/all_products.dart';
import 'widgets/header_categories.dart';
import 'widgets/header_search_container.dart';
import 'widgets/home_appbar.dart';
import 'widgets/promo_slider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProductController());
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
     
            const TPrimaryHeaderContainer(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                 
                  THomeAppBar(),
                  SizedBox(height: TSizes.spaceBtwSections),

          
                  TSearchContainer(text: 'Search in Store', showBorder: false),
                  SizedBox(height: TSizes.spaceBtwSections),

               
                  THeaderCategories(),
                  SizedBox(height: TSizes.spaceBtwSections * 2),
                ],
              ),
            ),

         
            Container(
              padding: const EdgeInsets.all(TSizes.defaultSpace),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
          
                  const TPromoSlider(),
                  const SizedBox(height: TSizes.spaceBtwSections),

             
                  TSectionHeading(
                    title: TTexts.popularProducts,
                    onPressed: () => Get.to(
                      () => AllProducts(
                        title: TTexts.popularProducts,
                        futureMethod:
                            ProductRepository.instance.getAllFeaturedProducts(),
                      ),
                    ),
                  ),
                  const SizedBox(height: TSizes.spaceBtwItems),

              
                  Obx(
                    () {
                     
                      if (controller.isLoading.value)
                        return const TVerticalProductShimmer();

          
                      if (controller.featuredProducts.isEmpty) {
                        return Center(
                            child: Text('No Data Found!',
                                style: Theme.of(context).textTheme.bodyMedium));
                      } else {
                       
                        return TGridLayout(
                          itemCount: controller.featuredProducts.length,
                          itemBuilder: (_, index) => TProductCardVertical(
                              product: controller.featuredProducts[index],
                              isNetworkImage: true),
                        );
                      }
                    },
                  ),

                  SizedBox(
                      height: TDeviceUtils.getBottomNavigationBarHeight() +
                          TSizes.defaultSpace),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
