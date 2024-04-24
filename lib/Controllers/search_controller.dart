// ignore_for_file: prefer_final_fields

import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:shopease/constants/constants.dart';
import 'package:shopease/models/api_error.dart';
import 'package:shopease/models/item_model.dart';
import 'package:http/http.dart' as http;

class SearchItemController extends GetxController{
  RxBool _isLoading = false.obs;
  bool get isLoading => _isLoading.value;

  set setLoading(bool value) => _isLoading.value = value;

    RxBool _isTriggered = false.obs;
  bool get isTriggered => _isTriggered.value;

  set setTriggered(bool value) => _isTriggered.value = value;

  List<ItemModel>? searchResults;

  void setSearchResults(String key) async{
    setLoading = true;

    Uri url = Uri.parse('$appBaseUrl/api/item/search/$key');

    try{
      var response = await http.get(url);
      if(response.statusCode == 200){
        searchResults = itemModelFromJson(response.body);
        setLoading = false;
      }else{
        setLoading = false;
        var error = apiErrorFromJson(response.body);
      }
    }catch(e){
      setLoading = false;
      debugPrint(e.toString());
  }
}
}