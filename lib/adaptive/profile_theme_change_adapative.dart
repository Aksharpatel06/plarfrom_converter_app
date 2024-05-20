import 'package:flutter/cupertino.dart';
import 'package:plarfrom_converter_app/adaptive/profile_adaptive.dart';
import 'package:plarfrom_converter_app/adaptive/themeadaptive.dart';
import 'package:plarfrom_converter_app/utils/global_variable.dart';
import 'package:provider/provider.dart';

import '../provider/screen_provider.dart';

class ProfileThemecChangeaAdapative extends StatelessWidget {
  const ProfileThemecChangeaAdapative({super.key});

  @override
  Widget build(BuildContext context) {
    providerfalse = Provider.of<PlatfromProvider>(context, listen: false);
    providertrue = Provider.of<PlatfromProvider>(context, listen: true);

    if(providertrue!.isios)
      {
        return const SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10),
            child: Column(
              children: [
                ProfileAdaptive(),
                ThemeModeScreen(),
              ],
            ),
          ),
        );
      } else{
      return const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10),
          child: Column(
            children: [
              ProfileAdaptive(),
              ThemeModeScreen(),
            ],
          ),
        ),
      );
    }
  }
}
