import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:plarfrom_converter_app/utils/global_variable.dart';
import 'package:provider/provider.dart';

import '../provider/screen_provider.dart';

class CallImageAdaptive extends StatelessWidget {
  const CallImageAdaptive({super.key});

  @override
  Widget build(BuildContext context) {
    providerfalse = Provider.of<PlatfromProvider>(context, listen: false);
    providertrue = Provider.of<PlatfromProvider>(context, listen: true);
    if (providertrue!.isios) {
      return InkWell(
        onTap: () {
          providerfalse!.setImage();
        },
        child: (providertrue!.imgpath != null)
            ? CircleAvatar(
                radius: 60,
                backgroundImage: FileImage(providertrue!.imgpath!))
            : CircleAvatar(
                radius: 60,
                backgroundImage: AssetImage('asset/img/camera.png')),
      );
    } else {
      return CupertinoButton(
        onPressed: () {
          providerfalse!.setImage();
        },
        child: (providertrue!.imgpath != null)
            ? CircleAvatar(
                radius: 60, backgroundImage: FileImage(providertrue!.imgpath!))
            : CircleAvatar(
                radius: 60,
                backgroundImage: AssetImage('asset/img/camera.png')),
      );
    }
  }
}
