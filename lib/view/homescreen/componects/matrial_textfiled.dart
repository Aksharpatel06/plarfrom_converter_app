import 'package:flutter/material.dart';

TextFormField call_details_field(
    {String? label,
      TextInputType? textInputType,
      IconData? iconData,
      required TextEditingController textEditingController}) {
  return TextFormField(
    controller: textEditingController,
    keyboardType: textInputType,
    textInputAction: TextInputAction.next,
    validator: (value) {
    },
    decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(iconData),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(3),
        )),
  );
}