import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import '../../../provider/screen_provider.dart';
import '../../../utils/global_variable.dart';

Row cupertinotextfild(
    {IconData? iconData,
    String? name,
    required TextEditingController textEditingController,
    required BuildContext context,TextInputType? textInputType}) {
  providerfalse = Provider.of<PlatfromProvider>(context, listen: false);
  providertrue = Provider.of<PlatfromProvider>(context, listen: true);
  return Row(
    children: [
      Icon(iconData),
      SizedBox(
        width: 10,
      ),
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
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            border: Border.all(width: 0.5),
            borderRadius: BorderRadius.circular(3),
          ),
        ),
      ),
    ],
  );
}
