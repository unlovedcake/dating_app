import 'package:dating_app/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/signin_controller.dart';

class SigninView extends StatelessWidget {
  final SigninController _loginController = Get.put(SigninController());
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Log In'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              controller: _emailController,
              decoration: const InputDecoration(labelText: 'Email'),
              onChanged: (value) {
                _loginController.errorMessage.value = '';
              },
            ),
            TextFormField(
              controller: _passwordController,
              decoration: const InputDecoration(labelText: 'Password'),
              obscureText: true,
              onChanged: (value) {
                _loginController.errorMessage.value = '';
              },
            ),
            const SizedBox(height: 16.0),
            Obx(
              () => _loginController.isLoading.value
                  ? const CircularProgressIndicator()
                  : ElevatedButton(
                      onPressed: () {
                        _loginController.login(
                          _emailController.text,
                          _passwordController.text,
                        );
                      },
                      child: const Text('Log In'),
                    ),
            ),
            Obx(
              () => _loginController.errorMessage.value.isNotEmpty
                  ? Text(
                      _loginController.errorMessage.value,
                      style: const TextStyle(color: Colors.red),
                    )
                  : const SizedBox(),
            ),
            const SizedBox(height: 16.0),
            GestureDetector(
              onTap: () {
                Get.toNamed(AppPages.SIGNUP);
              },
              child: const Text(
                "Don't have an account? Sign Up",
                style: TextStyle(
                  color: Colors.blue, // Make it look like a link
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
