import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../utils/global_variable.dart';

class ThemeModeScreen extends StatelessWidget {
  const ThemeModeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    if (providertrue!.isios) {
      return ListTile(
        leading: Icon(Icons.sunny),
        title: Text('Theme'),
        subtitle: Text('Change Theme'),
        trailing: Switch(
          value: providertrue!.isdark,
          onChanged: (value) {
            providerfalse!.changeColor(value);
          },
        ),
      );
    } else {
      return Center(
        child: Row(
          children: [
            Text('Theme mode:'),
            CupertinoSwitch(
              value: providertrue!.isdark,
              onChanged: (value) {
                providerfalse!.changeColor(value);
              },
            )
          ],
        ),
      );
    }
  }
}
