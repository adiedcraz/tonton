import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/register_controller.dart';

class RegisterView extends GetView<RegisterController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('RegisterUser'),
        centerTitle: true,
      ),
      body: Form(
        key: controller.formKey,
        child: ListView(
          children: [
            TextFormField(
              decoration: const InputDecoration(
                hintText: 'User Name',
              ),
              validator: controller.validateUsername,
              textInputAction: TextInputAction.next,
              onChanged: controller.onUserNameChanged,
            ),
            TextFormField(
              decoration: const InputDecoration(
                hintText: 'Emel',
              ),
              validator: controller.validateEmel,
              textInputAction: TextInputAction.next,
              onChanged: controller.onEmelChanged,
            ),
            Obx(() => TextFormField(
                  decoration: InputDecoration(
                      hintText: 'Password',
                      suffixIcon: IconButton(
                        onPressed: controller.toggleShowPassword,
                        icon: Icon(
                          controller.isHidePassword
                              ? Icons.visibility
                              : Icons.visibility_off,
                        ),
                      )),
                  obscureText: controller.isHidePassword,
                  validator: controller.validatePassword,
                  textInputAction: TextInputAction.next,
                  onChanged: controller.onPasswordChanged,
                )),
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          FloatingActionButton(
            heroTag: '',
            onPressed: controller.onSubmit,
            child: Icon(Icons.add),
          ),
        ],
      ),
    );
  }
}
