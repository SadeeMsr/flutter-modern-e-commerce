import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../features/shop/models/banner_model.dart';
import '../../../utils/exceptions/firebase_exceptions.dart';
import '../../../utils/exceptions/format_exceptions.dart';
import '../../../utils/exceptions/platform_exceptions.dart';
import '../../services/cloud_storage/firebase_storage_service.dart';

class BannerRepository extends GetxController {
  static BannerRepository get instance => Get.find();

  
  final _db = FirebaseFirestore.instance;


  Future<List<BannerModel>> fetchBanners() async {
    try {
      final result = await _db.collection('Banners').where('active', isEqualTo: true).limit(3).get();
      return result.docs.map((documentSnapshot) => BannerModel.fromSnapshot(documentSnapshot)).toList();
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const TFormatException();
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong while fetching Banners.';
    }
  }


  
  Future<void> uploadBannersDummyData(List<BannerModel> banners) async {
    try {
      
      final storage = Get.put(TFirebaseStorageService());
      
      for (var entry in banners) {
        
        final thumbnail = await storage.getImageDataFromAssets(entry.imageUrl);

        
        final url = await storage.uploadImageData('Banners', thumbnail, entry.imageUrl.toString());

        
        entry.imageUrl = url;

        
        await _db.collection("Banners").doc().set(entry.toJson());
      }
    } on FirebaseException catch (e) {
      throw e.message!;
    } catch (e) {
      throw e.toString();
    }
  }
}
