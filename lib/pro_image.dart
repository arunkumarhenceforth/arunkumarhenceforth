import 'package:flutter/material.dart';
class ImagePro extends StatelessWidget {
  const ImagePro({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  ClipOval(
      child: Image.asset("assets/images/images.jpeg",fit: BoxFit.fill,
      ),
    );
  }
}
// Image.asset("assets/images/images.jpeg",fit: BoxFit.fill,);