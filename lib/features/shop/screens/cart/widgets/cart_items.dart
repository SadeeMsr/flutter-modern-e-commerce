import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../common/widgets/products/cart/add_remove_cart_button.dart';
import '../../../../../common/widgets/products/cart/cart_item.dart';
import '../../../../../common/widgets/texts/t_product_price_text.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/helpers/helper_functions.dart';
import '../../../controllers/product/cart_controller.dart';

class TCartItems extends StatelessWidget {
  const TCartItems({
    super.key,
    this.showAddRemoveButtons = true,
  });

  final bool showAddRemoveButtons;

  @override
  Widget build(BuildContext context) {
    final cartController = CartController.instance;
    final cartItems = cartController.cartItems;
    return Obx(
      () {
        return ListView.separated(
          shrinkWrap: true,
          itemCount: cartItems.length,
          physics: const NeverScrollableScrollPhysics(),
          separatorBuilder: (context, index) =>
              const SizedBox(height: TSizes.spaceBtwSections),
          itemBuilder: (context, index) {
            return Obx(
              () {
                final item = cartItems[index];
                return Column(
                  children: [
                    TCartItem(item: item),
                    if (showAddRemoveButtons)
                      const SizedBox(height: TSizes.spaceBtwItems),
                    if (showAddRemoveButtons)
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              const SizedBox(width: 70),
                              TProductQuantityWithAddRemoveButton(
                                width: 32,
                                height: 32,
                                iconSize: TSizes.md,
                                addBackgroundColor: TColors.primary,
                                removeForegroundColor:
                                    THelperFunctions.isDarkMode(context)
                                        ? TColors.white
                                        : TColors.black,
                                removeBackgroundColor:
                                    THelperFunctions.isDarkMode(context)
                                        ? TColors.darkerGrey
                                        : TColors.light,
                                quantity: item.quantity,
                                add: () => cartController.addOneToCart(item),
                                remove: () =>
                                    cartController.removeOneFromCart(item),
                              ),
                            ],
                          ),
                          TProductPriceText(
                              price: (item.price * item.quantity)
                                  .toStringAsFixed(1)),
                        ],
                      )
                  ],
                );
              },
            );
          },
        );
      },
    );
  }
}
