import 'package:flutter/material.dart';

import '../widgets/form_update_data_widget.dart';

class UpdateDataPage extends StatelessWidget {
  const UpdateDataPage({super.key});

  @override
  Widget build(BuildContext context) {
    Object id = ModalRoute.of(context)!.settings.arguments.toString();
    return Scaffold(
      body: FormUpdateDataWidget(
        id: id.toString(),
      ),
    );
  }
}
