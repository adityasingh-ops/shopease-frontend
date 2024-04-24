import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';

class ItemController extends GetxController{
  RxString _item = ''.obs;
  RxString _title = ''.obs;
  RxString _image = ''.obs;
  RxString _price = ''.obs;
  RxString _rating = ''.obs;
  RxString _desciption = ''.obs;
  RxInt _quantity = 0.obs;


  String get itemtitle => _title.value;
  String get itemimage => _image.value;
  String get itemvalue => _item.value;
  String get itemprice => _price.value;
  String get itemrating => _rating.value;
  String get itemdescription => _desciption.value;
  int get itemquantity => _quantity.value;



  set updateItem(String value){
    _item.value = value;
  }

  set updateTitle(String value){
    _title.value = value;
  }

  set updateImage(String value){
    _image.value = value;
  }

  set updatePrice(String value){
    _price.value = value;
  }

  set updateRating(String value){
    _rating.value = value;
  }
  set updateDescription(String value){
    _desciption.value = value;
  }
    get quantity => _quantity.value;

  int checkQuantity(int quantity){
    if(quantity<0){
      return 0;
    }
    if(quantity>20){
      return 20;
    }else{
      return quantity;
    }
    
  }
  int increment(){

    _quantity.value = checkQuantity(_quantity.value+1);
    return _quantity.value;
  }
  int decrement(){
    _quantity.value = checkQuantity(_quantity.value-1);
    return _quantity.value;
  }



}