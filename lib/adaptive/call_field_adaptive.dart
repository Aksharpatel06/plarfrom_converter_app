import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:plarfrom_converter_app/utils/global_variable.dart';

import '../view/homescreen/componects/cupertino_textfiled.dart';
import '../view/homescreen/componects/matrial_textfiled.dart';

class CallFieldAdaptive extends StatelessWidget {
  const CallFieldAdaptive({super.key});

  @override
  Widget build(BuildContext context) {
    if(providertrue!.isios)
      {
        return Column(
          children: [
            SizedBox(
              height: 20,
            ),
            call_details_field(
                label: 'Full Name',
                textInputType: TextInputType.name,
                iconData: Icons.person_outline,
                textEditingController: providertrue!.txtname),
            SizedBox(
              height: 10,
            ),
            call_details_field(
                label: 'Phone Number',
                textInputType: TextInputType.phone,
                iconData: Icons.phone,
                textEditingController: providertrue!.txtnum),
            SizedBox(
              height: 10,
            ),
            call_details_field(
                label: 'Chat Conversation',
                textInputType: TextInputType.text,
                iconData: Icons.message_outlined,
                textEditingController: providertrue!.txtchat),
            SizedBox(
              height: 10,
            ),
          ],
        );
      }else {
       return Column(
         children: [
           SizedBox(
             height: 20,
           ),
           cupertinotextfild(
               iconData: CupertinoIcons.person,
               textEditingController: providertrue!.txtname,
               name: 'Full Name'),
           SizedBox(
             height: 20,
           ),
           cupertinotextfild(
               iconData: CupertinoIcons.phone,
               textEditingController: providertrue!.txtnum,
               name: 'Phone Number'),
           SizedBox(
             height: 20,
           ),
           cupertinotextfild(
               iconData: CupertinoIcons.chat_bubble_text,
               textEditingController: providertrue!.txtchat,
               name: 'Chat Conversation'),
           SizedBox(
             height: 20,
           ),
         ],
       );
    }
  }
}
