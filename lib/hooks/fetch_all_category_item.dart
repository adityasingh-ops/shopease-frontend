import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:shopease/Controllers/category_controller.dart';
import 'package:shopease/constants/constants.dart';
import 'package:shopease/models/api_error.dart';
import 'package:shopease/models/hook_models/hook_items.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:http/http.dart' as http;
import 'package:shopease/models/item_model.dart';

FetchItems useFetchAllCategoryItems(String code) {
  final controller = Get.put(CategoryController());
  final allitems = useState<List<ItemModel>?>(null);
  final isLoading = useState<bool>(false);
  final error = useState<Exception?>(null);
  final apiError = useState<ApiError?>(null);

  Future<void> fetchData() async{
    isLoading.value = true;
    try {
      Uri url = Uri.parse('$appBaseUrl/api/item/byCategory/${controller.categoryvalue}/$code');
      final response = await http.get(url);
      if (response.statusCode == 200) {
        allitems.value = itemModelFromJson(response.body);
      } else {
        apiError.value = apiErrorFromJson(response.body);
      }
    } catch (e) {
      debugPrint(e.toString());
    } finally {
      isLoading.value = false;
    }
  }
  useEffect(() {
    Future.delayed(const Duration(seconds: 3));
    fetchData();
    return null;
  }, []);
  
  void refetch() {
    isLoading.value = true;
    fetchData();
  }

  return FetchItems(
      data: allitems.value,
      isLoading: isLoading.value,
      error: error.value,
      refetch: refetch);
}
