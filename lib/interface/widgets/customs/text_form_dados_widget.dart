import 'package:flutter/material.dart';
import './colors.dart';

class DadosFormFieldWidget extends StatelessWidget {
  final TextEditingController controller;
  final TextInputType? keyboardType;
  final String label;
  const DadosFormFieldWidget({
    super.key,
    required this.controller,
    this.keyboardType,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      validator: _validatorField,
      minLines: 1,
      maxLines: label == "Sinopse" ? 5 : 1,
      decoration: InputDecoration(
        labelText: label,
        filled: true,
        fillColor: ColorsTheme.bgInput,
        contentPadding: const EdgeInsets.all(20),
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(50),
          ),
        ),
      ),
    );
  }

  String? _validatorField(String? value) {
    if (label == "Título" || keyboardType == TextInputType.number) {
      if (value == null || value.isEmpty) {
        return "O campo não pode ser vazio";
      }
      if (keyboardType == TextInputType.number &&
          label != 'Temporadas' &&
          int.parse(controller.value.text) < 1870) {
        return "Ano de lançamento inválido!";
      }
    }
    return null;
  }
}
