import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mostashary/view/Components/components.dart';
//import 'package:untitledmm/modules/LoginScreen/LoginScreen.dart';
//import 'package:untitledmm/modules/Login/Login.dart';
//import 'package:untitledmm/modules/User_SignIn/User_SignIn.dart';
import 'package:http/http.dart' as http;
import 'dart:io';

//import '../../shared/components/components.dart';

//import 'package:image_picker/image_picker.dart';
import 'dart:io';

import 'Login.dart';
import 'User_SignIn.dart';
import 'categoriesScreen.dart';

class Expert_SignIn extends StatefulWidget {
  @override
  _Expert_SignIn createState() => _Expert_SignIn();
}

class _Expert_SignIn extends State<Expert_SignIn> {
  var nameController = TextEditingController();
  var nameController2 = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var passwordController2 = TextEditingController();
  var phoneController = TextEditingController();
  var addressController = TextEditingController();
  var detailsController = TextEditingController();
  var timeController = TextEditingController();

  var formKey = GlobalKey<FormState>();
  bool medical = false;
  bool professional = false;
  bool physo = false;
  bool fam = false;
  bool admin = false;

  FocusNode myFocusNode = new FocusNode();
  FocusNode myFocusNode1 = new FocusNode();
  FocusNode myFocusNode2 = new FocusNode();
  FocusNode myFocusNode3 = new FocusNode();
  FocusNode myFocusNode4 = new FocusNode();
  FocusNode myFocusNode5 = new FocusNode();
  FocusNode myFocusNode6 = new FocusNode();
  FocusNode myFocusNode7 = new FocusNode();
  FocusNode myFocusNode8 = new FocusNode();
  FocusNode myFocusNode9 = new FocusNode();

  // late File image ;
  // var Picker = ImagePicker();
  //  Future getImage() async {
  // final pickedImage = await Picker.getImage(source: ImageSource.camera);
  // if(pickedImage !=null){
  //   image = File(pickedImage.path);
  // }
  // else{
  //   print("No Image Selected!");
  // }
  // }

  @override
  void initState() {
    super.initState();
  }

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shadowColor: Colors.black,
        backgroundColor: Colors.purple,
        title: Text(
          'Expert Sign In',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20.0,
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
                  left: 20.0,
                ),
                child: GestureDetector(
                  //   onTap: getImage,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      CircleAvatar(
                        radius: 60.0,
                        backgroundColor: Colors.purple,
                      ),
                      Icon(
                        Icons.person,
                        size: 60.0,
                        color: Colors.white,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 30.0,
              ),
              defaultButton(
                  // validing: (value){
                  //   if (value.toString().isEmpty){
                  //    return 'name must not be empty';
                  //   }
                  //   return null;
                  // },
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
              defaultButton(
                  // validing: (value){
                  //   if (value.toString().isEmpty){
                  //    return 'name must not be empty';
                  //   }
                  //   return null;
                  // },

                  validing: (value) {
                    if (value.toString().isEmpty) {
                      return 'name must not be empty';
                    }
                    return null;
                  },
                  controller: nameController2,
                  focus: myFocusNode1,
                  TiT: TextInputType.name,
                  labelText: "Last Name"),
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
              defaultButton2(
                validing: (value) {
                  if ((value.toString().isEmpty) ||
                      (value.toString().length < 6)) {
                    return 'Unvalid password';
                  }
                  return null;
                },
                controller: passwordController2,
                focus: myFocusNode4,
                TiT: TextInputType.visiblePassword,
                labelText: "Confirm Password",
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
                height: 20.0,
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 35.0,
                ),
                child: Text(
                  "choose your major please..",
                  style: TextStyle(
                    color: Colors.grey[600],
                    fontSize: 15.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              SizedBox(
                height: 12.0,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20.0,
                ),
                child: CheckboxListTile(
                  secondary: Icon(
                    Icons.local_hospital,
                    size: 25.0,
                    color: Colors.amber,
                  ),
                  title: Text(
                    "Medical Consulting",
                  ),
                  activeColor: Colors.amber,
                  value: medical,
                  onChanged: (value) {
                    setState(() {
                      medical = value!;
                    });
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20.0,
                ),
                child: CheckboxListTile(
                  secondary: Icon(
                    Icons.monetization_on,
                    size: 25.0,
                    color: Colors.amber,
                  ),
                  title: Text(
                    "Professional Consulting",
                  ),
                  activeColor: Colors.amber,
                  value: professional,
                  onChanged: (value) {
                    setState(() {
                      professional = value!;
                    });
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20.0,
                ),
                child: CheckboxListTile(
                  secondary: Icon(
                    Icons.medical_services,
                    size: 25.0,
                    color: Colors.amber,
                  ),
                  title: Text(
                    "Psychological Consulting",
                  ),
                  activeColor: Colors.amber,
                  value: physo,
                  onChanged: (value) {
                    setState(() {
                      physo = value!;
                    });
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20.0,
                ),
                child: CheckboxListTile(
                  secondary: Icon(
                    Icons.family_restroom,
                    size: 25.0,
                    color: Colors.amber,
                  ),
                  title: Text(
                    "Family Consulting",
                  ),
                  activeColor: Colors.amber,
                  value: fam,
                  onChanged: (value) {
                    setState(() {
                      fam = value!;
                    });
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20.0,
                ),
                child: CheckboxListTile(
                  secondary: Icon(
                    Icons.work,
                    size: 25.0,
                    color: Colors.amber,
                  ),
                  title: Text(
                    "Administrative Consulting",
                  ),
                  activeColor: Colors.amber,
                  value: admin,
                  onChanged: (value) {
                    setState(() {
                      admin = value!;
                    });
                  },
                ),
              ),
              SizedBox(
                height: 15.0,
              ),
              defaultButton1(
                validing: (value) {
                  if (value.toString().isEmpty) {
                    return 'Must not be empty';
                  }
                  return null;
                },
                controller: detailsController,
                focus: myFocusNode6,
                TiT: TextInputType.text,
                labelText: "Experiences and Details",
                prefix: Icon(
                  Icons.edit_note_outlined,
                  color: Colors.amber,
                  size: 25.0,
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              defaultButton1(
                validing: (value) {
                  if ((value.toString().isEmpty) ||
                      (!value.toString().isDateTime)) {
                    return 'Unvalid Time';
                  }
                  return null;
                },
                kk: () {
                  showTimePicker(
                    context: context,
                    initialTime: TimeOfDay.now(),
                  ).then((value) {
                    print(value?.format(context));
                    timeController.text = value!.format(context).toString();
                  });
                },
                controller: timeController,
                focus: myFocusNode7,
                TiT: TextInputType.text,
                labelText: "Time",
                prefix: Icon(
                  Icons.watch_later,
                  color: Colors.amber,
                  size: 25.0,
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              defaultButton1(
                validing: (value) {
                  if (value.toString().isEmpty) {
                    return 'Must not be empty';
                  }
                  return null;
                },
                controller: addressController,
                focus: myFocusNode8,
                TiT: TextInputType.streetAddress,
                labelText: "Street Address",
                prefix: Icon(
                  Icons.home,
                  color: Colors.amber,
                  size: 25.0,
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              defaultButton1(
                validing: (value) {
                  if (value.toString().isEmpty) {
                    return 'Must not be empty';
                  }
                  return null;
                },
                controller: phoneController,
                focus: myFocusNode9,
                TiT: TextInputType.phone,
                labelText: "Phone Number",
                prefix: Icon(
                  Icons.phone,
                  color: Colors.amber,
                  size: 25.0,
                ),
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
                    onPressed: () {
                      Get.to(CategoriesScreen());
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
                    "you are not an expert? |",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 12.0,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Get.to(User_SignIn());
                    },
                    child: Text(
                      "REGISTER AS A USER",
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
