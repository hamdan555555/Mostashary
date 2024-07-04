// ignore_for_file: prefer_const_constructors

import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'dart:convert';

import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:mostashary/Controller/LoginController.dart';
import 'package:mostashary/Model/Experts_model.dart';
import 'package:mostashary/view/Screen/Login.dart';
import 'package:mostashary/view/Screen/experts_1.dart';

import '../../Controller/Add_Money_Controller.dart';
import '../../Controller/Experts_controller.dart';
import '../../Controller/log_out_servies.dart';
import '../../servceConfig.dart';
import '../Components/Default_Categories.dart';
import 'FavoriteScreen.dart';
import 'User_profile.dart';

class CategoriesScreen extends StatefulWidget {
  CategoriesScreen({super.key});

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  var _controller = Get.put(ExpertsController());

  var _controller_Money = Get.put(AddMoneyController());

  var AddMoney = 400;
  UserProfile _userProfile = new UserProfile();
  String token = Services.token;
  AddMoneyController _addcostcont = new AddMoneyController();
  Future addMoney() async {
    var headers = {
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
      'Content-Type': 'application/x-www-form-urlencoded'
    };
    var request = http.Request(
        'POST', Uri.parse('${Services.dmainName}add-mony-for-user'));
    request.bodyFields = {'ammount': '20000'};
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print(await response.stream.bytesToString());
    } else {
      print(response.reasonPhrase);
    }
  }

  Future addMoneyEX() async {
    var headers = {
      'Accept': 'application/json',
       'Authorization': 'Bearer $token',
      'Content-Type': 'application/x-www-form-urlencoded'
    };
    var request = http.Request(
        'POST', Uri.parse('${Services.dmainName}add-mony-for-expert'));
    request.bodyFields = {'ammount':'20000', 'cost':'0'};
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print(await response.stream.bytesToString());
    } else {
      print(response.reasonPhrase);
    }
  }

  Future addCost() async {
    var headers = {
      'Accept': 'application/json',
       'Authorization': 'Bearer $token',
      'Content-Type': 'application/x-www-form-urlencoded'
    };
    var request = http.Request(
        'POST', Uri.parse('${Services.dmainName}add-mony-for-expert'));
    request.bodyFields = {'ammount':'0', 'cost':'1000'};
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print(await response.stream.bytesToString());
    } else {
      print(response.reasonPhrase);
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Padding(
          padding: const EdgeInsets.only(top: 30),
          child: Column(
            children: [
              ListTile(
                leading: Icon(Icons.light_mode_outlined),
                title: Text(' My Theme'),
                trailing: Icon(Icons.navigate_next_rounded),
                onTap: () {},
              ),
              Visibility(
                visible: Services.mybool == false,
                child: ListTile(
                leading: Icon(Icons.favorite),
                title: Text('Favorite'),
                trailing: Icon(Icons.navigate_next_rounded),
                onTap: () {
                  Get.to(favorite_screen());
                },
              ),),
              ListTile(
                leading: Icon(Icons.language_outlined),
                title: Text('Language'),
                trailing: Icon(Icons.navigate_next_rounded),
                onTap: () {},
              ),
              Divider(
                thickness: 0.7,
                color: Colors.red,
              ),
              ListTile(
                leading: Icon(
                  Icons.logout,
                  color: Colors.red,
                ),
                title: Text(
                  'Log out',
                  style: TextStyle(color: Colors.red),
                ),
                trailing: Icon(
                  Icons.navigate_next_rounded,
                  color: Colors.red,
                ),
                onTap: () {
                  EasyLoading.show(dismissOnTap: true);
                  var res = ServicesLogout.getExperts();
                  print(res);
                  if (res != false) {
                    EasyLoading.showSuccess('Logout');
                    Get.to(Login());
                  } else {
                    EasyLoading.showError('Some error happen');
                  }
                },
              ),
              Divider(
                thickness: 0.7,
                color: Colors.red,
              ),
             Visibility(
              visible: Services.mybool== false,
              child: Column(
              children: [
                 SizedBox(
                height: 50,
              ),
              Divider(
                thickness: 0.7,
                color: Colors.green,
              ),
              GetBuilder<AddMoneyController>(
                  init: _controller_Money,
                  builder: ((controller) => ListTile(
                      leading: Icon(
                        Icons.account_balance_wallet_outlined,
                        color: Colors.green,
                      ),
                      title: Text(
                        " Your Have : ${controller.Money}",
                        style: TextStyle(color: Colors.green),
                      ),
                      trailing: IconButton(
                        onPressed: () {
                          addMoney();
                          controller.addM();
                        },
                        icon: Icon(
                          Icons.add,
                          color: Colors.green,
                        ),
                      )))),
              Divider(
                thickness: 0.7,
                color: Colors.green,
              ),
              ],
             )),
              Visibility(
                  visible: Services.mybool == true,
                  child: Column(
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      Divider(
                        thickness: 0.7,
                        color: Colors.green,
                      ),
                      GetBuilder<AddMoneyController>(
                          init: _controller_Money,
                          builder: ((controller) => ListTile(
                              leading: Icon(
                                Icons.account_balance_wallet_outlined,
                                color: Colors.green,
                              ),
                              title: Text(
                                " Your session costs : ${controller.Cost}",
                                style: TextStyle(color: Colors.green),
                              ),
                              trailing: IconButton(
                                onPressed: () {
                                   controller.addC();
                                  addCost();
                                },
                                icon: Icon(
                                  Icons.add,
                                  color: Colors.green,
                                ),
                              )))),
                      Divider(
                        thickness: 0.7,
                        color: Colors.green,
                      ),
                      SizedBox(
                height: 20,
              ),
              Divider(
                thickness: 0.7,
                color: Colors.green,
              ),
              GetBuilder<AddMoneyController>(
                  init: _controller_Money,
                  builder: ((controller) => ListTile(
                      leading: Icon(
                        Icons.account_balance_wallet_outlined,
                        color: Colors.green,
                      ),
                      title: Text(
                        " Your Have : ${controller.Money}",
                        style: TextStyle(color: Colors.green),
                      ),
                      trailing: IconButton(
                        onPressed: () {
                          addMoneyEX();
                          controller.addM();
                        },
                        icon: Icon(
                          Icons.add,
                          color: Colors.green,
                        ),
                      )))),
              Divider(
                thickness: 0.7,
                color: Colors.green,
              ),
                    ],
                  ))
            ],
          ),
        ),
      ),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 138, 19, 212),
        centerTitle: true,
        title: Text(
          'Mostashary',
        ),
        // ignore: prefer_const_literals_to_create_immutables
        actions: [
          GestureDetector(
            onTap: () {
              _userProfile.userPro();
              Get.to(UserProfile());
              print('profile');
            },
            child: Padding(
              padding: const EdgeInsets.only(right: 7),
              child: CircleAvatar(
                backgroundColor: Color.fromARGB(255, 215, 211, 211),
                child: Icon(
                  Icons.person,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/Background.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Container(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Default_Categories(
                      tap: () {
                        Get.to(expert_1(
                          type: 1,
                          experttype: 'Medical Consulting',
                        ));
                      },
                      TextCate: 'Medical Consulting',
                      TextDes: 'Click here to view experts',
                      Avatar: 'assets/images/medical.jpg'),
                  Default_Categories(
                      tap: () {
                        Get.to(expert_1(
                          type: 2,
                          experttype: 'Family Consultations',
                        ));
                      },
                      TextCate: 'Family Consultations',
                      TextDes: 'Click here to view experts',
                      Avatar: 'assets/images/family.jpg'),
                  Default_Categories(
                      tap: () {
                        Get.to(expert_1(
                          type: 3,
                          experttype: 'Psychological consultations',
                        ));
                      },
                      TextCate: 'Psychological consultations',
                      TextDes: 'Click here to view experts',
                      Avatar: 'assets/images/psychological.jpg'),
                  Default_Categories(
                      tap: () {
                        Get.to(expert_1(
                          type: 4,
                          experttype: 'Professional Consulting',
                        ));
                      },
                      TextCate: 'Professional Consulting',
                      TextDes: 'Click here to view experts',
                      Avatar: 'assets/images/profe.jpg'),
                  Default_Categories(
                    tap: () {
                      Get.to(expert_1(
                        type: 5,
                        experttype: 'Management Consulting',
                      ));
                    },
                    TextCate: 'Management Consulting',
                    TextDes: 'Click here to view experts',
                    Avatar: 'assets/images/management.jpg',
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
