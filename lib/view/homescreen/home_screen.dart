import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:plarfrom_converter_app/adaptive/themeadaptive.dart';
import 'package:provider/provider.dart';

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
                        Stack(
                          children: [
                            CircleAvatar(
                              radius: 60,
                            ),
                            Positioned(
                              top: 80,
                              left: 80,
                              child: Container(
                                padding: EdgeInsets.all(2),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(width: 2),
                                ),
                                child: Icon(Icons.edit),
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          decoration: InputDecoration(
                              labelText: 'Full Name',
                              prefixIcon: Icon(Icons.person_outline),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(3),
                              )),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          decoration: InputDecoration(
                              labelText: 'Phone Number',
                              prefixIcon: Icon(Icons.phone),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(3),
                              )),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          decoration: InputDecoration(
                              labelText: 'Chat Conversation',
                              prefixIcon: Icon(Icons.message_outlined),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(3),
                              )),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        ListTile(
                          leading: Icon(Icons.calendar_month),
                          onTap: () async {
                            DateTime dateTime = await showDatePicker(
                                  context: context,
                                  firstDate: DateTime(1950),
                                  lastDate: DateTime(2050),
                                ) ??
                                DateTime.now();
                            providerfalse!.changedate(dateTime);
                          },
                          title: Text('Pick Date'),
                          trailing: Text(
                              "${providertrue!.dateTime.day} - ${providertrue!.dateTime.month} - ${providertrue!.dateTime.year}"),
                        ),
                        ListTile(
                          leading: Icon(Icons.access_time),
                          onTap: () async {
                            TimeOfDay timeOfDay = await showTimePicker(
                                  context: context,
                                  initialTime: TimeOfDay.now(),
                                ) ??
                                TimeOfDay.now();
                            providerfalse!.changetime(timeOfDay);
                          },
                          title: Text('Pick Time'),
                          trailing:
                              Text("${providertrue!.timeOfDay.hour} : ${providertrue!.timeOfDay.minute}"),
                        ),
                        ElevatedButton(onPressed: () {}, child: Text('Save'))
                      ],
                    ),
                  ),
                ),
                Icon(Icons.directions_transit),
                Icon(Icons.directions_bike),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 10.0, horizontal: 10),
                  child: Column(
                    children: [
                      ListTile(
                        leading: Icon(Icons.person_outline),
                        title: Text('Profile'),
                        subtitle: Text('Update Profile Data'),
                        trailing: Switch(
                          value: providertrue!.isProfile,
                          onChanged: (value) {
                            providerfalse!.profileshow(value);
                          },
                        ),
                      ),
                      (providertrue!.isProfile)
                          ? Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 10),
                              child: SingleChildScrollView(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Stack(
                                      children: [
                                        CircleAvatar(
                                          radius: 60,
                                        ),
                                        Positioned(
                                          top: 80,
                                          left: 80,
                                          child: Container(
                                            padding: EdgeInsets.all(2),
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              border: Border.all(width: 2),
                                            ),
                                            child: Icon(Icons.edit),
                                          ),
                                        )
                                      ],
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    TextFormField(
                                      decoration: InputDecoration.collapsed(
                                          hintText: 'Enter your Name...'),
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    TextFormField(
                                        decoration: InputDecoration.collapsed(
                                            hintText: 'Enter your Bio..')),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        ElevatedButton(
                                            onPressed: () {},
                                            child: Text('Save')),
                                        ElevatedButton(
                                            onPressed: () {},
                                            child: Text('Clear')),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            )
                          : Container(),
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
                BottomNavigationBarItem(icon: Icon(CupertinoIcons.person_badge_plus),),
                BottomNavigationBarItem(icon: Icon(CupertinoIcons.chat_bubble,size: 25,),label: 'CHATS'),
                BottomNavigationBarItem(icon: Icon(CupertinoIcons.phone,size: 25,),label: 'CALLS'),
                BottomNavigationBarItem(icon: Icon(CupertinoIcons.settings),label: 'SETTINGS'),
              ]), tabBuilder: (context, index) {
                if(index==0)
                  {
                    return Padding(
                      padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Stack(
                              children: [
                                CircleAvatar(
                                  radius: 60,
                                ),
                                Positioned(
                                  top: 80,
                                  left: 80,
                                  child: Container(
                                    padding: EdgeInsets.all(2),
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(width: 2),
                                    ),
                                    child: Icon(Icons.edit),
                                  ),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Row(
                              children: [
                                Icon(CupertinoIcons.person),
                                SizedBox(width: 10,),
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
                                SizedBox(width: 10,),
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
                                SizedBox(width: 10,),
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
                            CupertinoListTile(
                              padding: EdgeInsets.zero,
                              leading: Icon(CupertinoIcons.calendar),
                              onTap: () async {
                                showCupertinoModalPopup(context: context, builder: (context) {
                                  return Container(
                                    height: 200,
                                    decoration:  BoxDecoration(
                                      color: providertrue!.isdark ? CupertinoColors.white:CupertinoColors.black,
                                    ),
                                    child: CupertinoDatePicker(onDateTimeChanged: (value) {
                                      providerfalse!.changedate(value);
                                    },),
                                  );
                                },);

                              },
                              title: Text('Pick Date'),
                              trailing: Text(
                                  "${providertrue!.dateTime.day} - ${providertrue!.dateTime.month} - ${providertrue!.dateTime.year}"),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            CupertinoListTile(
                              padding: EdgeInsets.zero,
                              leading: Icon(CupertinoIcons.time),
                              onTap: () async {
                                showCupertinoModalPopup(context: context, builder: (context) {
                                  return Container(
                                    height: 200,
                                    decoration:  BoxDecoration(
                                      color: providertrue!.isdark ? CupertinoColors.white:CupertinoColors.black,
                                    ),
                                    child: CupertinoTimerPicker(onTimerDurationChanged: (value) {
                                      providerfalse!.changeCupertinotime(value);
                                    },)
                                  );
                                },);
                              },
                              title: Text('Pick Time'),
                              trailing: Text(
                                  "${providertrue!.duration.inHours} - ${providertrue!.duration.inMinutes}"),
                            ),
                            // ElevatedButton(onPressed: () {}, child: Text('Save'))
                          ],
                        ),
                      ),
                    );
                  }
                else
                  {
                    return Text('hello');
                  }
              },),
        ),
      );
    }
  }
}
