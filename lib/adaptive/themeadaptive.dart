import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../utils/global_variable.dart';
import 'adaptive.dart';

class ThemeModeScreen extends StatelessWidget {
  const ThemeModeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    if(providertrue!.isIos)
    {
      return Center(
        child: Row(
          children: [
            Text('Theme mode:',),
            Switch(value: providertrue!.isdark, onChanged: (value) {
              providerfalse!.changeColor(value);
            },)
          ],
        ),
      );
    } else{
      return Center(
        child: Row(
          children: [
            Text('Theme mode:'),
            CupertinoSwitch(value: providertrue!.isdark, onChanged: (value) {
              providerfalse!.changeColor(value);
            },)
          ],
        ),
      );
    }
  }
}
