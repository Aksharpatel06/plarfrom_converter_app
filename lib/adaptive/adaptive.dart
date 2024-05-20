import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:plarfrom_converter_app/view/homescreen/home_screen.dart';
import 'package:provider/provider.dart';

import '../provider/profile_provider.dart';
import '../provider/screen_provider.dart';
import '../utils/global_variable.dart';


class AdaptiveWidget extends StatelessWidget {
  const AdaptiveWidget({super.key});

  @override
  Widget build(BuildContext context) {
    providerfalse = Provider.of<PlatfromProvider>(context, listen: false);
    providertrue = Provider.of<PlatfromProvider>(context, listen: true);

    profileProviderfalse = Provider.of<ProfileProvider>(context, listen: false);
    profileProvidertrue = Provider.of<ProfileProvider>(context, listen: true);

    if (providertrue!.isios) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(brightness: Brightness.light),
        darkTheme: ThemeData(brightness: Brightness.dark),
        themeMode: profileProvidertrue!.isdark ? ThemeMode.light : ThemeMode.dark,
        home: const HomeScreen(),
      );
    } else {
      return CupertinoApp(
        theme: profileProvidertrue!.isdark
            ? const CupertinoThemeData(brightness: Brightness.light)
            : const CupertinoThemeData(brightness: Brightness.dark),
        debugShowCheckedModeBanner: false,
        home:  const HomeScreen(),
      );
    }
  }
}
