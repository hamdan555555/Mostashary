// ignore_for_file: camel_case_types, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect.dart';
import 'package:mostashary/view/Components/build_List_experts.dart';

import '../../servceConfig.dart';
import 'package:http/http.dart' as http;

class favorite_screen extends StatelessWidget {
  favorite_screen({super.key});

  static List favorite = [];
  String token = Services.token;

  Future<http.Response> getFavorite() async {
        print('favorite 1');
    http.Response response = await http.get(
        Uri.parse('${Services.dmainName}get_favourite_expert'),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        });
            print('favorite 2');
    if (response.statusCode == 200) {
  
      var map = jsonDecode(response.body);
      print('favorite 2');
      favorite = map['data'];
      print('favorite 3');

      print(favorite);
      return response;
    } else {
      throw new Exception('can not load');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: getFavorite(),
        builder: (context, snapshot) {
          return Column(
            children: [
              Stack(
                children: [
                  Container(
                    width: double.infinity,
                    height: 120,
                    decoration: BoxDecoration(
                        color: Colors.deepPurpleAccent[700],
                        borderRadius: const BorderRadius.only(
                          bottomRight: Radius.circular(50),
                          bottomLeft: Radius.circular(50),
                        )),
                  ),
                  Container(
                    width: double.infinity,
                    height: 100,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/images/Background.jpg'),
                          fit: BoxFit.cover,
                        ),
                        color: Color.fromARGB(255, 69, 193, 158),
                        borderRadius: const BorderRadius.only(
                          bottomRight: Radius.circular(70),
                          bottomLeft: Radius.circular(70),
                        )),
                    child: Center(
                      child: Text(
                        'Favorite',
                        style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      ListView.separated(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                Get.to(favorite_screen());
                              },
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 8),
                                child: Row(
                                  children: [
                                    Stack(
                                      alignment: AlignmentDirectional.bottomEnd,
                                      children: [
                                        CircleAvatar(
                                          radius: 30.0,
                                          backgroundImage: AssetImage(
                                            'assets/images/Background.jpg',
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      width: 20.0,
                                    ),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            favorite[index]['name'].toString(),
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                                fontSize: 16.0,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          SizedBox(
                                            height: 5.0,
                                          ),
                                          Row(
                                            children: [
                                              Expanded(
                                                child: Text(
                                                  favorite[index]['Address'],
                                                  maxLines: 1,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                ),
                                              ),
                                              IconButton(
                                                onPressed: () {},
                                                icon: Icon(
                                                  Icons.favorite_border_rounded,
                                                  size: 25,
                                                  color: Colors
                                                      .deepPurpleAccent[700],
                                                ),
                                              )
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                          separatorBuilder: (context, index) => Divider(
                                color: Colors.black,
                              ),
                          itemCount: favorite.length),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
