import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../common/widgets/appbar/appbar.dart';
import '../../../../common/widgets/layouts/grid_layout.dart';
import '../../../../common/widgets/products/product_cards/product_card_vertical.dart';
import '../../../../common/widgets/shimmers/vertical_product_shimmer.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/device/device_utility.dart';
import '../../../../utils/helpers/cloud_helper_functions.dart';
import '../../controllers/all_products_controller.dart';
import '../../models/product_model.dart';


class AllProducts extends StatelessWidget {
  const AllProducts({Key? key, required this.title, this.query, this.futureMethod}) : super(key: key);


  final String title;


  final Query? query;

  final Future<List<ProductModel>>? futureMethod;

  @override
  Widget build(BuildContext context) {

    final controller = Get.put(AllProductsController());

    return Scaffold(
      appBar: TAppBar(title: Text(title), showBackArrow: true),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: FutureBuilder(
            future: futureMethod ?? controller.fetchProductsByQuery(query),
            builder: (_, snapshot) {

              const loader = TVerticalProductShimmer();
              final widget = TCloudHelperFunctions.checkMultiRecordState(snapshot: snapshot, loader: loader);

              // Return appropriate widget based on snapshot state
              if (widget != null) return widget;

              // Products found!
              final products = snapshot.data!;
              return TSortableProductList(products: products);
            },
          ),
        ),
      ),
    );
  }
}



class TSortableProductList extends StatelessWidget {
  const TSortableProductList({
    Key? key,
    required this.products,
  }) : super(key: key);


  final List<ProductModel> products;

  @override
  Widget build(BuildContext context) {

    final controller = Get.put(AllProductsController());

    controller.assignProducts(products);

    return Column(
      children: [

        Row(
          children: [
            Obx(
              () => Expanded(
                child: DropdownButtonFormField(
                  isExpanded: true,
                  decoration: const InputDecoration(prefixIcon: Icon(Iconsax.sort)),
                  value: controller.selectedSortOption.value,
                  onChanged: (value) {

                    controller.sortProducts(value!);
                  },
                  items: ['Name', 'Higher Price', 'Lower Price', 'Sale', 'Newest', 'Popularity'].map((option) {
                    return DropdownMenuItem<String>(
                      value: option,
                      child: Text(option),
                    );
                  }).toList(),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: TSizes.spaceBtwSections),


        Obx(
          () => TGridLayout(
            itemCount: controller.products.length,
            itemBuilder: (_, index) => TProductCardVertical(product: controller.products[index], isNetworkImage: true),
          ),
        ),


        SizedBox(height: TDeviceUtils.getBottomNavigationBarHeight() + TSizes.defaultSpace),
      ],
    );
  }
}
