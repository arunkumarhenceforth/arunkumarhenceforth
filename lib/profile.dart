import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:untitled2/pro_image.dart';
class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 90,width: 430,
        child: Row(
          children: [
            Padding(padding: EdgeInsets.only(left: 13)),
            CircleAvatar(
              // backgroundColor: Colors.green,
              radius: 30,
              child:ImagePro(),
            ),
            Padding(padding: EdgeInsets.only(left: 10)),
            Text("Jerry Luis",style: TextStyle(fontSize: 21,fontWeight: FontWeight.bold),),
           // Padding(padding: EdgeInsets.only(left: 140)),

          ],
        ) );
  }
}
