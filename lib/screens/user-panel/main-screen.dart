// ignore_for_file: file_names, prefer_const_constructors, no_leading_underscores_for_local_identifiers, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:solex/screens/auth-ui/welcome-screen.dart';
import 'package:solex/screens/user-panel/all-flash-sale-products.dart';
import 'package:solex/screens/user-panel/cart-screen.dart';


import 'package:solex/utils/app-constant.dart';
import 'package:solex/widgets/banner-widget.dart';
import 'package:solex/widgets/custom-drawer-widget.dart';
import 'package:solex/widgets/heading-widget.dart';

import '../../widgets/all-products-widget.dart';
import '../../widgets/category-widget.dart';
import '../../widgets/flash-sale-widget.dart';
import 'all-categories-screen.dart';
import 'all-products-screen.dart';


class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: AppConstant.appTextColor),
        
        backgroundColor: AppConstant.appMainColor,
        title: Text(AppConstant.appMainName, 
        style: TextStyle(color: AppConstant.appTextColor),
        ),
        centerTitle: true,
        actions: [
          GestureDetector(
            onTap: () => Get.to(()=> CartScreen()),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(Icons.shopping_cart),
            ),
          ),
        ],
        ),
        drawer: DrawerWidget(),
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Container(child: Column(children: [
            SizedBox(height: Get.height/ 90.0,
            ),
            //Banner
            BannerWidget(),

            HeadingWidget(
                headingTitle: "Categories",
                headingSubTitle: "Categories worth watching ",
                onTap: () => Get.to(() => AllCategoriesScreen()),
                buttonText: "See More >",
              ),

            CategoriesWidget(),

            HeadingWidget(
              headingTitle: "Flash Sale" ,
              headingSubTitle: "Products at great deals" ,
              onTap: () => Get.to(()=> AllFlashSaleProductScreen()),
              buttonText: "See More >",
            ),

            FlashSaleWidget(),
            
            HeadingWidget(
              headingTitle: "All Products" ,
              headingSubTitle: "Products worth purchasing" ,
              onTap: () => Get.to(()=> AllProductsScreen()),
              buttonText: "See More >",
            ),

            AllProductsWidget(),
          ],
          ),
        ),
        ),
      );
  }
}