import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:shopease/Controllers/DoctorController.dart';
import 'package:shopease/constants/constants.dart';
import 'package:shopease/models/api_error.dart';
import 'package:shopease/models/doctors.dart';
import 'package:shopease/models/hook_models/hook_result.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:http/http.dart' as http;

FetchHook useFetchADoctors() {
  final controller = Get.put(DoctorController());
  final doctors = useState<List<DoctorModel>?>(null);
  final isLoading = useState<bool>(false);
  final error = useState<Exception?>(null);
  final apiError = useState<ApiError?>(null);

  Future<void> fetchData() async{
    isLoading.value = true;
    try {
      Uri url = Uri.parse('$appBaseUrl/api/doctors/id/${controller.doctorId}');
      print(url);
      final response = await http.get(url);
      print(response.statusCode);
      if (response.statusCode == 200) {
        doctors.value = doctorModelFromJson(response.body);
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
    fetchData();
    return null;
  }, const []);
  
  void refetch() {
    isLoading.value = true;
    fetchData();
  }

  return FetchHook(
      data: doctors.value,
      isLoading: isLoading.value,
      error: error.value,
      refetch: refetch);
}
