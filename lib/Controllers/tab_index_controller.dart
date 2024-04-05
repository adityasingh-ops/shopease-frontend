import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class TabIndexController extends GetxController {
  RxInt _tabindex = 0.obs;
  int get tabindex => _tabindex.value;
  set setTabIndex(int newValue) => _tabindex.value = newValue;
}
