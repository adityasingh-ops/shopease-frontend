import 'package:shopease/constants/constants.dart';
import 'package:shopease/models/api_error.dart';
import 'package:shopease/models/doctors.dart';
import 'package:shopease/models/hook_models/hook_result.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:http/http.dart' as http;

FetchHook useFetchAllDoctors() {
  final doctorslist = useState<List<DoctorModel>?>(null);
  final isLoading = useState<bool>(false);
  final error = useState<Exception?>(null);
  final apiError = useState<ApiError?>(null);

  Future<void> fetchData() async{
    isLoading.value = true;
    try {
      Uri url = Uri.parse('$appBaseUrl/api/doctors');
      final response = await http.get(url);
      if (response.statusCode == 200) {
        doctorslist.value = doctorModelFromJson(response.body);
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
  }, const []);
  
  void refetch() {
    isLoading.value = true;
    fetchData();
  }

  return FetchHook(
      data: doctorslist.value,
      isLoading: isLoading.value,
      error: error.value,
      refetch: refetch);
}
