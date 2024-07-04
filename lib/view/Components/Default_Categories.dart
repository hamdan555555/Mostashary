// ignore_for_file: prefer_const_constructors

import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mostashary/view/Screen/experts_1.dart';

// ignore: non_constant_identifier_names

Widget Default_Categories({
// ignore: non_constant_identifier_names
  required String TextCate,
  required String TextDes,
  required String Avatar,
  required  Function() tap,
}) =>
    Padding(
      padding: const EdgeInsets.all(5.0),
      child: GestureDetector(
        onTap:tap,
        child: Container(
          height: 125,
          width: 340,
          // ignore: sort_child_properties_last
          child: Padding(
            padding: const EdgeInsets.all(3.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 5),
                  child: Text(
                    TextCate,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Row(
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    Stack(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 5),
                          child: CircleAvatar(
                            backgroundColor: Color.fromARGB(255, 138, 19, 212),
                            radius: 30,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: CircleAvatar(
                            backgroundImage: AssetImage(Avatar),
                            radius: 30,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 18,
                    ),
                    Text(
                      TextDes,
                      style: TextStyle(
                        fontSize: 13,
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 300),
                  child: Icon(
                    Icons.navigate_next_outlined,
                    color: Color.fromARGB(255, 138, 19, 212),
                    size: 26,
                  ),
                ),
              ],
            ),
          ),
          decoration: BoxDecoration(
            color: Colors.white70,
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
