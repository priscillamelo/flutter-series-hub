import 'package:flutter/material.dart';

class LoginFormFieldWidget extends StatelessWidget {
  final TextEditingController controller;
  final TextInputType? keyboardType;
  final String label;
  const LoginFormFieldWidget(
      {super.key,
      required this.label,
      this.keyboardType,
      required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      validator: _validatorField,
      obscureText: label.toLowerCase().contains('senha') ? true : false,
      decoration: InputDecoration(
        hintText: label,
        helperText: label.toLowerCase().contains('senha')
            ? "Mínimo 6 caractereres"
            : null,
      ),
    );
  }

  String? _validatorField(String? value) {
    if (value == null || value.isEmpty) {
      return "O campo não pode ser vazio";
    }
    if (label.toLowerCase().contains('e-mail')) {
      if (!value.contains("@")) {
        return "O e-mail é inválido";
      }
    }
    return null;
  }
}
