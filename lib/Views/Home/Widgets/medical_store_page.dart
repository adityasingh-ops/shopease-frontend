import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shopease/Views/Common/appstyle.dart';
import 'package:shopease/Views/Common/back_ground_container.dart';
import 'package:shopease/Views/Common/reusable_text.dart';
import 'package:shopease/constants/constants.dart';
import 'package:http/http.dart' as http;

class OrderPage extends StatefulWidget {
  @override
  _OrderPageState createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  File? _image;
  Future<void> _pickImage() async {
    final pickedFile = await ImagePicker().pickImage(
      source: ImageSource.camera,
      maxWidth: 800,
      maxHeight: 600,
      imageQuality: 80,
    );

    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  Future<void> _pickImagefromgallery() async {
    final pickedFile = await ImagePicker().pickImage(
      source: ImageSource.gallery,
      maxWidth: 800,
      maxHeight: 600,
    );

    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  void _selectTimeToDeliver() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: ReusableText(
            text: "Select Time to Deliver",
            style: appStyle(13, kDark, FontWeight.w600),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ElevatedButton(
                onPressed: () {
                  _submitOrder();
                  Navigator.pop(context);
                },
                child: ReusableText(
                  text: "Deliver Now",
                  style: appStyle(13, kPrimary, FontWeight.w600),
                ),
              ),
              SizedBox(height: 10.h),
              ElevatedButton(
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return Container(
                          height: 200.h,
                          width: 200.w,
                          decoration: BoxDecoration(
                            color: kLightWhite,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20.r),
                              topRight: Radius.circular(20.r),
                            ),
                          ),
                          child: Column(
                            children: [
                              ReusableText(
                                text: "Select Time",
                                style: appStyle(13, kDark, FontWeight.w600),
                              ),
                              SizedBox(height: 10.h),
                              ElevatedButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: ReusableText(
                                  text: "Submit",
                                  style:
                                      appStyle(13, kPrimary, FontWeight.w600),
                                ),
                              ),
                            ],
                          ),
                        );
                      });
                  _submitOrder();
                },
                child: ReusableText(
                  text: "Schedule",
                  style: appStyle(13, kPrimary, FontWeight.w600),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  void _submitOrder() async {
    String base64image = base64Encode(_image!.readAsBytesSync());
    String filename = _image!.path.split('/').last;
    Uri url = Uri.parse('$appBaseUrl/api/item/photo');
    final response = await http.post(
      url,
      body: {
        "image": base64image,
        "filename": filename,
      },
    );
    if (response.statusCode == 201) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Order placed successfully!'),
          duration: Duration(seconds: 2),
          backgroundColor: kPrimary,
          behavior: SnackBarBehavior.floating,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        ),
      );
      setState(() {
        _image = null;
      });
    } else {
      print("Error submitting order");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          elevation: 0,
          backgroundColor: kOffWhite,
          title: ReusableText(
            text: "Nearby Stores",
            style: appStyle(13, kGray, FontWeight.w600),
          )),
      body: BackGroundContainer(
        color: Colors.white,
        child: Center(
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(top: 100.h),
                height: 75.h,
                width: 75.w,
                decoration: BoxDecoration(
                  color: kLightWhite,
                  borderRadius: BorderRadius.circular(9.r),
                ),
                child: const Icon(
                  Icons.camera_alt,
                  color: kPrimary,
                  size: 50,
                ),
              ),
              SizedBox(height: 10.h),
              ReusableText(
                text: "Add a photo of your prescription",
                style: appStyle(13, kDark, FontWeight.w600),
              ),
              SizedBox(height: 20.h),
              ElevatedButton(
                onPressed: _pickImage,
                child: ReusableText(
                  text: "Take a photo",
                  style: appStyle(13, kPrimary, FontWeight.w600),
                ),
              ),
              SizedBox(height: 10.h),
              ElevatedButton(
                onPressed: _pickImagefromgallery,
                child: ReusableText(
                  text: "Browse a photo",
                  style: appStyle(13, kPrimary, FontWeight.w600),
                ),
              ),
              SizedBox(height: 10.h),
              if (_image != null)
                Column(
                  children: [
                    Image.file(
                      _image!,
                      height: 200.h,
                      width: 200.w,
                      fit: BoxFit.cover,
                    ),
                    SizedBox(height: 10.h),
                    ElevatedButton(
                      onPressed: () {
                        _selectTimeToDeliver();
                      },
                      child: ReusableText(
                        text: "Submit Order",
                        style: appStyle(13, kPrimary, FontWeight.w600),
                      ),
                    ),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }
}
