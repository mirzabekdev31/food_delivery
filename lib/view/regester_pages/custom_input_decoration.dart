import 'package:flutter/material.dart';
InputDecoration customInputDecoration(bool isError, String hintText) {
  return InputDecoration(
    contentPadding: const EdgeInsets.symmetric(horizontal: 18, vertical: 18),
    border: isError
        ? const OutlineInputBorder(
      borderSide: BorderSide(color: Colors.red),
    )
        : InputBorder.none,
    hintText: hintText,
    enabledBorder: isError
        ? const OutlineInputBorder(
      borderSide: BorderSide(color: Colors.red),
    )
        : InputBorder.none,
    focusedBorder: OutlineInputBorder(

      borderSide: BorderSide(color: (isError ? Colors.red : Colors.lightBlue)),
    ),
  );
}