import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/profile_provider.dart';
import '../provider/screen_provider.dart';
import '../utils/global_variable.dart';

class ThemeModeScreen extends StatelessWidget {
  const ThemeModeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    providerfalse = Provider.of<PlatfromProvider>(context, listen: false);
    providertrue = Provider.of<PlatfromProvider>(context, listen: true);

    profileProviderfalse = Provider.of<ProfileProvider>(context, listen: false);
    profileProvidertrue = Provider.of<ProfileProvider>(context, listen: true);
    if (providertrue!.isios) {
      return ListTile(
        leading: Icon(Icons.sunny),
        title: Text('Theme'),
        subtitle: Text('Change Theme'),
        trailing: Switch(
          value: profileProvidertrue!.isdark,
          onChanged: (value) {
            profileProviderfalse!.changeColor(value);
          },
        ),
      );
    } else {
      return CupertinoListTile(
        leading: Icon(CupertinoIcons.sun_max),
        title: Text('Theme'),
        subtitle: Text('Change Theme'),
        trailing: CupertinoSwitch(
          value: profileProvidertrue!.isdark,
          onChanged: (value) {
            profileProviderfalse!.changeColor(value);
          },
        ),
      );
    }
  }
}
