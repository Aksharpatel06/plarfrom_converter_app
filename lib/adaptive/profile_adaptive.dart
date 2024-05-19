import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:plarfrom_converter_app/provider/profile_provider.dart';
import 'package:provider/provider.dart';

import '../provider/screen_provider.dart';
import '../utils/global_variable.dart';
import '../view/homescreen/componects/cupertino_textfiled.dart';
import '../view/homescreen/componects/matrial_textfiled.dart';

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
            leading: const Icon(Icons.person_outline),
            title: const Text('Profile'),
            subtitle: const Text('Update Profile Data'),
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
                        : const CircleAvatar(
                        radius: 60,
                        backgroundImage: AssetImage('asset/img/camera.png')),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  call_details_field(
                      label: 'Your Name..',
                      textInputType: TextInputType.name,
                      iconData: Icons.person_outline,
                      textEditingController: profileProvidertrue!.txtfullname),

                  call_details_field(
                      label: 'Your Bio..',
                      textInputType: TextInputType.name,
                      iconData: Icons.chat,
                      textEditingController: profileProvidertrue!.txtbio),

                  Row(
                    mainAxisAlignment:
                    MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                          onPressed: () {},
                          child: const Text('Save')),
                      ElevatedButton(
                          onPressed: () {
                            profileProviderfalse!.clearprofile();
                          },
                          child: const Text('Clear')),
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
            leading: const Icon(CupertinoIcons.person),
            title: const Text('Profile'),
            subtitle: const Text('Update Profile Data'),
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
                              : const CircleAvatar(
                              radius: 60,
                              backgroundImage: AssetImage('asset/img/camera.png')),
                        ),
                        cupertinotextfild(
                          iconData: CupertinoIcons.person,
                          textEditingController: profileProvidertrue!.txtfullname,
                          name: 'Your Name..',context: context,textInputType: TextInputType.text,),
                        cupertinotextfild(
                          iconData: CupertinoIcons.chat_bubble_text,
                          textEditingController: profileProvidertrue!.txtbio,
                          name: 'Your Bio..',context: context,textInputType: TextInputType.text,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            CupertinoButton(
                              child: const Text('Save'),
                              onPressed: () {},
                            ),
                            CupertinoButton(
                              child: const Text('Clear'),
                              onPressed: () {
                                profileProviderfalse!.clearprofile();
                              },
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
