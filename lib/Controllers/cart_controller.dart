import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:get/instance_manager.dart';
import 'package:get_storage/get_storage.dart';
import 'package:shopease/Views/Cart/cart_page.dart';
import 'package:shopease/Views/Common/appstyle.dart';
import 'package:shopease/constants/constants.dart';
import 'package:http/http.dart' as http;

class CartController extends GetxController {
  final box = GetStorage();
  RxBool _isloading = false.obs;

  bool get isLoading => _isloading.value;

  set updateLoading(bool value) {
    _isloading.value = value;
  }

  void addToCart(String cart) async {
    updateLoading = true;
    String token = box.read('token');
    print(token);
    Uri url = Uri.parse('$appBaseUrl/api/cart');
    Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token'
    };
    try {
      var response = await http.post(url, headers: headers, body: cart);
      print(response.statusCode);
      if (response.statusCode == 201) {
        updateLoading = false;

        Get.snackbar(
          "Item Added To Cart",
          "2 apple added",
          backgroundColor: kPrimary,
          colorText: kOffWhite,
          snackPosition: SnackPosition.BOTTOM,
          duration: const Duration(seconds: 2),
          icon: Icon(Icons.shopping_cart, color: kOffWhite, size: 30.h),
          mainButton: TextButton(
            onPressed: () {
              Get.to(() => const CartPage());
            },
            child: Text(
              "View Cart",
              style: appStyle(15.h, kOffWhite, FontWeight.w700),
            ),
          ),
        );
      }
      if (response.statusCode == 500) {
        print(response.body);
      }
    } catch (e) {
      debugPrintStack(label: e.toString());
      Get.snackbar('Error', 'An error occurred while adding item to cart');
    } finally {
      updateLoading = false;
    }
  }
  void addToCartMore(String cart, refetch) async {
    updateLoading = true;
    String token = box.read('token');
    print(token);
    Uri url = Uri.parse('$appBaseUrl/api/cart');
    Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token'
    };
    try {
      var response = await http.post(url, headers: headers, body: cart);
      print(response.statusCode);
      if (response.statusCode == 201) {
        updateLoading = false;
        refetch();
        Get.snackbar(
          "Item Added To Cart",
          "2 apple added",
          backgroundColor: kPrimary,
          colorText: kOffWhite,
          snackPosition: SnackPosition.BOTTOM,
          duration: const Duration(seconds: 2),
          icon: Icon(Icons.shopping_cart, color: kOffWhite, size: 30.h),
          mainButton: TextButton(
            onPressed: () {
              Get.to(() => const CartPage());
            },
            child: Text(
              "View Cart",
              style: appStyle(15.h, kOffWhite, FontWeight.w700),
            ),
          ),
        );
      }
      if (response.statusCode == 500) {
        print(response.body);
      }
    } catch (e) {
      debugPrintStack(label: e.toString());
      Get.snackbar('Error', 'An error occurred while adding item to cart');
    } finally {
      updateLoading = false;
    }
  }

  void removeProduct(String ProductId, Function() refetch) async {
    updateLoading = true;
    String token = box.read('token');
    print(token);
    var url = Uri.parse('$appBaseUrl/api/cart/$ProductId');
    Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Authorization': 'token $token'
    };
    try {
      var response = await http.delete(url, headers: headers);
      print(response.statusCode);
      if (response.statusCode == 200) {
        updateLoading = false;
        refetch();
        Get.snackbar('Success', 'Item added to cart');
      }
      if (response.statusCode == 500) {
        print(response.body);
      }
    } catch (e) {
      debugPrintStack(label: e.toString());
    } finally {
      updateLoading = false;
    }
  }
  void decreament(String cart,Function () refetch) async {
    print(cart);
    updateLoading = true;
    String token = box.read('token');
    print(token);
    Uri url = Uri.parse('$appBaseUrl/api/cart/decreament');
    Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token'
    };
    try {
      var response = await http.post(url, headers: headers, body: cart);
      print(response.statusCode);
      if (response.statusCode == 200) {
        updateLoading = false;
        refetch();
        Get.snackbar(
          "Item Added To Cart",
          "2 apple added",
          backgroundColor: kPrimary,
          colorText: kOffWhite,
          snackPosition: SnackPosition.BOTTOM,
          duration: const Duration(seconds: 2),
          icon: Icon(Icons.shopping_cart, color: kOffWhite, size: 30.h),
          mainButton: TextButton(
            onPressed: () {
              Get.to(() => const CartPage());
            },
            child: Text(
              "View Cart",
              style: appStyle(15.h, kOffWhite, FontWeight.w700),
            ),
          ),
        );
      }
      if (response.statusCode == 500) {
        print(response.body);
      }
    } catch (e) {
      debugPrintStack(label: e.toString());
      Get.snackbar('Error', 'An error occurred while adding item to cart');
    } finally {
      updateLoading = false;
    }
  }
  void increament(String cart) async {
    print(cart);
    updateLoading = true;
    String token = box.read('token');
    print(token);
    Uri url = Uri.parse('$appBaseUrl/api/cart/increament');
    Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token'
    };
    try {
      var response = await http.post(url, headers: headers, body: cart);
      print(response.statusCode);
      if (response.statusCode == 201) {
        updateLoading = false;

        Get.snackbar(
          "Item Added To Cart",
          "2 apple added",
          backgroundColor: kPrimary,
          colorText: kOffWhite,
          snackPosition: SnackPosition.BOTTOM,
          duration: const Duration(seconds: 2),
          icon: Icon(Icons.shopping_cart, color: kOffWhite, size: 30.h),
          mainButton: TextButton(
            onPressed: () {
              Get.to(() => const CartPage());
            },
            child: Text(
              "View Cart",
              style: appStyle(15.h, kOffWhite, FontWeight.w700),
            ),
          ),
        );
      }
      if (response.statusCode == 404) {
        print(response.body);
      }
    } catch (e) {
      debugPrintStack(label: e.toString());
      Get.snackbar('Error', 'An error occurred while adding item to cart');
    } finally {
      updateLoading = false;
    }
  }
  void placeOreder(String cart) async {
    updateLoading = true;
    String token = box.read('token');
    print(token);
    Uri url = Uri.parse('$appBaseUrl/api/cart');
    Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token'
    };
    try {
      var response = await http.post(url, headers: headers, body: cart);
      print(response.statusCode);
      if (response.statusCode == 200) {
        updateLoading = false;

        Get.snackbar(
          "Order Placed",
          "Your order has been placed successfully",
          backgroundColor: kPrimary,
          colorText: kOffWhite,
          snackPosition: SnackPosition.BOTTOM,
          duration: const Duration(seconds: 2),
          icon: Icon(Icons.shopping_cart, color: kOffWhite, size: 30.h),
          mainButton: TextButton(
            onPressed: () {
              Get.to(() => const CartPage());
            },
            child: Text(
              "View Cart",
              style: appStyle(15.h, kOffWhite, FontWeight.w700),
            ),
          ),
        );
      }
      if (response.statusCode == 500) {
        print(response.body);
      }
    } catch (e) {
      debugPrintStack(label: e.toString());
      Get.snackbar('Error', 'An error occurred while adding item to cart');
    } finally {
      updateLoading = false;
    }
  }
}
