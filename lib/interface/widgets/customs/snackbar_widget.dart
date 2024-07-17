import 'package:flutter/material.dart';

showSnackBar({
  required BuildContext context,
  required String text,
  bool isError = true,
}) {
  SnackBar snackBar = SnackBar(
    content: Text(text),
    backgroundColor: (isError) ? Colors.red : Colors.green,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(16),
      ),
    ),
    showCloseIcon: true,
    action: SnackBarAction(
        label: "Ok",
        textColor: Colors.white,
        onPressed: () {
          ScaffoldMessenger.of(context).removeCurrentSnackBar();
        }),
  );
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
