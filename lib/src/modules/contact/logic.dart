import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ContactController extends GetxController {
  // Form key
  final formKey = GlobalKey<FormState>();

  // Text controllers
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final subjectController = TextEditingController();
  final messageController = TextEditingController();

  // Responsive flag
  bool get isMobile => Get.width < 700;

  // Submit form
  void submitForm() {
    if (formKey.currentState?.validate() ?? false) {
      // Form is valid
      Get.snackbar(
        "Success",
        "Message sent successfully!",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green.shade100,
        colorText: Colors.green.shade900,
      );

      // Reset form
      formKey.currentState?.reset();
      nameController.clear();
      emailController.clear();
      subjectController.clear();
      messageController.clear();
    }
  }

  @override
  void onClose() {
    // Dispose controllers
    nameController.dispose();
    emailController.dispose();
    subjectController.dispose();
    messageController.dispose();
    super.onClose();
  }
}
