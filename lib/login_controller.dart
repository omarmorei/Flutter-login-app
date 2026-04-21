import 'package:flutter/material.dart';

class LoginController {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  /// 🔹 بيانات مستخدم جاهزة
  final String correctEmail = "omar@gmail.com";
  final String correctPassword = "123456";

  /// 🔹 حالة إظهار كلمة المرور
  bool isPasswordHidden = true;

  void togglePassword() {
    isPasswordHidden = !isPasswordHidden;
  }

  /// 🔹 التحقق من الإيميل
  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return "Email is required";
    }
    if (!value.contains("@")) {
      return "Invalid email";
    }
    return null;
  }

  /// 🔹 التحقق من كلمة المرور
  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return "Password is required";
    }
    if (value.length < 6) {
      return "Minimum 6 characters";
    }
    return null;
  }

  /// 🔹 تسجيل الدخول
  bool login() {
    if (!formKey.currentState!.validate()) return false;

    return emailController.text == correctEmail &&
        passwordController.text == correctPassword;
  }

  void dispose() {
    emailController.dispose();
    passwordController.dispose();
  }
}