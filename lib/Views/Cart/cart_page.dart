import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:shopease/Controllers/item_controller.dart';
import 'package:shopease/Views/Common/custom_container.dart';
import 'package:shopease/constants/constants.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    final itemController = Get.put(ItemController());
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
      ),
      body: Obx(
        () => ListView.builder(
          itemCount: itemController.cartItems.length,
          itemBuilder: (context, index) {
            final item = itemController.cartItems[index];
            return ListTile(
              title: Text(item['title']),
              subtitle: Text('Price: ${item['price']} x ${item['quantity']}'),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: Icon(Icons.remove),
                    onPressed: () => itemController.removeFromCart(item),
                  ),
                  Text('${item['quantity']}'),
                  IconButton(
                    icon: Icon(Icons.add),
                    onPressed: () => itemController.addToCart(item),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}