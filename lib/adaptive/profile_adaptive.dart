import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:plarfrom_converter_app/provider/profile_provider.dart';
import 'package:provider/provider.dart';

import '../provider/screen_provider.dart';
import '../utils/global_variable.dart';

class ProfileAdaptive extends StatelessWidget {
  const ProfileAdaptive({super.key});

  @override
  Widget build(BuildContext context) {
    providerfalse = Provider.of<PlatfromProvider>(context, listen: false);
    providertrue = Provider.of<PlatfromProvider>(context, listen: true);

    profileProviderfalse = Provider.of<ProfileProvider>(context, listen: false);
    profileProvidertrue = Provider.of<ProfileProvider>(context, listen: true);
    if (providertrue!.isios) {
      return Column(
        children: [
          ListTile(
            leading: Icon(Icons.person_outline),
            title: Text('Profile'),
            subtitle: Text('Update Profile Data'),
            trailing: Switch(
              value: profileProvidertrue!.isProfile,
              onChanged: (value) {
                profileProviderfalse!.profileshow(value);
              },
            ),
          ),
          (profileProvidertrue!.isProfile)
              ? Padding(
            padding: const EdgeInsets.symmetric(
                vertical: 10, horizontal: 10),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {
                      profileProviderfalse!.profileImage();
                    },
                    child: (profileProvidertrue!.profileimgpath != null)
                        ? CircleAvatar(
                        radius: 60,
                        backgroundImage: FileImage(profileProvidertrue!.profileimgpath!))
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
              value: profileProvidertrue!.isProfile,
              onChanged: (value) {
                profileProviderfalse!.profileshow(value);
              },
            ),
          ),
          (profileProvidertrue!.isProfile)
              ? Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CupertinoButton(
                          onPressed: () {
                            profileProviderfalse!.profileImage();
                          },
                          child: (profileProvidertrue!.profileimgpath != null)
                              ? CircleAvatar(
                              radius: 60, backgroundImage: FileImage(profileProvidertrue!.profileimgpath!))
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
