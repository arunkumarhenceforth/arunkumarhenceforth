import 'dart:convert';

import 'package:provider/provider.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'Constant/Api handler.dart';
import 'Constant/constantfile.dart';
import 'State Provider/app_state.dart';
import 'main.dart';

class InsideFilter extends StatefulWidget {
  @override
  State<InsideFilter> createState() => _InsideFilterState();
}

class _InsideFilterState extends State<InsideFilter> {
  final List<String> items = ["Accending", "Decending"];

  String? selectedValue = 'Accending';
  TextEditingController dateInput = TextEditingController();

  @override
  void initState() {
    DateTime now = DateTime.now();
    String formattedDate = DateFormat('yyyy-MM-dd').format(now);
    dateInput.text = "$formattedDate";
    // selectedValue="Accending";
    super.initState();
  }

  int order = 1;
  @override
  Widget build(BuildContext context) {
    AppState provider = Provider.of<AppState>(context, listen: false);
    return Container(
        // width: MediaQuery.of(context).size.width,
        child: Column(
      children: [
        Padding(padding: EdgeInsets.only(top: 10)),
        Text(
          "Post filters",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
        ),
        Divider(
          color: Colors.black,
        ),
        Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Container(
              height: 170,
             // color: Colors.white,
              child: Column(children: [
                Padding(
                  padding: EdgeInsets.only(top: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [

                      CircleAvatar(
                        backgroundColor: Colors.black26,
                        radius: 17,
                        child: Icon(
                          Icons.calendar_month,
                          color: Colors.black,
                          size: 21,
                        ),
                      ),

                      Text(
                        "  Go to:",
                        style: TextStyle(fontSize: 20),
                      ),
                      Spacer(),
                      Container(
                        padding: EdgeInsets.only(left: 14, bottom: 4),
                        height: 35,
                        width: 140,
                        decoration: BoxDecoration(
                          color: Colors.black12,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: TextField(
                          decoration: InputDecoration(
                            border: InputBorder.none,
                          ),
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                          controller: dateInput,
                          readOnly: true,
                          onTap: () async {
                            DateTime? pickedDate = await showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime(1990),
                                lastDate: DateTime(2100));
                            if (pickedDate != null) {
                              print(pickedDate);
                              String formattedDate =
                                  DateFormat('yyyy-MM-dd').format(pickedDate);
                              print(formattedDate);
                              setState(() {
                                dateInput.text = formattedDate;
                              });
                            } else {}
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 15),
                  child: Row(
                    children: [

                      CircleAvatar(
                        backgroundColor: Colors.black26,
                        radius: 17,
                        child: Icon(
                          Icons.sort,
                          color: Colors.black,
                          size: 21,
                        ),
                      ),
                      Text(
                        "  Sort by:",
                        style: TextStyle(fontSize: 20),
                      ),
                      Spacer(),
                      Container(
                        height: 35,
                        width: 140,
                        decoration: BoxDecoration(
                            color: Colors.black12,
                            borderRadius: BorderRadius.circular(10)),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton2(
                              isExpanded: true,
                              dropdownMaxHeight: 80,
                              dropdownWidth: 140,
                              buttonPadding: EdgeInsets.only(left: 14),
                              hint: Row(
                                children: [
                                  Expanded(
                                      child: Text(
                                    '$selectedValue',
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black),
                                  )),
                                ],
                              ),
                              icon: Icon(
                                Icons.arrow_drop_down,
                                size: 30,
                                color: Colors.black,
                              ),
                              items: items
                                  .map((item) => DropdownMenuItem<String>(
                                        value: item,
                                        child: Text(
                                          item,
                                          style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ))
                                  .toList(),
                              value: selectedValue,
                              onChanged: (String? value) {
                                setState(() {
                                  selectedValue = value ?? "";
                                  if (selectedValue == "Decending") {
                                    order = 0;
                                  } else if (selectedValue == "Accending") {
                                    order = 1;
                                  }
                                });
                              }),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 12),
                  child: Row(
                    children: [


                           Container(
                            height: 40,
                            width: 160,
                            decoration: BoxDecoration(
                                border:
                                    Border.all(color: Colors.black45, width: 2),
                                borderRadius: BorderRadius.circular(8)),
                            child: InkWell(
                              child: Center(
                                child: Text(
                                  "Clear",
                                  style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              onTap: () {
                                initState();
                              },
                            ),
                          ),
                      Spacer(),
                      SizedBox(
                        height: 38,
                        width: 160,
                        child: ElevatedButton(
                            onPressed: () {
                              provider.getAlbum(
                                  order: order, date: dateInput.text);
                              setState(() {
                                Navigator.pop(context);
                              });
                            },
                            child: Text("Done",
                                style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold))),
                      ),
                    ],
                  ),
                )
              ]),
            ))
      ],
    ));
  }
}
