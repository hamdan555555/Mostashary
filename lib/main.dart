import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:mostashary/view/Screen/Expert_SignIn.dart';
import 'package:mostashary/view/Screen/Login.dart';
import 'package:mostashary/view/Screen/User_profile.dart';
import 'package:mostashary/view/Screen/categoriesScreen.dart';
import 'package:mostashary/view/Screen/experts_1.dart';
import 'package:mostashary/view/Screen/FavoriteScreen.dart';

void main() {

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: Login(),
     builder: EasyLoading.init(),
    );
  }
}
