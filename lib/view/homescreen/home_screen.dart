import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../adaptive/themeadaptive.dart';
import '../../provider/screen_provider.dart';
import '../../utils/global_variable.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    providerfalse = Provider.of<PlatfromProvider>(context, listen: false);
    providertrue = Provider.of<PlatfromProvider>(context, listen: true);
    if(providertrue!.isIos)
      {
        return DefaultTabController(
          length: 3,
          child: Scaffold(
            appBar: AppBar(
              title: Text('Platfrom Converter'),
              actions: [
                Switch(
                  value: providertrue!.isIos,
                  onChanged: (value) {
                    providerfalse!.changePlatfrom(value);
                  },
                )
              ],
              bottom: TabBar(
                tabs: [
                  Tab(
                    icon: Icon(Icons.person_add_alt),
                  ),
                  Tab(
                    text: 'CHATS',
                  ),
                  Tab(
                    text: 'CALLS',
                  ),
                  Tab(
                    text: 'SETTINGS',
                  ),
                ],
              ),
            ),
            body: TabBarView(children: [
              Icon(Icons.directions_car),
              Icon(Icons.directions_transit),
              Icon(Icons.directions_bike),
              Icon(Icons.directions_bike),
            ]),
            // body: ThemeModeScreen(),
          ),
        );
      }
    else
      {
        return CupertinoPageScaffold(
          navigationBar: CupertinoNavigationBar(
            middle: Text('Platfrom Converter'),
            trailing: CupertinoSwitch(
              value: providertrue!.isIos,
              onChanged: (value) {
                providerfalse!.changePlatfrom(value);
              },
            ),
          ),
          child: HomeScreen(),
        );
      }
  }
}
