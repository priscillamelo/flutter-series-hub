import 'package:flutter/material.dart';

import '../widgets/form_data_widget.dart';

class AddDataPage extends StatelessWidget {
  const AddDataPage({super.key});

  @override
  Widget build(BuildContext context) {
    Object title = ModalRoute.of(context)!.settings.arguments.toString();
    return Scaffold(
      body: FormDataWidget(categoriaPertencente: title.toString()),
    );
  }
}
