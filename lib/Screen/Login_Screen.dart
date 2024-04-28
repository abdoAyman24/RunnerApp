import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:runner/main.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  static const route = '/login';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Form(
        key: formKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                keyboardType: TextInputType.name,
                controller: nameController,
                decoration: const InputDecoration(
                  labelText: 'Runner',
                  hintText: 'Enter Your Name',
                  border: OutlineInputBorder(),
                ),
                validator: (data) {
                  if (data!.isEmpty) {
                    return 'This Field Is Require';
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 20.0,
              ),
              TextFormField(
                keyboardType: TextInputType.emailAddress,
                controller: emailController,
                decoration: const InputDecoration(
                  labelText: 'Email',
                  hintText: 'Enter Your Email',
                  border: OutlineInputBorder(),
                ),
                validator: (data) {
                  if (data!.isEmpty) {
                    return 'This Field Is Require';
                  }
                  final regexp = RegExp(r'[^@]+@[^\.]+\..+');
                  if (!regexp.hasMatch(data)) {
                    return 'Email Valid';
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 20.0,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.white,
                ),
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    // Navigator.pushReplacementNamed(context, StopWatch.route,
                    //  arguments: {'name': nameController.text});
                    Get.offAllNamed("/stop_watch");
                    sharedpref!.setString("id", "1");
                    sharedpref!.setString(
                      'name', nameController.text);
                    

                    
                  }
                },
                child: const Text('Continue'),
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    super.dispose();
  }
}
