import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/screen_provider.dart';
import '../utils/global_variable.dart';

class ChatsDetailsAdaptive extends StatelessWidget {
  const ChatsDetailsAdaptive({super.key});


  @override
  Widget build(BuildContext context) {
    providerfalse = Provider.of<PlatfromProvider>(context, listen: false);
    providertrue = Provider.of<PlatfromProvider>(context, listen: true);
    if (providertrue!.isios) {
      return (providertrue!.callList.isEmpty)
          ? const Center(child: Text('No Any Chats Yets....'))
          : Column(
              children: List.generate(
                providertrue!.callList.length,
                (detailsindex) => ListTile(
                  onTap: () async {
                    var img = providertrue!
                        .callList[detailsindex].img;
                    var name = providertrue!.callList[detailsindex].name;
                    var chats = providertrue!.callList[detailsindex].chats;
                     showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              img == null
                                  ? const CircleAvatar(
                                      radius: 50,
                                      backgroundImage:
                                          AssetImage('asset/img/camera.png'),
                                    )
                                  : CircleAvatar(
                                      radius: 50,
                                      backgroundImage: FileImage(img),
                                    ),
                              Text(name),
                              Text(
                                chats,
                                style: const TextStyle(fontSize: 15),
                              ),
                            ],
                          ),
                          actions: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                InkWell(
                                  child: const Icon(Icons.edit),
                                  onTap: () {
                                    providerfalse!.editdetails(
                                        detailsIndex: detailsindex);
                                    Navigator.pop(context);
                                    providerfalse!.changetabbar(0);
                                    log(providertrue!.tabbarindex);
                                  },
                                ),
                                InkWell(
                                  child:
                                      const Icon(Icons.delete_forever_outlined),
                                  onTap: () {
                                    providerfalse!.removedetails(detailsindex);
                                    Navigator.of(context).pop();
                                  },
                                ),
                                InkWell(
                                  child: const Text('Cancel'),
                                  onTap: () {
                                    Navigator.of(context).pop();
                                  },
                                ),
                              ],
                            )
                          ],
                        );
                      },
                    );
                  },
                  leading: providertrue!.callList[detailsindex].img == null
                      ? const CircleAvatar(
                          backgroundImage: AssetImage('asset/img/camera.png'),
                        )
                      : CircleAvatar(
                          backgroundImage: FileImage(
                              providertrue!.callList[detailsindex].img!),
                        ),
                  title: Text(providertrue!.callList[detailsindex].name),
                  subtitle: Text(providertrue!.callList[detailsindex].chats),
                  trailing: Text(
                      '${providertrue!.callList[detailsindex].dateTime.day} - ${providertrue!.callList[detailsindex].dateTime.month} - ${providertrue!.callList[detailsindex].dateTime.year} , ${providertrue!.callList[detailsindex].timeOfDay.hour} : ${providertrue!.callList[detailsindex].timeOfDay.minute}'),
                ),
              ),
            );
    } else {
      return (providertrue!.callList.isEmpty)
          ? const Center(child: Text('No Any Chats Yets....'))
          : Column(
              children: List.generate(
                providertrue!.callList.length,
                (detailsindex) => CupertinoListTile(
                  onTap: ()  {
                    var img = providertrue!
                        .callList[detailsindex].img;
                    var name = providertrue!.callList[detailsindex].name;
                    var chats = providertrue!.callList[detailsindex].chats;
                    showCupertinoModalPopup(
                      context: context,
                      builder: (context) {
                        return CupertinoAlertDialog(
                          content: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              img == null
                                  ? const CircleAvatar(
                                radius: 50,
                                      backgroundImage:
                                          AssetImage('asset/img/camera.png'),
                                    )
                                  : CircleAvatar(
                                radius: 50,
                                      backgroundImage: FileImage(img),
                                    ),
                              Text(name,style: const TextStyle(fontSize: 20,)),
                              Text(chats,style: const TextStyle(fontSize: 15),)
                            ],
                          ),
                          actions: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                CupertinoButton(
                                  child: const Icon(CupertinoIcons.pen),
                                  onPressed: () {
                                    providerfalse!.editdetails(
                                        detailsIndex: detailsindex,);
                                    Navigator.pop(context);
                                    providerfalse!.changetabbar(0);
                                  },
                                ),
                                CupertinoButton(
                                  child: const Icon(CupertinoIcons.delete),
                                  onPressed: () {
                                    providerfalse!.removedetails(detailsindex);
                                    Navigator.of(context).pop();
                                  },
                                ),
                              ],
                            ),
                            CupertinoButton(
                              child: const Text('Cancel'),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            )
                          ],
                        );
                      },
                    );
                  },
                  leading: providertrue!.callList[detailsindex].img == null
                      ? const CircleAvatar(
                          backgroundImage: AssetImage('asset/img/camera.png'),
                        )
                      : CircleAvatar(
                          backgroundImage: FileImage(
                              providertrue!.callList[detailsindex].img!),
                        ),
                  title: Text(providertrue!.callList[detailsindex].name),
                  subtitle: Text(providertrue!.callList[detailsindex].chats),
                  trailing: Text(
                      '${providertrue!.callList[detailsindex].dateTime.day} - ${providertrue!.callList[detailsindex].dateTime.month} - ${providertrue!.callList[detailsindex].dateTime.year} , ${providertrue!.callList[detailsindex].timeOfDay.hour} : ${providertrue!.callList[detailsindex].timeOfDay.minute}'),
                ),
              ),
            );
    }
  }
}
