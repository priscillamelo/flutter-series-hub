import 'package:flutter/material.dart';

class FormFieldWidget extends StatelessWidget {
  final String label;
  const FormFieldWidget({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: label.toLowerCase().contains('senha') ? true : false,
      style: const TextStyle(fontSize: 20),
      decoration: InputDecoration(
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
