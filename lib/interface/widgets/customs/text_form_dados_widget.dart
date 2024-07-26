import 'package:flutter/material.dart';

class DadosFormFieldWidget extends StatelessWidget {
  final TextEditingController controller;
  final TextInputType keyboardType;
  final String label;
  const DadosFormFieldWidget({
    super.key,
    required this.controller,
    required this.keyboardType,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: valueInitial,
      controller: controller,
      keyboardType: keyboardType,
      validator: _validatorField,
      minLines: 1,
      maxLines: label == "Sinopse" ? 5 : 1,
      decoration: InputDecoration(
        hintText: label,
      ),
    );
  }

  String? _validatorField(String? value) {
    if (label == "Título") {
      if (value == null || value.isEmpty) {
        return "O campo não pode ser vazio";
      }
    }
    return null;
  }
}
