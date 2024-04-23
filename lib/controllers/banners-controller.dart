// ignore_for_file: file_names, camel_case_types, unused_local_variable, avoid_print



import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class bannerController extends GetxController{
  RxList<String> bannerUrls = RxList<String>([]);

  @override 
  void onInit(){
    super.onInit();
    fetchBannersUrls();
  }

    Future<void> fetchBannersUrls()async{
      try{
        QuerySnapshot bannersSnapshot= await
         FirebaseFirestore.instance.collection('banners').get();

         if(bannersSnapshot.docs.isNotEmpty){
          bannerUrls.value= bannersSnapshot.docs.map((doc) => doc['imageUrl'] as String).toList();
         }
      }catch(e){
        print(" error: $e");
      }
    }
}