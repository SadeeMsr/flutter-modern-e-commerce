import 'package:rohan_ecommerce_app/features/personalization/models/address_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../common/widgets/texts/section_heading.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../personalization/controllers/address_controller.dart';

class TBillingAddressSection extends StatelessWidget {
  const TBillingAddressSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final addressController = AddressController.instance;

    return Obx(
      () => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TSectionHeading(
            title: 'Shipping Address',
            buttonTitle: 'Change',
            showActionButton: true,
            onPressed: () => addressController.selectNewAddressPopup(context),
          ),
          addressController.selectedAddress.value.id.isNotEmpty
              ? _buildAddressDetails(
                  context, addressController.selectedAddress.value)
              : Text('Select Address',
                  style: Theme.of(context).textTheme.bodyMedium),
        ],
      ),
    );
  }

  Widget _buildAddressDetails(
      BuildContext context, AddressModel selectedAddress) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(selectedAddress.name,
            style: Theme.of(context).textTheme.bodyLarge),
        const SizedBox(height: TSizes.spaceBtwItems / 2),
        Row(
          children: [
            const Icon(Icons.phone, color: Colors.grey, size: 16),
            const SizedBox(width: TSizes.spaceBtwItems),
            Text(selectedAddress.formattedPhoneNo,
                style: Theme.of(context).textTheme.bodyMedium),
          ],
        ),
        const SizedBox(height: TSizes.spaceBtwItems / 2),
        Row(
          children: [
            const Icon(Icons.location_history, color: Colors.grey, size: 16),
            const SizedBox(width: TSizes.spaceBtwItems),
            Expanded(
              child: Text(
                selectedAddress.toString(),
                style: Theme.of(context).textTheme.bodyMedium,
                softWrap: true,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
