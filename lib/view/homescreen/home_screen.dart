import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../adaptive/call_details.dart';
import '../../adaptive/call_details_add_adaptive.dart';
import '../../adaptive/chats_details.dart';
import '../../adaptive/profile_theme_change_adapative.dart';
import '../../provider/screen_provider.dart';
import '../../utils/global_variable.dart';
import '../../utils/tab_view_global_list.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    providerfalse = Provider.of<PlatfromProvider>(context, listen: false);
    providertrue = Provider.of<PlatfromProvider>(context, listen: true);
    if (providertrue!.isios) {
      return DefaultTabController(
        length: 4,
        initialIndex: providertrue!.tabbarindex,
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Platfrom Converter'),
            actions: [
              Switch(
                value: providertrue!.isios,
                onChanged: (value) {
                  providerfalse!.changePlatfrom(value);
                },
              )
            ],
            bottom: TabBar(
              onTap: (value) => providerfalse!.changetabbar(value),
              tabs: const [
                Tab(
                  icon: Icon(Icons.person_add_alt),
                ),
                Tab(
                  text: 'CHATS',
                ),
                Tab(
                  text: 'CALLS',
                ),
                Tab(text: 'SETTINGS'),
              ],
            ),
          ),
          body: const SafeArea(
            child: TabBarView(
              children: [
                //USER CALL AND CHATS INPUT
                CallDetailsAddScreenAdapatiev(),

                //CHATS DETAILS
                ChatsDetailsAdaptive(),

                //CALL DETAILS
                CallDetails(),

                //PROFILE VIEW
                ProfileThemecChangeaAdapative(),
              ],
            ),
          ),
        ),
      );
    } else {
      return CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          middle: const Text('Platfrom Converter'),
          trailing: CupertinoSwitch(
            value: providertrue!.isios,
            onChanged: (value) {
              providerfalse!.changePlatfrom(value);
            },
          ),
        ),
        child: SafeArea(
          child: CupertinoTabScaffold(
            tabBar: CupertinoTabBar(
                onTap: (value) => providerfalse!.changetabbar(value),
                currentIndex: providertrue!.tabbarindex,
                items: <BottomNavigationBarItem>[
                  ...tabItemList,
                ],),
            tabBuilder: (context, index) {
              return tabList[index];
            },
          ),
        ),
      );
    }
  }
}
