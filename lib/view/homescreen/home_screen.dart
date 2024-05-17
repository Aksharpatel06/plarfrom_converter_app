import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:plarfrom_converter_app/adaptive/themeadaptive.dart';
import 'package:provider/provider.dart';

import '../../adaptive/call_details_add_adaptive.dart';
import '../../adaptive/call_field_adaptive.dart';
import '../../adaptive/call_image_adaptive.dart';
import '../../adaptive/call_save_adaptive.dart';
import '../../adaptive/chats_details.dart';
import '../../adaptive/date_picker_adaptive.dart';
import '../../adaptive/profile_adaptive.dart';
import '../../adaptive/time_picker_adaptive.dart';
import '../../provider/screen_provider.dart';
import '../../utils/global_variable.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    providerfalse = Provider.of<PlatfromProvider>(context, listen: false);
    providertrue = Provider.of<PlatfromProvider>(context, listen: true);
    if (providertrue!.isios) {
      return DefaultTabController(
        length: 4,
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
            bottom: const TabBar(
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
                Tab(text: 'SETTINGS'),
              ],
            ),
          ),
          body: SafeArea(
            child: TabBarView(
              children: [
                const CallDetailsAddScreenAdapatiev(),
                const ChatsDetailsAdaptive(),
                Column(
                  children: List.generate(
                    providertrue!.callList.length,
                    (index) => ListTile(
                      leading: providertrue!.callList[index].img == null
                          ? const CircleAvatar(
                              backgroundImage:
                                  AssetImage('asset/img/camera.png'),
                            )
                          : CircleAvatar(
                              backgroundImage:
                                  FileImage(providertrue!.callList[index].img!),
                            ),
                      title: Text(providertrue!.callList[index].name),
                      subtitle: Text(providertrue!.callList[index].chats),
                      trailing: const Icon(Icons.call),
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10),
                  child: Column(
                    children: [
                      ProfileAdaptive(),
                      ThemeModeScreen(),
                    ],
                  ),
                ),
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
            tabBar: CupertinoTabBar(items: const [
              BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.person_badge_plus),
              ),
              BottomNavigationBarItem(
                  icon: Icon(
                    CupertinoIcons.chat_bubble,
                    size: 25,
                  ),
                  label: 'CHATS'),
              BottomNavigationBarItem(
                  icon: Icon(
                    CupertinoIcons.phone,
                    size: 25,
                  ),
                  label: 'CALLS'),
              BottomNavigationBarItem(
                  icon: Icon(CupertinoIcons.settings), label: 'SETTINGS'),
            ]),
            tabBuilder: (context, index) {
              if (index == 0) {
                return const CallDetailsAddScreenAdapatiev();
              } else if (index == 1) {
                return const ChatsDetailsAdaptive();
              } else if (index == 2) {
                return Column(
                  children: List.generate(
                    providertrue!.callList.length,
                    (index) => CupertinoListTile(
                      leading: providertrue!.callList[index].img == null
                          ? const CircleAvatar(
                              backgroundImage:
                                  AssetImage('asset/img/camera.png'),
                            )
                          : CircleAvatar(
                              backgroundImage:
                                  FileImage(providertrue!.callList[index].img!),
                            ),
                      title: Text(providertrue!.callList[index].name),
                      subtitle: Text(providertrue!.callList[index].chats),
                      trailing: const Icon(CupertinoIcons.phone),
                    ),
                  ),
                );
              } else if (index == 3) {
                return const Padding(
                  padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10),
                  child: Column(
                    children: [
                      ProfileAdaptive(),
                      ThemeModeScreen(),
                    ],
                  ),
                );
              } else {
                return const Text('hello');
              }
            },
          ),
        ),
      );
    }
  }
}
