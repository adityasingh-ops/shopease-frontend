import 'package:shopease/constants/constants.dart';
import 'package:shopease/models/api_error.dart';
import 'package:shopease/models/hook_models/hook_result.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:http/http.dart' as http;
import 'package:shopease/models/stores_model.dart';

FetchHook useFetchStore(String type,String code) {
  final store = useState<List<StoreModel>?>(null);
  final isLoading = useState<bool>(false);
  final error = useState<Exception?>(null);
  final apiError = useState<ApiError?>(null);

  Future<void> fetchData() async{
    isLoading.value = true;
    try {
      Uri url = Uri.parse('$appBaseUrl/api/store/$type/$code');
      final response = await http.get(url);
      if (response.statusCode == 200) {
        store.value = storeModelFromJson(response.body);
      } else {
        apiError.value = apiErrorFromJson(response.body);
      }
    } catch (e) {
      error.value = e as Exception;
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
      data: store.value,
      isLoading: isLoading.value,
      error: error.value,
      refetch: refetch);
}
