import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class SignupController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  RxBool isLoading = false.obs;
  RxString errorMessage = ''.obs;

  Future<void> signup(String email, String password) async {
    try {
      isLoading.value = true;
      await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      isLoading.value = false;
      errorMessage.value = '';
    } catch (e) {
      isLoading.value = false;
      errorMessage.value = e.toString();
    }
  }
}
