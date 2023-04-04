import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class SignUpController extends GetxController {
  static SignUpController get instance => Get.find();

  //Textfield Controllers to get the values from the textfields
  final email = TextEditingController();
  final password = TextEditingController();
  final username = TextEditingController();
  final phone = TextEditingController();
  final location = TextEditingController();

  //Function to register the user
void registerUser(String email, String password, String username, String phone, String location) {
    // Get the values from the textfields
    final email = this.email.text;
    final password = this.password.text;
    final username = this.username.text;
    final phone = this.phone.text;
    final location = this.location.text;

    // Do the rest of the work
  }
}