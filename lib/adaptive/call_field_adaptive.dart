import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:plarfrom_converter_app/utils/global_variable.dart';
import 'package:provider/provider.dart';

import '../provider/screen_provider.dart';
import '../view/homescreen/componects/cupertino_textfiled.dart';
import '../view/homescreen/componects/matrial_textfiled.dart';

class CallFieldAdaptive extends StatelessWidget {
  const CallFieldAdaptive({super.key});

  @override
  Widget build(BuildContext context) {
    providerfalse = Provider.of<PlatfromProvider>(context, listen: false);
    providertrue = Provider.of<PlatfromProvider>(context, listen: true);
    if(providertrue!.isios)
      {
        return Form(
          key: providertrue!.globalKey,
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              call_details_field(
                  label: 'Full Name',
                  textInputType: TextInputType.name,
                  iconData: Icons.person_outline,
                  textEditingController: providertrue!.txtname),
              const SizedBox(
                height: 10,
              ),
              call_details_field(
                  label: 'Phone Number',
                  textInputType: TextInputType.phone,
                  iconData: Icons.phone,
                  textEditingController: providertrue!.txtnum),
              const SizedBox(
                height: 10,
              ),
              call_details_field(
                  label: 'Chat Conversation',
                  textInputType: TextInputType.text,
                  iconData: Icons.message_outlined,
                  textEditingController: providertrue!.txtchat),
              const SizedBox(
                height: 10,
              ),
            ],
          ),
        );
      }else {
       return Form(
         key: providertrue!.globalKey,
         child: Column(
           children: [
             cupertinotextfild(
                 iconData: CupertinoIcons.person,
                 textEditingController: providertrue!.txtname,
                 name: 'Full Name',context: context),
             cupertinotextfild(
                 iconData: CupertinoIcons.phone,
                 textEditingController: providertrue!.txtnum,
                 name: 'Phone Number',context: context,textInputType: TextInputType.number,),
             cupertinotextfild(
                 iconData: CupertinoIcons.chat_bubble_text,
                 textEditingController: providertrue!.txtchat,
                 name: 'Chat Conversation',context: context),
           ],
         ),
       );
    }
  }
}
