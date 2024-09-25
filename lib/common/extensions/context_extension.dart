import 'package:flutter/material.dart';

extension BuildContextExtenstion on BuildContext {
  ThemeData get thene => Theme.of(this);
  TextTheme get textTheme => Theme.of(this).textTheme;

  void showSnackBar(
    String text,
  ) {
    ScaffoldMessenger.of(this).showSnackBar(SnackBar(
        behavior: SnackBarBehavior.floating,
        margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        content: Text(text)));
  }
  /**
   * 
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text("google")));
   * 
   */
}
