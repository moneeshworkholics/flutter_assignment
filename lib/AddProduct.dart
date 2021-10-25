// ignore_for_file: file_names, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_assignment/main.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

List product = [];

class AddProduct extends StatefulWidget {
  const AddProduct({Key? key}) : super(key: key);

  @override
  _AddProductState createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  TextEditingController name = TextEditingController();
  TextEditingController _datecontroller = TextEditingController();
  DateTime date = DateTime.now();
  var myFormat = DateFormat('d-MM-yyyy');
  TextEditingController launchsite = TextEditingController();
  TextEditingController popularity = TextEditingController();
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: date,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    setState(() {
      date = picked ?? date;
      _datecontroller.text = myFormat.format(date);
    });
  }

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: Text(
          "Add Product",
          style: GoogleFonts.poppins(
              textStyle: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                  fontSize: ScreenUtil().setSp(17))),
        ),
      ),
      body: Center(
        child: Form(
          key: _formKey,
          child: ListView(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(ScreenUtil().setHeight(8)),
                child: TextFormField(
                  onSaved: (value) {
                    name.text = value!;
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Product Name is empty';
                    }
                    return null;
                  },
                  style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                          fontSize: ScreenUtil().setSp(14))),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderSide:
                          const BorderSide(width: 1, color: Colors.black12),
                      borderRadius:
                          BorderRadius.circular(ScreenUtil().radius(20)),
                    ),
                    hintText: 'Product  Name ',
                    hintStyle: GoogleFonts.poppins(
                        textStyle: TextStyle(
                            color: Colors.black38,
                            fontWeight: FontWeight.w500,
                            fontSize: ScreenUtil().setSp(14))),
                    filled: true,
                    fillColor: Colors.transparent,
                    contentPadding: EdgeInsets.only(
                        left: ScreenUtil().setHeight(15),
                        bottom: ScreenUtil().setHeight(15),
                        top: ScreenUtil().setHeight(15)),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Colors.black12,
                      ),
                      borderRadius:
                          BorderRadius.circular(ScreenUtil().radius(20)),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Colors.black12,
                      ),
                      borderRadius:
                          BorderRadius.circular(ScreenUtil().radius(20)),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        width: 1,
                        color: Colors.black12,
                      ),
                      borderRadius:
                          BorderRadius.circular(ScreenUtil().radius(20)),
                    ),
                  ),
                  controller: name,
                ),
              ),
              Padding(
                padding: EdgeInsets.all(ScreenUtil().setHeight(8)),
                child: InkWell(
                  onTap: () => _selectDate(context),
                  child: IgnorePointer(
                    child: TextFormField(
                      style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                              fontSize: ScreenUtil().setSp(14))),
                      decoration: InputDecoration(
                        suffixIcon: IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.calendar_today,
                              color: Color(0xffF79E1B)),
                        ),
                        border: OutlineInputBorder(
                          borderSide: const BorderSide(
                              width: 1, color: Color(0xff000000)),
                          borderRadius:
                              BorderRadius.circular(ScreenUtil().radius(20)),
                        ),
                        hintText: (myFormat.format(date)),
                        hintStyle: GoogleFonts.poppins(
                            textStyle: TextStyle(
                                color: Colors.black38,
                                fontWeight: FontWeight.w500,
                                fontSize: ScreenUtil().setSp(14))),
                        filled: true,
                        fillColor: Colors.transparent,
                        contentPadding: EdgeInsets.only(
                            left: ScreenUtil().setHeight(15),
                            bottom: ScreenUtil().setHeight(15),
                            top: ScreenUtil().setHeight(15)),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Colors.black12,
                          ),
                          borderRadius:
                              BorderRadius.circular(ScreenUtil().radius(20)),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Colors.black12,
                          ),
                          borderRadius:
                              BorderRadius.circular(ScreenUtil().radius(20)),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            width: 1,
                            color: Colors.black12,
                          ),
                          borderRadius:
                              BorderRadius.circular(ScreenUtil().radius(20)),
                        ),
                      ),
                      controller: _datecontroller,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(ScreenUtil().setHeight(8)),
                child: TextFormField(
                  onSaved: (value) {
                    launchsite.text = value!;
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Launch site is empty';
                    }
                    return null;
                  },
                  style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                          fontSize: ScreenUtil().setSp(14))),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderSide:
                          const BorderSide(width: 1, color: Color(0xff000000)),
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    hintText: 'Launch Site',
                    hintStyle: TextStyle(
                        color: Colors.black38,
                        fontWeight: FontWeight.w500,
                        fontSize: ScreenUtil().setSp(14)),
                    filled: true,
                    fillColor: Colors.transparent,
                    contentPadding: EdgeInsets.only(
                        left: ScreenUtil().setHeight(15),
                        bottom: ScreenUtil().setHeight(15),
                        top: ScreenUtil().setHeight(15)),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Colors.black12,
                      ),
                      borderRadius:
                          BorderRadius.circular(ScreenUtil().radius(20)),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Colors.black12,
                      ),
                      borderRadius:
                          BorderRadius.circular(ScreenUtil().radius(20)),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        width: 1,
                        color: Colors.black12,
                      ),
                      borderRadius:
                          BorderRadius.circular(ScreenUtil().radius(20)),
                    ),
                  ),
                  controller: launchsite,
                ),
              ),
              Padding(
                padding: EdgeInsets.all(ScreenUtil().setHeight(8)),
                child: TextFormField(
                  onSaved: (value) {
                    popularity.text = value!;
                  },
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[
                    LengthLimitingTextInputFormatter(1),
                    FilteringTextInputFormatter.allow(RegExp(r'[0-5]')),
                  ], // Only numbers can be entered
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Popularity is empty';
                    }
                    return null;
                  },
                  style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                          fontSize: ScreenUtil().setSp(14))),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderSide:
                          const BorderSide(width: 1, color: Color(0xff000000)),
                      borderRadius:
                          BorderRadius.circular(ScreenUtil().radius(20)),
                    ),
                    hintText: 'Popularity (1-5)',
                    hintStyle: GoogleFonts.poppins(
                        textStyle: TextStyle(
                            color: Colors.black38,
                            fontWeight: FontWeight.w500,
                            fontSize: ScreenUtil().setSp(14))),
                    filled: true,
                    fillColor: Colors.transparent,
                    contentPadding: EdgeInsets.only(
                        left: ScreenUtil().setHeight(15),
                        bottom: ScreenUtil().setHeight(15),
                        top: ScreenUtil().setHeight(15)),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Colors.black12,
                      ),
                      borderRadius:
                          BorderRadius.circular(ScreenUtil().radius(20)),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Colors.black12,
                      ),
                      borderRadius:
                          BorderRadius.circular(ScreenUtil().radius(20)),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        width: 1,
                        color: Colors.black12,
                      ),
                      borderRadius:
                          BorderRadius.circular(ScreenUtil().radius(20)),
                    ),
                  ),
                  controller: popularity,
                ),
              ),
              Padding(
                padding: EdgeInsets.all(ScreenUtil().setHeight(8)),
                child: Container(
                  width: ScreenUtil().screenWidth,
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      stops: [0.0, 1.0],
                      colors: [Color(0xff1168A2), Color(0xff179DEB)],
                    ),
                    color: Colors.deepPurple.shade300,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  height: ScreenUtil().setHeight(30),
                  child: ElevatedButton(
                      style: ButtonStyle(
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                        ),
                        backgroundColor:
                            MaterialStateProperty.all(Colors.transparent),
                        shadowColor:
                            MaterialStateProperty.all(Colors.transparent),
                      ),
                      onPressed: () {
                        _formKey.currentState!.validate();
                        if (_formKey.currentState!.validate() &&
                            product.every(
                                (element) => element["name"] != name.text)) {
                          _formKey.currentState!.save();
                          product.add({
                            "name": name.text,
                            "launchedat": "$date",
                            "launchSite": launchsite.text,
                            "popularity": popularity.text
                          });
                          debugPrint("added");
                          debugPrint("$product");
                          Get.showSnackbar(
                            GetBar(
                              backgroundColor: Colors.green,
                              duration: const Duration(seconds: 1),
                              message: 'Product Added Successfully',
                              isDismissible: true,
                            ),
                          )!
                              .then((value) {
                            name.clear();
                            launchsite.clear();
                            popularity.clear();
                            Get.off(MyHomePage());
                          });
                        } else if (_formKey.currentState!.validate()) {
                          debugPrint("$product");
                          debugPrint("notadded");
                          Get.showSnackbar(
                            GetBar(
                              backgroundColor: Colors.red,
                              duration: const Duration(seconds: 1),
                              message: 'Product already Added',
                              isDismissible: true,
                            ),
                          );
                        }
                      },
                      child: Text(
                        "Add Product",
                        style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                                fontSize: ScreenUtil().setSp(15))),
                      )),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
