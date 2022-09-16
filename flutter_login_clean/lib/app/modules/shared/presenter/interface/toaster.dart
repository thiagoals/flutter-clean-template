import 'package:flutter/material.dart';

class Toaster{
  showToast(BuildContext context, String message, String actionMessage) {
    final scaffold = ScaffoldMessenger.of(context);
    scaffold.showSnackBar(
      SnackBar(
        content: Text(message),
        action: SnackBarAction(label: actionMessage, onPressed: scaffold.hideCurrentSnackBar),
      ),
    );
  }
}