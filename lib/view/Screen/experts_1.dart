// ignore_for_file: camel_case_types, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect.dart';
import 'package:http/http.dart';
import 'package:mostashary/Controller/Experts_controller.dart';
import 'package:mostashary/Model/Experts_model.dart';
import 'package:mostashary/servceConfig.dart';
import 'package:mostashary/view/Components/build_List_experts.dart';
import 'package:mostashary/view/Screen/categoriesScreen.dart';

import 'package:http/http.dart' as http;

import 'FavoriteScreen.dart';

class expert_1 extends StatefulWidget {
  expert_1({super.key, this.type, this.experttype});
  var type;
  var experttype;
  static List ex = [];

  @override
  State<expert_1> createState() => _expert_1State();
}

class _expert_1State extends State<expert_1> {
  var _controller = Get.put(CategoriesScreen());
  
  String token = Services.token;
  bool love = true;



Future<http.Response> getExpertTypeEx() async {
    http.Response response = await http.get(
        Uri.parse('${Services.dmainName}fetch-type-of-experts-in-expert/${widget.type}'),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        });
    if (response.statusCode == 200) {
      var map = jsonDecode(response.body);
      expert_1.ex = map['experts'];
      print(expert_1.ex);
      return response;
    } else {
      throw new Exception('can not load');
    }
  }



  Future<http.Response> getExpertTypeUs() async {
    http.Response response = await http.get(
        Uri.parse('${Services.dmainName}fetch-type-of-experts/${widget.type}'),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        });
    if (response.statusCode == 200) {
      var map = jsonDecode(response.body);
      expert_1.ex = map['experts'];
      print(expert_1.ex);
      return response;
    } else {
      throw new Exception('can not load');
    }
  }

  Future addFavorite() async {
    var headers = {
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    };
    var request = http.Request('POST',
        Uri.parse('http://192.168.164.51:8000/api/add_favourite_expert/2'));

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
    // _controller.id = widget.id;
    return Scaffold(
      body: FutureBuilder(
        future: Services.mybool ? getExpertTypeEx() : getExpertTypeUs(),
        builder: (context, snapshot) {
          return Column(
            children: [
              Stack(
                children: [
                  Container(
                    width: double.infinity,
                    height: 300,
                    decoration: BoxDecoration(
                        color: Colors.deepPurpleAccent[700],
                        borderRadius: const BorderRadius.only(
                          bottomRight: Radius.circular(70),
                        )),
                  ),
                  Container(
                    width: double.infinity,
                    height: 280,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/images/Background.jpg'),
                          fit: BoxFit.cover,
                        ),
                        color: Color.fromARGB(255, 69, 193, 158),
                        borderRadius: const BorderRadius.only(
                          bottomRight: Radius.circular(70),
                        )),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 30),
                          child: Row(
                            children: [
                              IconButton(
                                onPressed: () {
                                  Get.offAll(CategoriesScreen());
                                },
                                icon: Icon(
                                  Icons.arrow_back_sharp,
                                  size: 30,
                                  color: Colors.white,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 255),
                                child: GestureDetector(
                                  onTap: () {
                                    Get.to(favorite_screen());
                                    print('profile');
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.only(right: 7),
                                    child: CircleAvatar(
                                      radius: 25,
                                      backgroundColor:
                                          Color.fromARGB(255, 215, 211, 211),
                                      backgroundImage: AssetImage(
                                          'assets/images/Background.jpg'),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            top: 150,
                            left: 8,
                          ),
                          child: Text(
                            widget.experttype,
                            style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.w800,
                                color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          showSearch(context: context, delegate: DataSearch());
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(
                              top: 15, left: 15, right: 15),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20.0),
                              color: Colors.grey[300],
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(9.0),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.search,
                                    size: 20,
                                  ),
                                  SizedBox(
                                    width: 15.0,
                                  ),
                                  Text('Search'),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      GetBuilder(
                          init: ExpertsController(),
                          builder: (controller) {
                            return ListView.separated(
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              itemBuilder: (context, index) {
                                //var item = Expertstypes[index];
                                return GestureDetector(
                                  onTap: () {
                                    Get.to(favorite_screen());
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8),
                                    child: Row(
                                      children: [
                                        Stack(
                                          alignment:
                                              AlignmentDirectional.bottomEnd,
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
                                                expert_1.ex[index]['name']
                                                    .toString(),
                                                maxLines: 1,
                                                overflow: TextOverflow.ellipsis,
                                                style: TextStyle(
                                                    fontSize: 16.0,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              SizedBox(
                                                height: 5.0,
                                              ),
                                              Row(
                                                children: [
                                                  Expanded(
                                                    child: Text(
                                                      expert_1.ex[index]
                                                          ['experiences'],
                                                      maxLines: 1,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                    ),
                                                  ),
                                                  IconButton(
                                                    onPressed: () {
                                                      setState(() {
                                                        love = false;
                                                      });
                                                      addFavorite();
                                                    },
                                                    icon: Icon(
                                                        Icons.favorite_sharp,
                                                        size: 25,
                                                        color: love
                                                            ? Colors.grey
                                                            : Colors
                                                                .deepPurple),
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
                              itemCount: expert_1.ex.length,
                            );
                          }),
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

class DataSearch extends SearchDelegate<String> {
  final names = [
    "Ahmad",
    "mahmoud",
    "Donea",
    "Rama",
    "Hiba",
    "saly",
    "khlil",
    "yasser",
    "khalied",
    "memo",
    "rasha",
    "Hh"
  ];

  final recentNamas = [
    "yasser",
    "khalied",
    "khlil",
    "yasser",
    "khalied",
  ];
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = " ";
        },
        icon: Icon(Icons.clear),
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, '');
      },
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation,
      ),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          color: Colors.grey,
          child: Text(query),
        ),
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestionList = query.isEmpty
        ? recentNamas
        : names.where((element) => element.startsWith(query)).toList();
    return ListView.separated(
      itemBuilder: (context, index) => GestureDetector(
        onTap: () => print('object'),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Row(
            children: [
              Stack(
                alignment: AlignmentDirectional.bottomEnd,
                children: [
                  CircleAvatar(
                      radius: 30.0,
                      backgroundImage:
                          AssetImage('assets/images/Background.jpg')),
                ],
              ),
              SizedBox(
                width: 20.0,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RichText(
                      text: TextSpan(
                        text: suggestionList[index].substring(0, query.length),
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                        children: [
                          TextSpan(
                            text: suggestionList[index].substring(query.length),
                            style: TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 5.0,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            'Hello Mahmoud I am  so Sorry Hello Mahmoud I am  so Sorry ',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.favorite_border_rounded,
                            size: 25,
                            color: Colors.deepPurpleAccent[700],
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
      ),
      separatorBuilder: (context, index) => Divider(
        color: Colors.black,
      ),
      itemCount: suggestionList.length,
    );
  }
}

/* 

 ListTile(
        onTap: () {
          showResults(context);
        },
        leading: Icon(Icons.person),
        title: RichText(
          text: TextSpan(
            text: suggestionList[index].substring(0, query.length),
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            children: [
              TextSpan(
                text: suggestionList[index].substring(query.length),
                style: TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                ),
              )
            ],
          ),
        ),
      ),
      
       */
