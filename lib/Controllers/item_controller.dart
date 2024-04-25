import 'package:get/get.dart';

class ItemController extends GetxController {
  RxString _item = ''.obs;
  RxString _title = ''.obs;
  RxString _image = ''.obs;
  RxString _price = ''.obs;
  RxString _rating = ''.obs;
  RxString _description = ''.obs;
  RxInt _quantity = 0.obs;

  RxList<Map<String, dynamic>> _cartItems = RxList<Map<String, dynamic>>([]);
  RxInt _totalItems = 0.obs;

  String get itemtitle => _title.value;
  String get itemimage => _image.value;
  String get itemvalue => _item.value;
  String get itemprice => _price.value;
  String get itemrating => _rating.value;
  String get itemdescription => _description.value;
  int get itemquantity => _quantity.value;
  List<Map<String, dynamic>> get cartItems => _cartItems;
  int get totalItems => _totalItems.value;

  set updateItem(String value) {
    _item.value = value;
  }

  set updateTitle(String value) {
    _title.value = value;
  }

  set updateImage(String value) {
    _image.value = value;
  }

  set updatePrice(String value) {
    _price.value = value;
  }

  set updateRating(String value) {
    _rating.value = value;
  }

  set updateDescription(String value) {
    _description.value = value;
  }

  get quantity => _quantity.value;

  int checkQuantity(int quantity) {
    if (quantity < 0) {
      return 0;
    }
    if (quantity > 20) {
      return 20;
    } else {
      return quantity;
    }
  }

  int increment() {
    _quantity.value = checkQuantity(_quantity.value + 1);
    return _quantity.value;
  }

  int decrement() {
    _quantity.value = checkQuantity(_quantity.value - 1);
    return _quantity.value;
  }

  void addToCart(Map<String, dynamic> item) {
    int index = _cartItems.indexWhere((cartItem) => cartItem['id'] == item['id']);

    if (index != -1) {
      // Item already in cart, update quantity
      _cartItems[index]['quantity'] += 1;
    } else {
      // Add new item to cart
      item['quantity'] = 1;
      _cartItems.add(item);
    }

    _updateTotalItems();
  }

  void removeFromCart(Map<String, dynamic> item) {
    int index = _cartItems.indexWhere((cartItem) => cartItem['id'] == item['id']);

    if (index != -1) {
      if (_cartItems[index]['quantity'] > 1) {
        // Decrement quantity
        _cartItems[index]['quantity'] -= 1;
      } else {
        // Remove item from cart
        _cartItems.removeAt(index);
      }

      _updateTotalItems();
    }
  }

  void clearCart() {
    _cartItems.clear();
    _totalItems.value = 0;
  }

  void _updateTotalItems() {
    int totalQuantity = 0;
    for (var cartItem in _cartItems) {
      totalQuantity += cartItem['quantity'] as int;
    }
    _totalItems.value = totalQuantity;
  }
}