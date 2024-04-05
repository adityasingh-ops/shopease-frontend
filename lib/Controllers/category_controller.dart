import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class CategoryController extends GetxController{
  RxString _category = ''.obs;

  String get categoryvalue=> _category.value;

  set updateCategory(String value){
    _category.value = value;
  }
  RxString _title = ''.obs;

  String get titlevalue=> _title.value;

  set updateTitle(String value){
    _title.value = value;
  }
}