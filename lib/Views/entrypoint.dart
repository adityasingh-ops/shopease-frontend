import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';
import 'package:shopease/Controllers/item_controller.dart';
import 'package:shopease/Controllers/tab_index_controller.dart';
import 'package:shopease/Views/Cart/cart_page.dart';
import 'package:shopease/Views/Home/home_page.dart';
import 'package:shopease/Views/Profile/profile_page.dart';
import 'package:shopease/Views/Search/search_page.dart';
import 'package:shopease/constants/constants.dart';

// ignore: must_be_immutable
class MainScreen extends StatelessWidget {
  MainScreen({super.key});

  List<Widget> pagelist = const [
    HomePage(),
    SearchPage(),
    CartPage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(TabIndexController());
    final itemcontroller = Get.put(ItemController());
    
    return Obx(() => Scaffold(
      body: Stack(
        children: [
          pagelist[controller.tabindex],
          Align(
            alignment: Alignment.bottomCenter,
            child:Theme(data: Theme.of(context).copyWith(canvasColor: kPrimary),
             
             child: BottomNavigationBar(
              showSelectedLabels: false,
              elevation: 0,
              showUnselectedLabels: false,
              unselectedIconTheme: const IconThemeData(color: Colors.black38),
              selectedIconTheme: const IconThemeData(color: kSecondary),
              onTap: (Value){
                controller.setTabIndex = Value;
              },
              currentIndex: controller.tabindex,
                items: [
                  BottomNavigationBarItem(
                    icon: controller.tabindex == 0 ? const Icon(AntDesign.appstore1): const Icon(AntDesign.appstore_o),
                    label: 'Home',
                  ),
                  BottomNavigationBarItem(
                    icon: const Icon(Icons.search),
                    label: 'Search',
                  ),
                  BottomNavigationBarItem(
                    
                    icon: Badge(
                      label: Text('${itemcontroller.count}'),
                      child: const Icon(FontAwesome.opencart),
                    ),
                    label: 'Cart',
                  ),
                  BottomNavigationBarItem(
                    icon: controller.tabindex == 3 ? const Icon(FontAwesome.user_circle): const Icon(FontAwesome.user_circle_o),
                    label: 'Person',
                  ),
                ],
             ),
             ),
          )
        ],
      )
    ),
 ); }
}