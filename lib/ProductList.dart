// ignore_for_file: file_names, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_assignment/AddProduct.dart';
import 'package:flutter_assignment/editproduct.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductList extends StatefulWidget {
  @override
  _ProductListState createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
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
            Container(
              margin: EdgeInsets.only(bottom: ScreenUtil().setHeight(5)),
              child: InkWell(
                onTap: () {
                  Get.to(const AddProduct());
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
            : ListView.builder(
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
                              padding: EdgeInsets.all(ScreenUtil().setSp(10)),
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
                                                  fontWeight: FontWeight.w500,
                                                  fontSize:
                                                      ScreenUtil().setSp(15))),
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
                                                  fontWeight: FontWeight.w400,
                                                  fontSize:
                                                      ScreenUtil().setSp(14))),
                                        ),
                                        Text(
                                          " ${product[index]['launchedat']}"
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
                                        itemSize: ScreenUtil().setSp(30),
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
                                          rating = product[index]['popularity']
                                              as double;
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
                                          Get.to(EditProduct(
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
                                          contentPadding: EdgeInsets.all(20),
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
                                                  product
                                                      .remove(product[index]);
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
                                                    fontWeight: FontWeight.w400,
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
                }));
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
