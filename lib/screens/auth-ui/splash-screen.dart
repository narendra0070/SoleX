// ignore_for_file: file_names, avoid_unnecessary_containers, prefer_const_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace

import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
//import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:solex/controllers/get-user-data-controller.dart';
import 'package:solex/screens/admin-panel/admin-main-screen.dart';
import 'package:solex/screens/auth-ui/welcome-screen.dart';
import 'package:solex/screens/user-panel/main-screen.dart';
import 'package:solex/utils/app-constant.dart';

class SplashSCreen extends StatefulWidget {
  const SplashSCreen({super.key});

  @override
  State<SplashSCreen> createState() => _SplashSCreenState();
}

class _SplashSCreenState extends State<SplashSCreen> {
  User? user=FirebaseAuth.instance.currentUser;
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () { 
      loggdin(context);
    });
  
    
  }

  Future<void> loggdin(BuildContext context) async{
    
    if(user != null){
      final GetUserDataController getUserDataController = Get.put(GetUserDataController());
      var userData=await getUserDataController.getUserData(user!.uid);

      if(userData[0]['isAdmin'] == true){
        Get.offAll(()=> AdminMainScreen());
      }else{
        Get.offAll(()=> MainScreen());
      }
    }else{
      Get.to(()=> WelcomeScreen());
    }
  }

  @override
  Widget build(BuildContext context) {
    //final size =MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppConstant.appScendoryColor,
      appBar: AppBar(
        backgroundColor: AppConstant.appScendoryColor,
        elevation: 0,
      ),
      body: Container(
        child: Column(
        children: [
          Expanded(
            child: Container(
              width: Get.width,
              alignment: Alignment.center,
              child: Lottie.asset('assets/images/splash-icon.json'),
            ),
          ),
          Container(
            margin: EdgeInsets.only(bottom: 20.0),
            width: Get.width,
            alignment: Alignment.center,
            child: Text(AppConstant.appMainName,
          style: TextStyle(color: AppConstant.appTextColor, 
          fontSize: 30.0,
          fontWeight: FontWeight.bold
          ),
          ),
        )
        ],
        ),
      ),
      );
  }
}