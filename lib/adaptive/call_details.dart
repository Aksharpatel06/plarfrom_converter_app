import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart' as launchar;

import '../provider/screen_provider.dart';
import '../utils/global_variable.dart';

class CallDetails extends StatelessWidget {
  const CallDetails({super.key});

  @override
  Widget build(BuildContext context) {
    providerfalse = Provider.of<PlatfromProvider>(context, listen: false);
    providertrue = Provider.of<PlatfromProvider>(context, listen: true);

    if (providertrue!.isios) {
      return (providertrue!.callList.isEmpty)
          ? const Center(child: Text('No Any Calls Yets....'))
          : Column(
              children: List.generate(
                providertrue!.callList.length,
                (index) => ListTile(
                  onTap: () {
                    Uri uri = Uri.parse(
                        'tel: +91 ${providertrue!.callList[index].num.toString()}');
                    launchar.launchUrl(uri);
                  },
                  leading: providertrue!.callList[index].img == null
                      ? const CircleAvatar(
                          backgroundImage: AssetImage('asset/img/camera.png'),
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
            );
    } else {
      return (providertrue!.callList.isEmpty)
          ? const Center(child: Text('No Any Calls Yets....'))
          : Column(
              children: List.generate(
                providertrue!.callList.length,
                (index) => CupertinoListTile(
                  onTap: () {
                    Uri uri = Uri.parse(
                        'tel: +91 ${providertrue!.callList[index].num.toString()}');
                    launchar.launchUrl(uri);
                  },
                  leading: providertrue!.callList[index].img == null
                      ? const CircleAvatar(
                          backgroundImage: AssetImage('asset/img/camera.png'),
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
    }
  }
}
