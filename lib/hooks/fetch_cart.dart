import 'package:flutter/foundation.dart';
import 'package:get_storage/get_storage.dart';
import 'package:shopease/constants/constants.dart';
import 'package:shopease/models/api_error.dart';
import 'package:shopease/models/cart_response.dart';
import 'package:shopease/models/hook_models/hook_result.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:http/http.dart' as http;
import 'package:shopease/models/stores_model.dart';

FetchHook useFetchCart() {
  final box = GetStorage();
  final allitem = useState<List<CartResponse>?>(null);
  final isLoading = useState<bool>(false);
  final error = useState<Exception?>(null);
  final apiError = useState<ApiError?>(null);

  Future<void> fetchData() async{
     String? accessToken = box.read('token');
    print(accessToken);
    Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $accessToken'};
    isLoading.value = true;
    try {
      Uri url = Uri.parse('$appBaseUrl/api/cart');
      final response = await http.get(url, headers: headers);
      if (response.statusCode == 200) {
        allitem.value = cartResponseFromJson(response.body);
      } else {
        apiError.value = apiErrorFromJson(response.body);
      }
    } catch (e) {
      debugPrintStack(label: e.toString());
    } finally {
      isLoading.value = false;
    }
  }
  useEffect(() {
    fetchData();
    return null;
  }, []);
  
  void refetch() {
    isLoading.value = true;
    fetchData();
  }

  return FetchHook(
      data: allitem.value,
      isLoading: isLoading.value,
      error: error.value,
      refetch: refetch);
}
