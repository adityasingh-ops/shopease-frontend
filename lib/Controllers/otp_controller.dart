import 'dart:convert';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:shopease/Views/entrypoint.dart';
import 'package:shopease/constants/constants.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shopease/models/loginresponse.dart';

class OtpController extends GetxController {
  final box = GetStorage();
  void verifyOTP(String data) async {
  
   Uri url = Uri.parse('$appBaseUrl/api/users/verifyotp');
   Map<String, String> headers = {
     "Content-type": "application/json",
   };
    try {
      var response = await http.post(url, headers: headers, body: data);
      if (response.statusCode == 200) {
        Get.snackbar("OTP Verified", "You have successfully verified your OTP");
        Get.to(()=> MainScreen());
        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setBool('isRegistered', true);

        LoginresponseModel data = loginresponseModelFromJson(response.body);

      String userId = data.id;
      String userdata = jsonEncode(data.toJson());

      box.write(userId, userdata);
      box.write('token', data.accessToken);
      box.write('username', data.username);
      box.write('number',data.number);
      box.write('userId', data.id);
     

      }else if(response.statusCode == 400){
      Get.snackbar("invalid", "please reenter");
      }
    } catch (e) {
      print(e);
    }
  }
  LoginresponseModel? getuserinfo(){
    String? userId = box.read("userId");

    if(userId!=null){
      String ?data = box.read(userId.toString());
      if(data!=null){
      return loginresponseModelFromJson(data);
    }
    }
    
    return null;
  }
}