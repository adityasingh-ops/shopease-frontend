import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class StoreController extends GetxController {
  RxString _store = ''.obs;
  RxString _title = ''.obs;
  RxString _image = ''.obs;
  RxString _time = ''.obs;
  RxString _rating = ''.obs;


  String get storetitle => _title.value;
  String get storeimage => _image.value;
  String get storevalue => _store.value;
  String get storetime => _time.value;
  String get storerating => _rating.value;
  set updateStore(String value) {
    _store.value = value;
  }

  set updateTitle(String value) {
    _title.value = value;
  }

  set updateImage(String value) {
    _image.value = value;
  }

  set updateTime(String value) {
    _time.value = value;
  }
  set updateRating(String value) {
    _rating.value = value;
  }
}