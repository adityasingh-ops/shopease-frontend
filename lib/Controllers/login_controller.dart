import 'dart:convert';

import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:get_storage/get_storage.dart';
import 'package:shopease/constants/constants.dart';
import 'package:http/http.dart' as http;
import 'package:shopease/models/login.dart';
import 'package:shopease/models/loginresponse.dart';

class LoginController extends GetxController{
  final box = GetStorage();
  RxBool _isLoading = false.obs;

  bool get isLoading => _isLoading.value;

  set setLoading(bool value) => _isLoading.value = value;

  loginfuction(String data) async {
   setLoading = true;

   Uri url = Uri.parse('$appBaseUrl/api/users/sendotp');
    Map<String, String> headers = {
      "Content-type": "application/json",
    };

   try{
    print(url);
    var response = await http.post(url, headers: headers, body: data);
    if(response.statusCode == 200){
      LoginresponseModel data = loginresponseModelFromJson(response.body);

      String userId = data.id;
      String userdata = jsonEncode(data.toJson());

      box.write(userId, userdata);
      box.write('token', data.accessToken);
      box.write('username', data.username);
      box.write('number',data.number);
      box.write('userId', data.id);

      setLoading = false;

      Get.snackbar("succesfully logged in", "enjoy your journey of this app");


      }
   }catch(e){
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