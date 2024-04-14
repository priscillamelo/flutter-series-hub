import 'package:flutter/material.dart';

class FormFieldWidget extends StatelessWidget {
  final String label;
  final TextInputType? keyboardType;
  final TextEditingController controller;
  const FormFieldWidget(
      {super.key,
      required this.label,
      this.keyboardType,
      required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: label.toLowerCase().contains('senha') ? true : false,
      style: const TextStyle(fontSize: 20),
      keyboardType: keyboardType,
      controller: controller,
      validator: (String? value) {
        if (value == null || value.isEmpty) {
          return "O campo não pode ser vazio";
        }
        if (label.toLowerCase().contains('e-mail')) {
          if (!value.contains("@")) {
            return "O e-mail é inválido";
          }
        }
        return null;
      },
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.grey.shade100,
        prefixIconColor: Colors.purple.shade200,
        contentPadding: const EdgeInsets.all(20),
        labelText: label,
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(50),
          ),
        ),
      ),
    );
  }
}
