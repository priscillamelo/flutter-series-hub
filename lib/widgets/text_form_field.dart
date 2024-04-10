import 'package:flutter/material.dart';

class FormFieldWidget extends StatelessWidget {
  final String label;
  final Icon icon;
  final TextInputType? keyboardType;
  const FormFieldWidget(
      {super.key, required this.label, required this.icon, this.keyboardType});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: label.toLowerCase().contains('senha') ? true : false,
      style: const TextStyle(fontSize: 20),
      keyboardType: keyboardType,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.grey.shade100,
        prefixIconColor: Colors.purple.shade200,
        prefixIcon: icon,
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
