import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import '../../../provider/screen_provider.dart';
import '../../../utils/global_variable.dart';

Widget cupertinotextfild(
    {IconData? iconData,
    String? name,
    required TextEditingController textEditingController,
    required BuildContext context,TextInputType? textInputType}) {
  providerfalse = Provider.of<PlatfromProvider>(context, listen: false);
  providertrue = Provider.of<PlatfromProvider>(context, listen: true);
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 8.0),
    child: Row(
      children: [
        Icon(iconData),
        Expanded(
          child: CupertinoTextFormFieldRow(
            validator: (value) {
              if (textEditingController==providertrue!.txtname) {
                if(providertrue!.txtname.text.isEmpty)
                  {
                    return 'Please enter the name';
                  }
              } else if (textEditingController == providertrue!.txtnum) {
                if (providertrue!.txtnum.text.length != 10) {
                  return 'Enter the correct number';
                }
              } else if(textEditingController==providertrue!.txtchat)
              {
                if (providertrue!.txtchat.text.isEmpty) {
                  return 'Please enter the chats';
                }
              }
              return null;
            },
            keyboardType: textInputType,
            controller: textEditingController,
            placeholder: name,
            textInputAction: TextInputAction.next,
            decoration: BoxDecoration(
              border: Border.all(width: 0.5),
              borderRadius: BorderRadius.circular(3),
            ),
          ),
        ),
      ],
    ),
  );
}
