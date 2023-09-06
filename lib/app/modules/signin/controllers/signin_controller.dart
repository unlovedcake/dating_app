import 'package:dating_app/app/routes/app_pages.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class SigninController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  RxBool isLoading = false.obs;
  RxString errorMessage = ''.obs;

  Future<void> login(String email, String password) async {
    try {
      isLoading.value = true;
      await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      isLoading.value = false;
      errorMessage.value = '';

      Get.toNamed(AppPages.INITIAL);
    } catch (e) {
      isLoading.value = false;
      errorMessage.value = e.toString();
    }
  }
}
