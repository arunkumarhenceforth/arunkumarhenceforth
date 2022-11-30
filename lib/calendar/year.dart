import 'package:flutter/material.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/rendering.dart';

class SelectYear extends StatefulWidget {
  const SelectYear({Key? key}) : super(key: key);
  @override
  State<SelectYear> createState() => _SelectYearState();
}
class _SelectYearState extends State<SelectYear> {
  final List<String> items = [
    '1991','1992','1993','1994','1995','1996','1997','1998','1999','2000','2001', '2002','2003','2004','2005','2006',
    '2007','2008','2009', '2010','2011','2012','2013','2014', '2015','2016','2017','2018','2019','2020','2021','2022'
  ];
  String? selectedValue;
  @override
  Widget build(BuildContext context) {
    return Padding(padding: EdgeInsets.only(left: 8),
      child: DropdownButtonHideUnderline(
        child: DropdownButton2(
          isExpanded: true,
          buttonPadding: const EdgeInsets.only(left: 8),
          hint: Row(
            children: const [
              Expanded(
                child: Text('2022', style: TextStyle(fontSize: 15,
                  fontWeight: FontWeight.bold, color: Colors.black,),
                ),
              ),
            ],
          ),

          icon: const Icon(Icons.arrow_drop_down, size: 30,color: Colors.black,),
          buttonHeight: 35,buttonWidth: 80,
          buttonDecoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.black12,
          ),
          itemPadding: const EdgeInsets.only(left: 14, right: 14),
          dropdownMaxHeight: 125,
          dropdownWidth: 70,
          dropdownElevation: 8,
          scrollbarRadius: const Radius.circular(40),
          scrollbarThickness: 6,
          scrollbarAlwaysShow: true,
          items: items.map((item) => DropdownMenuItem<String>(value: item,
            child: Text(item, style: const TextStyle(
              fontSize: 15, fontWeight: FontWeight.bold,),
            ),
          ))
              .toList(), value: selectedValue, onChanged: (value) {
          setState(() {selectedValue = value as String;
          }
          );
        },
        ),
      ),
    );
  }
}
