import 'package:flutter/cupertino.dart';

Row cupertinotextfild(
    {IconData? iconData,
      String? name,
      required TextEditingController textEditingController}) {
  return Row(
    children: [
      Icon(iconData),
      SizedBox(
        width: 10,
      ),
      Expanded(
        child: CupertinoTextField(
          controller: textEditingController,
          placeholder: name,
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            border: Border.all(width: 0.5),
            borderRadius: BorderRadius.circular(3),
          ),
        ),
      ),
    ],
  );
}