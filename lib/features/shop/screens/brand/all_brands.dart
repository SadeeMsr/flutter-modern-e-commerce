import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/widgets/appbar/appbar.dart';
import '../../../../common/widgets/brands/brand_card.dart';
import '../../../../common/widgets/layouts/grid_layout.dart';
import '../../../../common/widgets/shimmers/brands_shimmer.dart';
import '../../../../common/widgets/texts/section_heading.dart';
import '../../../../utils/constants/sizes.dart';
import '../../controllers/brand_controller.dart';
import 'brand.dart';

class AllBrandsScreen extends StatelessWidget {
  const AllBrandsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = BrandController.instance;
    return Scaffold(
      appBar: const TAppBar(showBackArrow: true, title: Text('Brand')),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              
              const TSectionHeading(title: 'Brands', showActionButton: false),
              const SizedBox(height: TSizes.spaceBtwItems),

              
              Obx(
                () {
                  
                  if (controller.isLoading.value) return const TBrandsShimmer();

                  
                  if (controller.allBrands.isEmpty) {
                    return Center(child: Text('No Data Found!', style: Theme.of(context).textTheme.bodyMedium!.apply(color: Colors.white)));
                  } else {
                    return TGridLayout(
                      itemCount: controller.allBrands.length,
                      mainAxisExtent: 80,
                      itemBuilder: (_, index) {
                        final brand = controller.allBrands[index];
                        return TBrandCard(
                          brand: brand,
                          showBorder: true,
                          onTap: () => Get.to(() => BrandScreen(brand: brand)),
                        );
                      },
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
