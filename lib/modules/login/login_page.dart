import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
// import 'package:get/get.dart';
import 'package:shortvideo/modules/login/components/body.dart';

import 'login_controller.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var logic = Get.find<LoginController>();
    return Scaffold(
      appBar: AppBar(
        title: const Text("登陆"),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 10), //10.w
        child: Form(
          key: logic.formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 30),
              TextFormField(
                onSaved: (str) => logic.username.value = str ?? '',
                validator: (str) => logic.usernameValidator(str),
                decoration: const InputDecoration(
                    hintText: "账号", border: OutlineInputBorder()),
              ),
              const SizedBox(height: 20),
              TextFormField(
                onSaved: (v) => logic.password.value = v ?? '',
                validator: (str) => logic.passwordValidator(str),
                decoration: const InputDecoration(
                    hintText: "密码", border: OutlineInputBorder()),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () => logic.login(),
                child: const Text("登陆"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
