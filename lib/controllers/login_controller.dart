import 'package:academia/constants/common.dart';
import 'package:academia/constants/settings.dart';
import 'package:academia/notifications/notification_service.dart';
import 'package:academia/pages/home_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:academia/controllers/controllers.dart';

class LoginController extends GetxController {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final UserController userController = Get.find<UserController>();
  var acceptTerms = false.obs;
  var showPassword = true.obs;
  var isloading = false.obs;

  Future<void> login() async {
    isloading.value = true;
    if (usernameController.text.isEmpty || passwordController.text.isEmpty) {
      Get.snackbar(
        "Form Error",
        "Please ensure you fill in the form to continue",
        backgroundColor: Colors.white,
        icon: const Icon(
          CupertinoIcons.xmark_circle,
          color: Colors.red,
        ),
      );
      isloading.value = false;
      return;
    }

    // validate accepts T&C
    if (!acceptTerms.value) {
      Get.snackbar(
        "Terms and Conditions",
        "You must consent to the terms and conditions provided by Academia's License to continue",
        backgroundColor: Colors.white,
        icon: const Icon(
          CupertinoIcons.xmark_circle,
          color: Colors.red,
        ),
      );
      isloading.value = false;
      return;
    }

    // auth the user
    bool authenticated = false;
    try {
      authenticated = await userController.login(
          usernameController.text.trim(), passwordController.text.trim());
    } catch (e) {
      Get.snackbar(
        "Error",
        e.toString(),
        backgroundColor: Colors.white,
        icon: const Icon(
          CupertinoIcons.xmark_circle,
          color: Colors.red,
        ),
      );
      isloading.value = false;
      return;
    }
    if (authenticated) {
      await userController.getUserDetails(
          usernameController.text.trim(), passwordController.text.trim());

      isloading.value = false;
      debugPrint("User details: ${appDB.get('user')}");

      // append the default settings if not exists
      if (!appDB.containsKey("settings")) {
        await appDB.put("settings", settings);
      }

      // Say hello to the user
      NotificationService().showNotification(
        title: "Hello,👋👋",
        body: "With academia, your fun has just began!",
        id: notifications["greetings"]!,
      );
      // Navigate to home page
      Get.off(
        const HomePage(),
        duration: const Duration(seconds: 2),
        transition: Transition.cupertino,
      );
      return;
    } else {
      Get.snackbar(
        "Form Validation Error",
        "Login failure, Please check your admno and password",
        backgroundColor: Colors.white,
        icon: const Icon(
          CupertinoIcons.xmark_circle,
          color: Colors.red,
        ),
      );
      isloading.value = false;
    }
  }
}
