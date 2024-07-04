import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:mostashary/Model/Signmodel.dart';

import 'package:mostashary/view/Components/components.dart';
import 'package:mostashary/view/Screen/Expert_SignIn.dart';
//import 'package:untitledmm/modules/Expert_SignIn/Expert_SignIn.dart';
//import 'package:untitledmm/modules/UserProfile/UserProfile.dart';

//import '../../shared/components/components.dart';
//import '../Login/Login.dart';
import 'package:http/http.dart' as http;

import '../../Model/user_model.dart';
import '../../servceConfig.dart';
import 'Login.dart';
import 'categoriesScreen.dart';

class User_SignIn extends StatefulWidget {
  @override
  _User_SignIn createState() => _User_SignIn();
}

class _User_SignIn extends State<User_SignIn> {
  var nameController = TextEditingController();
  var nameController2 = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var passwordController2 = TextEditingController();
  var phoneController = TextEditingController();
  var addressController = TextEditingController();
  var detailsController = TextEditingController();

  var formKey = GlobalKey<FormState>();

  FocusNode myFocusNode = new FocusNode();
  FocusNode myFocusNode1 = new FocusNode();
  FocusNode myFocusNode2 = new FocusNode();
  FocusNode myFocusNode3 = new FocusNode();
  FocusNode myFocusNode4 = new FocusNode();
  FocusNode myFocusNode5 = new FocusNode();
  FocusNode myFocusNode6 = new FocusNode();
  FocusNode myFocusNode7 = new FocusNode();

  Future sign(String name, String email, String pass) async {
    try {
      var response = await http.post(
          Uri.parse('${Services.dmainName}user-register'),
          body: <String, String>{
            'name': name,
            'email': email,
            'password': pass,
          });

      print(response.statusCode);
      print("response is ${response.body}");
      if (response.statusCode == 200) {
        try {
          var js = jsonDecode(response.body);
          print(js['data']);
          var userSi = SignModel.fromJson(js['data']);
          print('JJJJ');
          userSi.token = js['token'];
          return userSi;
        } catch (e) {
          print('WLLLLLLLLLLLLLLLE');
          print(e);
          return false;
        }
      } else {
        print("Failed");
        return false;
      }
    } catch (e) {
      print('Wleeeeeeeeeeeeee');
      print(e);
    }
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shadowColor: Colors.amber,
        backgroundColor: Colors.purple,
        title: Text(
          'User Sign In',
          style: TextStyle(
            color: Colors.white,
            fontSize: 30.0,
            fontWeight: FontWeight.w900,
          ),
        ),
        actions: [
          MaterialButton(
            onPressed: () {},
            child: Icon(
              Icons.question_mark,
              color: Colors.white,
              size: 25.0,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 20.0,
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 10.0,
                ),
              ),
              SizedBox(
                height: 15.0,
              ),
              defaultButton(
                  validing: (value) {
                    if (value.toString().isEmpty) {
                      return 'name must not be empty';
                    }
                    return null;
                  },
                  controller: nameController,
                  labelText: "First Name",
                  focus: myFocusNode,
                  TiT: TextInputType.name),
              SizedBox(
                height: 10.0,
              ),
              SizedBox(
                height: 10.0,
              ),
              defaultButton1(
                validing: (value) {
                  if ((value.toString().isEmpty) ||
                      (!value.toString().isEmail)) {
                    return 'Unvalid Email';
                  }
                  return null;
                },
                controller: emailController,
                focus: myFocusNode2,
                TiT: TextInputType.emailAddress,
                labelText: "Email Address",
                prefix: Icon(
                  Icons.email,
                  color: Colors.amber,
                  size: 25.0,
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              defaultButton2(
                validing: (value) {
                  if ((value.toString().isEmpty) ||
                      (value.toString().length < 6)) {
                    return "Unvalid password";
                  }
                  return null;
                },
                controller: passwordController,
                focus: myFocusNode3,
                TiT: TextInputType.visiblePassword,
                labelText: "Password",
                prefix: Icon(
                  Icons.lock,
                  color: Colors.amber,
                  size: 25.0,
                ),
                suffix: Icon(
                  Icons.remove_red_eye,
                  color: Colors.amber,
                  size: 25.0,
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              SizedBox(
                height: 20.0,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 100.0,
                ),
                child: Container(
                  width: double.infinity,
                  height: 50.0,
                  decoration: BoxDecoration(
                    color: Colors.purple,
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: MaterialButton(
                    onPressed: () async {
                      EasyLoading.show(dismissOnTap: true);
                      print(nameController.text);
                      print(passwordController.text);
                      print(emailController.text);
                      var res = await sign(nameController.text,
                          emailController.text, passwordController.text);
                      print(res);
                      if (res != false) {
                        EasyLoading.showSuccess('Wellcome');
                        Get.to(CategoriesScreen());
                      } else {
                        EasyLoading.showError('Some error happen');
                      }
                    },
                    child: Text(
                      "REGISTER",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "you are an expert? |",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 12.0,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Get.to(Expert_SignIn());
                    },
                    child: Text(
                      "REGISTER AS AN Expert",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 12.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )
                ],
              ),
              Center(
                child: TextButton(
                    onPressed: () {
                      Get.to(Login());
                    },
                    child: Text(
                      'LOGIN',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 15.0,
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.underline,
                      ),
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
