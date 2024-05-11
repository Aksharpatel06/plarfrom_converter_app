import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:plarfrom_converter_app/view/homescreen/home_screen.dart';
import 'package:provider/provider.dart';

import '../provider/screen_provider.dart';
import '../utils/global_variable.dart';


class AdaptiveWidget extends StatelessWidget {
  const AdaptiveWidget({super.key});

  @override
  Widget build(BuildContext context) {
    providerfalse = Provider.of<PlatfromProvider>(context, listen: false);
    providertrue = Provider.of<PlatfromProvider>(context, listen: true);

    if (providertrue!.isIos) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(brightness: Brightness.light),
        darkTheme: ThemeData(brightness: Brightness.dark),
        themeMode: providertrue!.isdark ? ThemeMode.light : ThemeMode.dark,
        home: HomeScreen(),
      );
    } else {
      return CupertinoApp(
        theme: providertrue!.isdark
            ? CupertinoThemeData(brightness: Brightness.light)
            : CupertinoThemeData(brightness: Brightness.dark),
        debugShowCheckedModeBanner: false,
        home: HomeScreen(),
      );
    }
  }
}
