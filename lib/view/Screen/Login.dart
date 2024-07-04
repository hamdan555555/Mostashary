import 'dart:convert';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:mostashary/Controller/LoginController.dart';
import 'package:mostashary/Model/user_model.dart';
import 'package:mostashary/servceConfig.dart';
import 'package:mostashary/view/Components/components.dart';
//import 'package:untitledmm/modules/Expert_SignIn/Expert_SignIn.dart';
//import 'package:untitledmm/modules/User_SignIn/User_SignIn.dart';
//import '../../shared/components/components.dart';
import 'package:http/http.dart' as http;
import 'package:mostashary/view/Screen/categoriesScreen.dart';
import '../../servceConfig.dart';
import 'User_SignIn.dart';

class Login extends StatefulWidget {
  @override
  _Login createState() => _Login();
}

class _Login extends State<Login> {
  LoginController logController = Get.put(LoginController(), permanent: true);
  var nameController = TextEditingController();
  var nameController2 = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var passwordController2 = TextEditingController();
  var phoneController = TextEditingController();
  var addressController = TextEditingController();
  var detailsController = TextEditingController();
  var finalUser = new Users();

  var formKey = GlobalKey<FormState>();

  FocusNode myFocusNode = new FocusNode();
  FocusNode myFocusNode1 = new FocusNode();
  FocusNode myFocusNode2 = new FocusNode();
  FocusNode myFocusNode3 = new FocusNode();
  FocusNode myFocusNode4 = new FocusNode();
  FocusNode myFocusNode5 = new FocusNode();
  FocusNode myFocusNode6 = new FocusNode();
  FocusNode myFocusNode7 = new FocusNode();

   //static bool mybooll = false;

  @override
  void initState() {
    super.initState();
  }

  // register(String email, String pass, String name) async {
  //   try {
  //     print('AAAAAAAAAAAAAAAAAAAA');
  //     var response = await http.post(
  //       Uri.parse('${Services.dmainName}user-login'),
  //       body: {
  //         'name': name,
  //         'email': email,
  //         'password': pass,
  //         'password_confirmation': pass,
  //       },
  //     );
  //     print(response.statusCode);
  //     print("response is ${response.body}");
  //     if (response.statusCode == 200) {
  //       try {
  //         var js = jsonDecode(response.body);
  //         var user = Users.fromJson(js['data']);
  //         user.token = js['token'];
  //         user.toString();
  //         return user;
  //       } catch (e) {
  //         print(e);
  //       }
  //     } else {
  //       print("Failed");
  //       return false;
  //     }
  //   } catch (e) {
  //     return false;
  //     print('Wleeeeeeeee');
  //     print(e);
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shadowColor: Colors.amber,
        backgroundColor: Colors.purple,
        title: Text(
          'Login Page',
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
                height: 150.0,
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 30.0,
                  bottom: 15.0,
                ),
                child: Text(
                  "Login",
                  style: TextStyle(
                    color: Colors.grey[600],
                    fontSize: 40.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
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
                height: 15.0,
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
                      if (Services.mybool == true) {
                        var res = await Services.expertLogin(
                            emailController.text, passwordController.text);
                             print(res);
                        if (res != false) {
                          EasyLoading.showSuccess('Wellcome');
                         // logController.users = finalUser;
                          Get.to(CategoriesScreen());
                        } else {
                          EasyLoading.showError('Some error happen');
                        }
                      } 
                      else {
                        var res = await Services.login(
                            emailController.text, passwordController.text);
                        print(res);
                        if (res != false) {
                          EasyLoading.showSuccess('Wellcome');
                         // logController.users = finalUser;
                          Get.to(CategoriesScreen());
                        } else {
                          EasyLoading.showError('Some error happen');
                        }
                      }
                    },
                    child: Text(
                      "LOGIN",
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
                    "forgot your password? |",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 12.0,
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      "Reset Password",
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
                      Get.to(User_SignIn());
                    },
                    child: Text(
                      'Sign In',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 15.0,
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.underline,
                      ),
                    )),
              ),
              CheckboxListTile(
                  value: Services.mybool,
                  onChanged: ((value) {
                    setState(() {
                      Services.mybool = value!;
                    });
                  }))
            ],
          ),
        ),
      ),
    );
  }
}

class InputSquare extends StatelessWidget {
  InputSquare({super.key});
  var label;
  var controller;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(),
    );
  }
}
