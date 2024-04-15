import 'package:flutter/material.dart';
import 'package:flutter_journal_moviesandseries/widgets/colors.dart';

class FormFieldWidget extends StatelessWidget {
  final TextEditingController controller;
  final TextInputType? keyboardType;
  final String label;
  const FormFieldWidget(
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
      style: const TextStyle(fontSize: 20),
      decoration: InputDecoration(
        filled: true,
        fillColor: ColorsTheme.bgInput,
        contentPadding: const EdgeInsets.all(20),
        labelText: label,
        helperText: label.toLowerCase().contains('senha')
            ? "Mínimo 6 caractereres"
            : null,
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(50),
          ),
        ),
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
