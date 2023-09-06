import 'package:dating_app/app/modules/signup/controllers/signup_controller.dart';
import 'package:dating_app/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignupView extends StatelessWidget {
  final SignupController _signupController = Get.put(SignupController());
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign Up'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              controller: _emailController, // Use the controller
              decoration: InputDecoration(labelText: 'Email'),
              onChanged: (value) {
                _signupController.errorMessage.value = '';
              },
            ),
            TextFormField(
              controller: _passwordController, // Use the controller
              decoration: InputDecoration(labelText: 'Password'),
              obscureText: true,
              onChanged: (value) {
                _signupController.errorMessage.value = '';
              },
            ),
            SizedBox(height: 16.0),
            Obx(
              () => _signupController.isLoading.value
                  ? CircularProgressIndicator()
                  : ElevatedButton(
                      onPressed: () {
                        _signupController.signup(
                          _emailController.text, // Get email from controller
                          _passwordController
                              .text, // Get password from controller
                        );
                      },
                      child: Text('Sign Up'),
                    ),
            ),
            Obx(
              () => _signupController.errorMessage.value.isNotEmpty
                  ? Text(
                      _signupController.errorMessage.value,
                      style: TextStyle(color: Colors.red),
                    )
                  : SizedBox(),
            ),
            SizedBox(height: 16.0),
            GestureDetector(
              onTap: () {
                Get.toNamed(AppPages.SIGNIN);
              },
              child: Text(
                'Already have an account? Sign In',
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
