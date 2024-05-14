import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../utils/global_variable.dart';

class ProfileAdaptive extends StatelessWidget {
  const ProfileAdaptive({super.key});

  @override
  Widget build(BuildContext context) {
    if (providertrue!.isios) {
      return Column(
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
                  InkWell(
                    onTap: () {
                      providerfalse!.profileImage();
                    },
                    child: (providertrue!.profileimgpath != null)
                        ? CircleAvatar(
                        radius: 60,
                        backgroundImage: FileImage(providertrue!.profileimgpath!))
                        : CircleAvatar(
                        radius: 60,
                        backgroundImage: AssetImage('asset/img/camera.png')),
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
        ],
      );
    } else {
      return Column(
        children: [
          CupertinoListTile(
            leading: Icon(CupertinoIcons.person),
            title: Text('Profile'),
            subtitle: Text('Update Profile Data'),
            trailing: CupertinoSwitch(
              value: providertrue!.isProfile,
              onChanged: (value) {
                providerfalse!.profileshow(value);
              },
            ),
          ),
          (providertrue!.isProfile)
              ? Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CupertinoButton(
                          onPressed: () {
                            providerfalse!.profileImage();
                          },
                          child: (providertrue!.profileimgpath != null)
                              ? CircleAvatar(
                              radius: 60, backgroundImage: FileImage(providertrue!.profileimgpath!))
                              : CircleAvatar(
                              radius: 60,
                              backgroundImage: AssetImage('asset/img/camera.png')),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        CupertinoTextField(
                          padding: EdgeInsets.all(10),
                          placeholder: 'Enter Your Name..',
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(3),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        CupertinoTextField(
                          padding: EdgeInsets.all(10),
                          placeholder: 'Enter Your Bio..',
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(3),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            CupertinoButton(
                              child: Text('Save'),
                              onPressed: () {},
                            ),
                            CupertinoButton(
                              child: Text('Clear'),
                              onPressed: () {},
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                )
              : Container(),
        ],
      );
    }
  }
}
