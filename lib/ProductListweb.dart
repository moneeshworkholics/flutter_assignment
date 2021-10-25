// ignore_for_file: file_names, prefer_const_constructors

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_assignment/AddProduct.dart';
import 'package:flutter_assignment/editproduct.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductListweb extends StatefulWidget {
  @override
  _ProductListwebState createState() => _ProductListwebState();
}

class _ProductListwebState extends State<ProductListweb> {
  bool status = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          automaticallyImplyLeading: false,
          title: Text(
            "Dashboard",
            style: GoogleFonts.poppins(
                textStyle: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                    fontSize: ScreenUtil().setSp(17))),
          ),
          actions: [
            FlutterSwitch(
              width: ScreenUtil().setSp(60),
              height: ScreenUtil().setHeight(35),
              valueFontSize: ScreenUtil().setSp(18),
              toggleSize: ScreenUtil().setSp(25),
              value: status,
              borderRadius: ScreenUtil().radius(30),
              padding: ScreenUtil().setHeight(8),
              // showOnOff: true,
              onToggle: (val) {
                setState(() {
                  status = val;
                });
              },
            ),
            Container(
              margin: EdgeInsets.only(bottom: ScreenUtil().setHeight(5)),
              child: InkWell(
                onTap: () {
                  Get.off(const AddProduct());
                },
                child: Image.asset(
                  "assets/images/add.png",
                  height: ScreenUtil().setHeight(30),
                ),
              ),
            ),
            PopupMenuButton<String>(
              icon: Icon(
                Icons.more_vert,
                color: Colors.black,
              ),
              tooltip: "Sort",
              onSelected: handleClick,
              itemBuilder: (BuildContext context) {
                return {'Sort By Name', 'Sort By Date', 'Sort By Rating'}
                    .map((String choice) {
                  return PopupMenuItem<String>(
                    value: choice,
                    child: Text(choice),
                  );
                }).toList();
              },
            ),
          ],
        ),
        body: product.isEmpty
            ? Center(
                child: Text(
                  "There are no products",
                  style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w400,
                          fontSize: ScreenUtil().setSp(14))),
                ),
              )
            : status == false
                ? ListView.builder(
                    itemCount: product.length,
                    itemBuilder: (BuildContext context, int index) {
                      double qty = double.parse(product[index]['popularity']);
                      // DateTime date = DateTime(product[index]['launchedat']);
                      return Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        child: Row(
                          children: [
                            Expanded(
                                flex: 5,
                                child: Container(
                                  padding:
                                      EdgeInsets.all(ScreenUtil().setSp(10)),
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text(
                                              "${product[index]['name']}"
                                                  .toUpperCase(),
                                              textAlign: TextAlign.start,
                                              style: GoogleFonts.poppins(
                                                  textStyle: TextStyle(
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontSize: ScreenUtil()
                                                          .setSp(15))),
                                            ),
                                          ),
                                        ],
                                      ), //       Row(

                                      Padding(
                                        padding: const EdgeInsets.all(4.0),
                                        child: Row(
                                          children: [
                                            Text(
                                              "Created At :",
                                              style: GoogleFonts.poppins(
                                                  textStyle: TextStyle(
                                                      color: Color(0xff969696),
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      fontSize: ScreenUtil()
                                                          .setSp(14))),
                                            ),
                                            Text(
                                              " ${product[index]['launchedat']}"
                                                  .substring(0, 10),
                                              style: GoogleFonts.poppins(
                                                  textStyle: TextStyle(
                                                      color: Color(0xff969696),
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      fontSize: ScreenUtil()
                                                          .setSp(14))),
                                            ),
                                          ],
                                        ),
                                      ),

                                      Row(
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.all(
                                                ScreenUtil().setHeight(4)),
                                            child: Text(
                                              "Launch Site : ${product[index]['launchSite']}",
                                              style: GoogleFonts.poppins(
                                                  textStyle: TextStyle(
                                                      color: Color(0xff969696),
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      fontSize: ScreenUtil()
                                                          .setSp(14))),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          RatingBar.builder(
                                            itemSize: ScreenUtil().setSp(30),
                                            initialRating: qty,
                                            // minRating: 1,
                                            direction: Axis.horizontal,
                                            allowHalfRating: false,
                                            itemCount: 5,
                                            itemPadding:
                                                const EdgeInsets.symmetric(
                                                    horizontal: 4.0),
                                            itemBuilder: (context, _) =>
                                                const Icon(
                                              Icons.star,
                                              color: Colors.amber,
                                            ),
                                            onRatingUpdate: (rating) {
                                              rating = product[index]
                                                  ['popularity'] as double;
                                            },
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                )),
                            Expanded(
                                flex: 1,
                                child: Container(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      InkWell(
                                          onTap: () {
                                            if (product.every((element) =>
                                                element["name"] ==
                                                product[index]["name"])) {
                                              Get.off(EditProduct(
                                                  name: product[index]['name'],
                                                  // launchedat: date,
                                                  launchSite: product[index]
                                                      ['launchSite'],
                                                  popularity: product[index]
                                                      ['popularity']));
                                            }
                                          },
                                          child: Image.asset(
                                            "assets/images/edit.png",
                                            height: ScreenUtil().setSp(40),
                                            width: ScreenUtil().setWidth(40),
                                          )),
                                      SizedBox(
                                        height: ScreenUtil().setHeight(10),
                                      ),
                                      InkWell(
                                          onTap: () {
                                            Get.defaultDialog(
                                              contentPadding:
                                                  EdgeInsets.all(20),
                                              title: "",
                                              barrierDismissible: true,
                                              textCancel: "Cancel",
                                              textConfirm: "Yes",
                                              confirmTextColor: Colors.white,
                                              onConfirm: () {
                                                debugPrint("$product");
                                                for (var v in product) {
                                                  if (v["name"] ==
                                                      product[index]["name"]) {
                                                    setState(() {
                                                      product.remove(
                                                          product[index]);
                                                      Get.back();
                                                    });
                                                  }
                                                }

                                                debugPrint("$product");
                                                // }
                                              },
                                              content: Text(
                                                "Do you really want to delete ?",
                                                style: GoogleFonts.poppins(
                                                    textStyle: TextStyle(
                                                        color: Colors.black,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        fontSize: ScreenUtil()
                                                            .setSp(14))),
                                              ),
                                            );
                                          },
                                          child: Image.asset(
                                            "assets/images/delete.png",
                                            height: ScreenUtil().setSp(40),
                                            width: ScreenUtil().setWidth(40),
                                          ))
                                    ],
                                  ),
                                ))
                          ],
                        ),
                      );
                    })
                : GridView.extent(
                    maxCrossAxisExtent: 300.0,
                    crossAxisSpacing: 20.0,
                    mainAxisSpacing: 20.0,
                    children: product.map((el) {
                      double qty = double.parse(el['popularity']);
                      return Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        child: ListTile(
                          contentPadding:
                              EdgeInsets.all(ScreenUtil().setHeight(10)),
                          title: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "${el['name']}".toUpperCase(),
                              style: GoogleFonts.poppins(
                                  textStyle: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w500,
                                      fontSize: ScreenUtil().setSp(15))),
                            ),
                          ),
                          subtitle: Column(
                            children: [
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: Row(
                                      children: [
                                        Text(
                                          "Created At :",
                                          style: GoogleFonts.poppins(
                                              textStyle: TextStyle(
                                                  color: Color(0xff969696),
                                                  fontWeight: FontWeight.w400,
                                                  fontSize:
                                                      ScreenUtil().setSp(14))),
                                        ),
                                        Text(
                                          "${el['launchedat']}"
                                              .substring(0, 10),
                                          style: GoogleFonts.poppins(
                                              textStyle: TextStyle(
                                                  color: Color(0xff969696),
                                                  fontWeight: FontWeight.w400,
                                                  fontSize:
                                                      ScreenUtil().setSp(14))),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.all(
                                        ScreenUtil().setHeight(4)),
                                    child: Text(
                                      "Launch Site :${el['launchSite']}",
                                      style: GoogleFonts.poppins(
                                          textStyle: TextStyle(
                                              color: Color(0xff969696),
                                              fontWeight: FontWeight.w400,
                                              fontSize:
                                                  ScreenUtil().setSp(14))),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  RatingBar.builder(
                                    itemSize: ScreenUtil().setSp(20),
                                    initialRating: qty,
                                    // minRating: 1,
                                    direction: Axis.horizontal,
                                    allowHalfRating: false,
                                    itemCount: 5,
                                    itemPadding: const EdgeInsets.symmetric(
                                        horizontal: 4.0),
                                    itemBuilder: (context, _) => const Icon(
                                      Icons.star,
                                      color: Colors.amber,
                                    ),
                                    onRatingUpdate: (rating) {
                                      rating = el['popularity'] as double;
                                    },
                                  )
                                ],
                              ),
                              Row(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.all(
                                        ScreenUtil().setHeight(8)),
                                    child: Container(
                                      width: ScreenUtil().setSp(60),
                                      decoration: BoxDecoration(
                                        color: Color(0xff0081C9),
                                        borderRadius: BorderRadius.circular(
                                            ScreenUtil().radius(20.0)),
                                      ),
                                      height: ScreenUtil().setHeight(25),
                                      child: ElevatedButton(
                                          onPressed: () {
                                            if (product.every((element) =>
                                                element["name"] ==
                                                el["name"])) {
                                              Get.off(EditProduct(
                                                  name: el['name'],
                                                  // launchedat: date,
                                                  launchSite: el['launchSite'],
                                                  popularity:
                                                      el['popularity']));
                                            }
                                          },
                                          style: ButtonStyle(
                                            shape: MaterialStateProperty.all<
                                                RoundedRectangleBorder>(
                                              RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        ScreenUtil()
                                                            .radius(20.0)),
                                              ),
                                            ),
                                            backgroundColor:
                                                MaterialStateProperty.all(
                                                    Colors.transparent),
                                            shadowColor:
                                                MaterialStateProperty.all(
                                                    Colors.transparent),
                                          ),
                                          child: Text(
                                            "Edit",
                                            style: GoogleFonts.poppins(
                                                textStyle: TextStyle(
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.w400,
                                                    fontSize: ScreenUtil()
                                                        .setSp(12))),
                                          )),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.all(
                                        ScreenUtil().setHeight(8)),
                                    child: Container(
                                      width: ScreenUtil().setSp(70),
                                      decoration: BoxDecoration(
                                        color: Color(0xffFF5F00),
                                        borderRadius: BorderRadius.circular(
                                            ScreenUtil().radius(20.0)),
                                      ),
                                      height: ScreenUtil().setHeight(25),
                                      child: ElevatedButton(
                                          onPressed: () {
                                            Get.defaultDialog(
                                              contentPadding:
                                                  EdgeInsets.all(20),
                                              title: "",
                                              barrierDismissible: true,
                                              textCancel: "Cancel",
                                              textConfirm: "Yes",
                                              confirmTextColor: Colors.white,
                                              onConfirm: () {
                                                debugPrint("$product");
                                                for (var v in product) {
                                                  if (v["name"] == el["name"]) {
                                                    setState(() {
                                                      product.remove(el);
                                                      Get.back();
                                                    });
                                                  }
                                                }

                                                debugPrint("$product");
                                                // }
                                              },
                                              content: Text(
                                                "Do you really want to delete ?",
                                                style: GoogleFonts.poppins(
                                                    textStyle: TextStyle(
                                                        color: Colors.black,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        fontSize: ScreenUtil()
                                                            .setSp(14))),
                                              ),
                                            );
                                            // if (product.every((element) =>
                                            //     element["name"] ==
                                            //     el["name"])) {
                                            //   setState(() {
                                            //     product.remove(el);
                                            //     debugPrint("$product");
                                            //   });
                                            // }
                                          },
                                          style: ButtonStyle(
                                            shape: MaterialStateProperty.all<
                                                RoundedRectangleBorder>(
                                              RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        ScreenUtil()
                                                            .radius(20.0)),
                                              ),
                                            ),
                                            backgroundColor:
                                                MaterialStateProperty.all(
                                                    Colors.transparent),
                                            shadowColor:
                                                MaterialStateProperty.all(
                                                    Colors.transparent),
                                          ),
                                          child: Text(
                                            "Delete",
                                            style: GoogleFonts.poppins(
                                                textStyle: TextStyle(
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.w400,
                                                    fontSize: ScreenUtil()
                                                        .setSp(12))),
                                          )),
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      );
                    }).toList()));
  }

  void handleClick(String value) {
    switch (value) {
      case 'Sort By Name':
        setState(() {
          debugPrint("yes");
          product.sort((a, b) {
            return a['name'].toLowerCase().compareTo(b['name'].toLowerCase());
          });
        });
        break;
      case 'Sort By Date':
        setState(() {
          debugPrint("yes");
          product.sort((a, b) {
            return a['launchedat']
                .toLowerCase()
                .compareTo(b['launchedat'].toLowerCase());
          });
        });
        break;
      case 'Sort By Rating':
        setState(() {
          debugPrint("yes");
          product.sort((b, a) {
            return a['popularity']
                .toLowerCase()
                .compareTo(b['popularity'].toLowerCase());
          });
        });

        break;
    }
  }
}
