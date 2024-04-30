import 'package:flutter/material.dart';

import '../../../../common/widgets/appbar/appbar.dart';
import '../../../../utils/constants/sizes.dart';
import '../../controllers/dummy_data.dart';
import 'widgets/progress_indicator_and_rating.dart';
import 'widgets/rating_star.dart';
import 'widgets/review_details_container.dart';

class ProductReviewsScreen extends StatelessWidget {
  const ProductReviewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          const TAppBar(title: Text('Reviews & Ratings'), showBackArrow: true),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                  "Ratings and reviews are verified and are from people who use the same type of device that you use."),
              const SizedBox(height: TSizes.spaceBtwItems),
              const TOverallProductRating(),
              const TRatingBarIndicator(rating: 3.5),
              const Text("12,611"),
              const SizedBox(height: TSizes.spaceBtwSections),
              ListView.separated(
                shrinkWrap: true,
                itemCount: TDummyData.productReviews.length,
                physics: const NeverScrollableScrollPhysics(),
                separatorBuilder: (_, __) =>
                    const SizedBox(height: TSizes.spaceBtwSections),
                itemBuilder: (_, index) => UserReviewCard(
                    productReview: TDummyData.productReviews[index]),
              )
            ],
          ),
        ),
      ),
    );
  }
}
