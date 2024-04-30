import 'package:get/get.dart';
import '../../../../data/repositories/banners/banner_repository.dart';
import '../../../../utils/popups/loaders.dart';
import '../../models/banner_model.dart';

class BannerController extends GetxController {
  final bannersLoading = false.obs;
  final carousalCurrentIndex = 0.obs;
  final RxList<BannerModel> banners = <BannerModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchBanners();
  }

  void updatePageIndicator(index) {
    carousalCurrentIndex.value = index;
  }

  Future<void> fetchBanners() async {
    try {
      bannersLoading.value = true;

      final bannerRepo = Get.put(BannerRepository());
      final banners = await bannerRepo.fetchBanners();

      this.banners.assignAll(banners);
    } catch (e) {
      TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    } finally {
      bannersLoading.value = false;
    }
  }
}
