import 'package:get/get.dart';

class ItemController extends GetxController {
  RxString _item = ''.obs;
  RxString _title = ''.obs;
  RxString _image = ''.obs;
  RxString _price = ''.obs;
  RxString _rating = ''.obs;
  RxString _description = ''.obs;
  RxInt _quantity = 0.obs;
  RxInt _label = 0.obs;


  String get itemtitle => _title.value;
  String get itemimage => _image.value;
  String get itemvalue => _item.value;
  String get itemprice => _price.value;
  String get itemrating => _rating.value;
  String get itemdescription => _description.value;
  int get itemquantity => _quantity.value;
  int get itemlabel => _label.value;


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
  
  set updateQuantity(int value) {
    _quantity.value = value;}
   
   RxInt count = 1.obs;

   void increment() {
     count.value++;
   }

   void decrement() {
     if (count.value > 1) {
      count.value--;
     }
   }
 

 

  
}