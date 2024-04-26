import 'package:flutter/material.dart';

enum ValuesRegister { movie, serie }

class OptionsRegister extends StatefulWidget {
  const OptionsRegister({super.key});

  @override
  State<OptionsRegister> createState() => _OptionsRegister();
}

class _OptionsRegister extends State<OptionsRegister> {
  ValuesRegister valueRegister = ValuesRegister.movie;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height / 10,
      child: Column(
        children: <Widget>[
          ListTile(
            title: const Text('Filme'),
            leading: Radio<ValuesRegister>(
              value: ValuesRegister.movie,
              groupValue: valueRegister,
              onChanged: (ValuesRegister? value) {
                setState(() {
                  valueRegister = value!;
                });
              },
            ),
          ),
          ListTile(
            title: const Text('Série'),
            leading: Radio<ValuesRegister>(
              value: ValuesRegister.serie,
              groupValue: valueRegister,
              onChanged: (ValuesRegister? value) {
                setState(() {
                  valueRegister = value!;
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
