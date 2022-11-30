
import 'package:flutter/material.dart';
import 'package:untitled2/pro_image.dart';

class StackProfile extends StatelessWidget {
  const StackProfile({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          children: [
            Padding (padding: EdgeInsets.only(top: 15,),
              child: Container(
                height: 210,width: 340,
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),topRight: Radius.circular(15)),
                  child: Image.asset("assets/images/download.jpeg",fit:BoxFit.fill,),
                ),
              ),
            ),
            Expanded(
              child: Container(
                color: Colors.white,
                child: Padding (padding: EdgeInsets.only(top: 55,right: 5),
                  child:Center(
                    child: Text('Jerry Luis',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold)),
                  ),),
              ),
            )
          ],
        ),
        Positioned(
            top: 160,left: 110, // (background container size) - (circle height / 2)
            child: CircleAvatar(
              maxRadius: 70,
              child: ImagePro(),
            )
        ),
      ],
    );
  }
}



//
// child: Stack(
// children: [
// Padding(
// padding: const EdgeInsets.only(top: 20,left: 18),
// child: Container(
// // decoration: BoxDecoration(
// //   borderRadius: BorderRadius.only(
// //       topLeft: Radius.circular(20),topRight: Radius.circular(20)
// //   ),
// // ),
//
// height: 180,width: 390,
// child: const Image(
// // image: AssetImage("assets/images/download.jpeg"),
// // fit: BoxFit.cover,),
// ),
// ),
// // Padding(padding: EdgeInsets.symmetric(vertical: 150,horizontal: 133)),
// CircleAvatar(
// //   backgroundColor: Colors.blue,
// radius: 60,
//
// ),
// Container(
// //margin: EdgeInsets.,
// child: const Center(

// ),
// ),
// ),
//
// ],
//),

//
// children: [
// ClipRRect(
// borderRadius: BorderRadius.only(
// topLeft: Radius.circular(10),
// topRight: Radius.circular(10),
// ),
// child: Image.asset(
// 'assets/images/download.jpeg',
// width: 300,
// height: 180,
// fit:BoxFit.fill,alignment: Alignment.topCenter,
// ),
// ),













//Container(
//       height: 220,width: 360,
//         color: Colors.red,
//         child:  Image(
//         //  width: 240,height: 300,
//         image: AssetImage("assets/images/download.jpeg"),
//
//        ),
//       ),
//
//       CircleAvatar(
//         child: Align(alignment: Alignment.bottomCenter,),
//         radius: 70,
//       )
//     ],
//   ),
// Container(
//   //color: Colors.green,
//   height: 50,width: 360,
//    child: Center(
//      child:Text("Jerry Luis",style: TextStyle(
//     fontSize: 25,fontWeight: FontWeight.bold),
//    ),
//    ),
// )