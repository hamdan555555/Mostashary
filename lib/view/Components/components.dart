import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
FocusNode focus = new FocusNode();

Function ff = (String? s){};

Widget defaultButton(
    {

  required  TextEditingController controller,
  required  FocusNode focus,
  required  TextInputType TiT,
  required String labelText,
  required String? Function(String?)? validing,



}) =>  Padding(
  padding: const EdgeInsets.symmetric(
    horizontal: 30.0,
  ),
  child: TextFormField(
     validator: validing,
    cursorColor: Colors.grey[500],
    focusNode: focus,
    controller: controller,
    keyboardType: TiT,
    autocorrect: true,

    decoration: InputDecoration(
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20.0),
        borderSide: BorderSide(
          color: Colors.red,
        ),
      ),
      focusColor: Colors.purple,
      labelText: labelText,
      fillColor: Colors.white,
      focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25.0),
          borderSide: BorderSide(
            color: Colors.purple,
            width: 3.0,
          )
      ),
      enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),
          borderSide: BorderSide(
            color: Colors.grey,
          )
      ),
      // errorBorder: ,
      labelStyle: TextStyle(
        color: focus.hasFocus ? Colors.grey : Colors.grey,
      ),
    ),
  ),
);















Widget defaultButton1(
    {
      required  TextEditingController controller,
      required  FocusNode focus,
      required  TextInputType TiT,
      required String labelText,
      required Icon prefix,
      required String? Function(String?)? validing,
      void Function()? kk,
    }
    ) => Padding(
  padding: const EdgeInsets.symmetric(
    horizontal: 30.0,
  ),
  child: TextFormField(
    onTap:kk ,
    cursorColor: Colors.purple,
    focusNode: focus,
    controller: controller,
    keyboardType: TiT,
    autocorrect: true,

    decoration: InputDecoration(
      prefixIcon: prefix,
      focusColor: Colors.purple,
      labelText: labelText,
      fillColor: Colors.white,
      focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25.0),
          borderSide: BorderSide(
            color: Colors.purple,
            width: 3.0,
          )
      ),
      enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),
          borderSide: BorderSide(
            color: Colors.grey,
          )
      ),
      labelStyle: TextStyle(
        color: focus.hasFocus ? Colors.grey : Colors.grey,
      ),
    ),
  ),
);




Widget defaultButton2(
    {
      required  TextEditingController controller,
      required  FocusNode focus,
      required  TextInputType TiT,
      required String labelText,
      required Icon prefix,
      required Icon suffix,
      required String? Function(String?)? validing,
    }
    ) => Padding(
  padding: const EdgeInsets.symmetric(
    horizontal: 30.0,
  ),
  child: TextFormField(
    obscureText: true,
    cursorColor: Colors.purple,
    focusNode: focus,
    controller: controller,
    keyboardType: TiT,
    autocorrect: true,

    decoration: InputDecoration(
      prefixIcon: prefix,
      suffixIcon: suffix,
      focusColor: Colors.purple,
      labelText: labelText,
      fillColor: Colors.white,
      focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25.0),
          borderSide: BorderSide(
            color: Colors.purple,
            width: 3.0,
          )
      ),
      enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),
          borderSide: BorderSide(
            color: Colors.grey,
          )
      ),
      labelStyle: TextStyle(
        color: focus.hasFocus ? Colors.grey : Colors.grey,
      ),
    ),
  ),
);










Widget checkBox({
  required Icon icon,
  required Text text,
  required bool mybool,
  required Function function,

}) =>   Padding(
padding: const EdgeInsets.symmetric(
horizontal: 20.0,
),
child: CheckboxListTile(
secondary: icon,
title: text,
activeColor: Colors.amber,
value:mybool ,
onChanged:function(bool) ,
),
);






Widget buildChatItem({
  required String name,
  required String stext,

})=> Row(
  children: [
    Stack(
      alignment:AlignmentDirectional.bottomEnd,
      children: [
        CircleAvatar(
          radius: 25.0,
        ),
        CircleAvatar(
          radius: 7.0,
          backgroundColor: Colors.white,
        ),
        CircleAvatar(
          radius: 6.5,
          backgroundColor: Colors.green,
        ),
      ],
    ),
    Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          name,
          style: TextStyle(
            color: Colors.white,
            fontSize: 15.0,
          ),

        ),
        SizedBox(
          height: 10.0,
        ),
        Row(
          children: [
            Text(
             stext,
              style: TextStyle(
                color: Colors.white,
                fontSize: 12.0,
              ),

            ),
            SizedBox(
              width: 3.0,
            ),
            // Text(
            //   "  .11:15 pm",
            //   style: TextStyle(
            //     color: Colors.white,
            //     fontSize: 10,
            //   ),
            // )
          ],
        )
      ],
    )
  ],
);