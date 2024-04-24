import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class DoctorController extends GetxController{
  RxString _image = ''.obs;
  RxString _name = ''.obs;
  RxString _title = ''.obs;
  RxString _price = ''.obs;
  RxString _address = ''.obs;
  RxString _patients = ''.obs;
  RxString _experience = ''.obs;
  RxString _certificate = ''.obs;
  RxString _description = ''.obs;
  RxString _id = ''.obs;

  String get doctorImage => _image.value;
  String get doctorName => _name.value;
  String get doctorTitle => _title.value;
  String get doctorPrice => _price.value;
  String get doctorAddress => _address.value;
  String get doctorPatients => _patients.value;
  String get doctorExperience => _experience.value;
  String get doctorCertificate => _certificate.value;
  String get doctorDescription => _description.value;
  String get doctorId => _id.value;

  set updateDoctorImage(String value){
    _image.value = value;
  }
  
  set updateDoctorName(String value){
    _name.value = value;
  }

  set updateDoctorTitle(String value){
    _title.value = value;
  }

  set updateDoctorPrice(String value){
    _price.value = value;
  }

  set updateDoctorAddress(String value){
    _address.value = value;
  }

  set updateDoctorPatients(String value){
    _patients.value = value;
  }

  set updateDoctorExperience(String value){
    _experience.value = value;
  }

  set updateDoctorCertificate(String value){
    _certificate.value = value;
  }

  set updateDoctorDescription(String value){
    _description.value = value;
  }

  set updateDoctorId(String value){
    _id.value = value;
  }

}