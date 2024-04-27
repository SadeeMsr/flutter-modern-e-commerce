import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../common/widgets/image_text/image_text_vertical.dart';
import '../../../../../common/widgets/shimmers/category_shimmer.dart';
import '../../../../../common/widgets/texts/section_heading.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../controllers/categories_controller.dart';
import '../../sub_category/sub-categories.dart';


class THeaderCategories extends StatelessWidget {

  const THeaderCategories({super.key});

  @override
  Widget build(BuildContext context) {
    final categoryController = Get.put(CategoryController());

    return Padding(
      padding: const EdgeInsets.only(left: TSizes.defaultSpace),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
        
          const TSectionHeading(title: 'Popular Categories', textColor: TColors.white, showActionButton: false),
          const SizedBox(height: TSizes.spaceBtwItems),

       
          Obx(
            () {
           
              if (categoryController.isLoading.value) return const TCategoryShimmer();

              if (categoryController.featuredCategories.isEmpty) {
                return Center(child: Text('No Data Found!', style: Theme.of(context).textTheme.bodyMedium!.apply(color: Colors.white)));
              } else {

                return SizedBox(
                  height: 80,
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: categoryController.featuredCategories.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (_, index) {
                      final category = categoryController.featuredCategories[index];
                      return TVerticalImageAndText(
                        title: category.name,
                        image: category.image,
                        onTap: () => Get.to(() => SubCategoriesScreen(category: category)),
                      );
                    },
                  ),
                );
              }
            },
          )
        ],
      ),
    );
  }
}
