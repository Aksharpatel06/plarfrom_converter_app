import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:plarfrom_converter_app/adaptive/themeadaptive.dart';
import 'package:plarfrom_converter_app/modal/details_model.dart';
import 'package:provider/provider.dart';

import '../../adaptive/call_image_adaptive.dart';
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
            title: Text('Platfrom Converter'),
            actions: [
              Switch(
                value: providertrue!.isios,
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
                Tab(text: 'SETTINGS'),
              ],
            ),
          ),
          body: SafeArea(
            child: TabBarView(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CallImageAdaptive(),
                        SizedBox(
                          height: 20,
                        ),
                        call_details_fild(
                            label: 'Full Name',
                            textInputType: TextInputType.name,
                            iconData: Icons.person_outline,
                            textEditingController: providertrue!.txtname),
                        SizedBox(
                          height: 10,
                        ),
                        call_details_fild(
                            label: 'Phone Number',
                            textInputType: TextInputType.phone,
                            iconData: Icons.phone,
                            textEditingController: providertrue!.txtnum),
                        SizedBox(
                          height: 10,
                        ),
                        call_details_fild(
                            label: 'Chat Conversation',
                            textInputType: TextInputType.text,
                            iconData: Icons.message_outlined,
                            textEditingController: providertrue!.txtchat),
                        SizedBox(
                          height: 10,
                        ),
                        DatePickerAdaptive(),
                        TimePickerAdaptive(),
                        ElevatedButton(
                          onPressed: () {
                            DetailsModel callDetials = DetailsModel(
                                img: providertrue!.imgpath!,
                                name: providertrue!.txtname.text,
                                num: int.parse(providertrue!.txtnum.text),
                                chats: providertrue!.txtchat.text,
                                dateTime: providertrue!.dateTime,
                                timeOfDay: providertrue!.timeOfDay);
                            providerfalse!.calldetailsAdd(callDetials);

                            providertrue!.imgpath = null;
                            providertrue!.txtname = TextEditingController(text: '');
                            providertrue!.txtnum = TextEditingController(text: '');
                            providertrue!.txtchat = TextEditingController(text: '');
                            providertrue!.dateTime = DateTime.now();
                            providertrue!.timeOfDay = TimeOfDay.now();
                          },
                          child: Text('Save'),
                        ),
                      ],
                    ),
                  ),
                ),
                Column(
                  children: List.generate(
                    providertrue!.callList.length,
                    (index) => ListTile(
                      leading:providertrue!.callList[index].img == null? CircleAvatar(
                        backgroundImage: AssetImage('asset/img/camera.png'),
                      ):CircleAvatar(
                        backgroundImage: FileImage(providertrue!.callList[index].img!),
                      ),
                      title: Text(providertrue!.callList[index].name),
                      subtitle: Text(providertrue!.callList[index].chats),
                          trailing: Icon(Icons.call),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 10.0, horizontal: 10),
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
          middle: Text('Platfrom Converter'),
          trailing: CupertinoSwitch(
            value: providertrue!.isios,
            onChanged: (value) {
              providerfalse!.changePlatfrom(value);
            },
          ),
        ),
        child: SafeArea(
          child: CupertinoTabScaffold(
            tabBar: CupertinoTabBar(items: [
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
                return Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CallImageAdaptive(),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            Icon(CupertinoIcons.person),
                            SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              child: CupertinoTextField(
                                placeholder: 'Full Name',
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  border: Border.all(width: 0.5),
                                  borderRadius: BorderRadius.circular(3),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            Icon(CupertinoIcons.phone),
                            SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              child: CupertinoTextField(
                                padding: EdgeInsets.all(10),
                                placeholder: 'Phone number',
                                decoration: BoxDecoration(
                                  border: Border.all(width: 0.5),
                                  borderRadius: BorderRadius.circular(3),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            Icon(CupertinoIcons.chat_bubble_text),
                            SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              child: CupertinoTextField(
                                padding: EdgeInsets.all(10),
                                placeholder: 'Chat Conversation',
                                decoration: BoxDecoration(
                                  border: Border.all(width: 0.5),
                                  borderRadius: BorderRadius.circular(3),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        DatePickerAdaptive(),
                        SizedBox(
                          height: 20,
                        ),
                        TimePickerAdaptive(),
                        CupertinoButton(
                          child: Text('Save'),
                          onPressed: () {},
                        ),
                      ],
                    ),
                  ),
                );
              } else if (index == 1) {
                return Column(
                  children: List.generate(
                    providertrue!.callList.length,
                        (index) => CupertinoListTile(
                      leading:providertrue!.callList[index].img == null? CircleAvatar(
                        backgroundImage: AssetImage('asset/img/camera.png'),
                      ):CircleAvatar(
                        backgroundImage: FileImage(providertrue!.callList[index].img!),
                      ),
                      title: Text(providertrue!.callList[index].name),
                      subtitle: Text(providertrue!.callList[index].chats),
                      trailing: Text(
                          '${providertrue!.callList[index].dateTime.day} - ${providertrue!.callList[index].dateTime.month} - ${providertrue!.callList[index].dateTime.year} , ${providertrue!.callList[index].timeOfDay.hour} : ${providertrue!.callList[index].timeOfDay.minute}'),
                    ),
                  ),
                );
              } else if (index == 2) {
                return Column(
                  children: List.generate(
                    providertrue!.callList.length,
                        (index) => CupertinoListTile(
                      leading:providertrue!.callList[index].img == null? CircleAvatar(
                        backgroundImage: AssetImage('asset/img/camera.png'),
                      ):CircleAvatar(
                        backgroundImage: FileImage(providertrue!.callList[index].img!),
                      ),
                      title: Text(providertrue!.callList[index].name),
                      subtitle: Text(providertrue!.callList[index].chats),
                      trailing: Icon(CupertinoIcons.phone),
                    ),
                  ),
                );
              } else if (index == 3) {
                return Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 10.0, horizontal: 10),
                  child: Column(
                    children: [
                      ProfileAdaptive(),
                      ThemeModeScreen(),
                    ],
                  ),
                );
              } else {
                return Text('hello');
              }
            },
          ),
        ),
      );
    }
  }

  TextFormField call_details_fild(
      {String? label,
      TextInputType? textInputType,
      IconData? iconData,
      required TextEditingController textEditingController}) {
    return TextFormField(
      controller: textEditingController,
      keyboardType: textInputType,
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
          labelText: label,
          prefixIcon: Icon(iconData),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(3),
          )),
    );
  }
}
