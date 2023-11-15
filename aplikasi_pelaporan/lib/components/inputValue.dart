import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InputValue extends StatelessWidget {
  const InputValue({
    super.key,
    this.onSubmitted,
    required this.label,
    this.controller,
    this.password,
    this.maxLines,
  });

  final Function(String value)? onSubmitted;
  final String label;
  final TextEditingController? controller;
  final bool? password;
  final int? maxLines;

  @override
  Widget build(BuildContext context) {
    RxBool showPassword = false.obs;
    password == true ? showPassword.value = true : showPassword.value = false;

    return Obx(
      () => TextField(
        obscureText: showPassword.value,
        maxLines: maxLines,
        controller: controller,
        onChanged: onSubmitted,
        decoration: InputDecoration(
            labelText: label,
            suffixIcon: () {
              if (password == true) {
                return IconButton(
                  icon: Icon(showPassword.value ? Icons.lock : Icons.lock_open),
                  onPressed: () {
                    showPassword.value = !showPassword.value;
                    print(showPassword);
                  },
                );
              }
            }()),
      ),
    );
  }
}
