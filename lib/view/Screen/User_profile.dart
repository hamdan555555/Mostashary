// ignore_for_file: prefer_const_constructors

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mostashary/const.dart';

import '../../Model/user_model.dart';
import '../../servceConfig.dart';

class UserProfile extends StatelessWidget {
  // Users u = new Users();
  String token = Services.token;

  @override
  void initState() async {
    await userPro();
  }

  Future userPro() async {
    http.Response response = await http.get(
        Uri.parse('http://192.168.164.51:8000/api/user-profile'),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        });
    if (response.statusCode == 200) {
      var js = jsonDecode(response.body);
      var info = Users.fromMap(js['data']);
      print(info);
      return info;
    } else {
      throw new Exception('can not load');
    }
  }

  @override
  Widget build(BuildContext context) {
    double widthC = MediaQuery.of(context).size.width * 100;
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        children: <Widget>[
          //==========================================================================================
          // build Top Section of Profile (include : Profile Image)
          //==========================================================================================
          Stack(
            children: <Widget>[
              Ink(
                height: 250,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(50),
                    bottomLeft: Radius.circular(50),
                  ),
                  color: Colors.deepPurpleAccent[700],
                ),
              ),
              Ink(
                height: 200,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/Background.jpg'),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(50),
                    bottomLeft: Radius.circular(50),
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                margin: const EdgeInsets.only(top: 140),
                child: Column(
                  children: <Widget>[
                    Card(
                      elevation: 2,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(100),
                      ),
                      color: Colors.white,
                      child: Container(
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          image: DecorationImage(
                            image: AssetImage('assets/images/Background.jpg'),
                            fit: BoxFit.cover,
                          ),
                          // gradient: LinearGradient(colors: [
                          //   Colors.white,
                          //   Colors.blueGrey,
                          //   Colors.lightBlueAccent,
                          //   Colors.lightBlue,
                          //   Colors.blueAccent,
                          // ]),
                        ),
                        child: Center(
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(85),
                              child: Image.asset('assets/images/Background.jpg',
                                  width: 85, height: 85, fit: BoxFit.fill)),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),

          //==========================================================================================
          // build middle Section of Profile (include : main info  )
          //==========================================================================================
          FutureBuilder(
            future: userPro(),
            builder: (context, snapshot) {
              var ine = userPro();
              return Container(
                width: 200,
                margin: const EdgeInsets.all(10),
                alignment: AlignmentDirectional.center,
                child: Column(
                  children: <Widget>[
                    Text('llll',
                        style: TextStyle(
                            fontSize: 20,
                            color: Color.fromARGB(255, 25, 7, 51),
                            fontWeight: FontWeight.bold)),
                    SizedBox(height: 10),
                    Text('USER',
                        style: TextStyle(color: Colors.deepPurpleAccent[700]))
                  ],
                ),
              );
            },
          ),

          SizedBox(height: 10.0),

          //==========================================================================================
          //  build Bottom Section of Profile (include : email - phone number - about - location )
          //==========================================================================================
          Container(
              padding: EdgeInsets.all(10),
              child: Card(
                child: Container(
                  alignment: Alignment.topLeft,
                  padding: EdgeInsets.all(15),
                  child: Column(
                    children: <Widget>[
                      Column(
                        children: <Widget>[
                          ListTile(
                            leading: Icon(Icons.email,
                                color: Colors.deepPurpleAccent[700]),
                            title: Text("E-Mail"),
                            subtitle: Text("email@gmailc.com"),
                          ),
                          Divider(),
                          ListTile(
                            leading: Icon(Icons.phone,
                                color: Colors.deepPurpleAccent[700]),
                            title: Text("Phone Number"),
                            subtitle: Text("11-111111-11"),
                          ),
                          Divider(),
                          ListTile(
                            leading: Icon(Icons.person,
                                color: Colors.deepPurpleAccent[700]),
                            title: Text("About"),
                            subtitle: Text(
                                "Lorem Ipsum is simply dummy text of the printing and typesetting industry."),
                          ),
                          Divider(),
                          ListTile(
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 12, vertical: 4),
                            leading: Icon(Icons.my_location,
                                color: Colors.deepPurpleAccent[700]),
                            title: Text("Location"),
                            subtitle: Text("Canada"),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              )),
        ],
      ),
    ));
  }
}
