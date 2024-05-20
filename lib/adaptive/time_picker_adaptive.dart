import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:plarfrom_converter_app/utils/global_variable.dart';
import 'package:provider/provider.dart';

import '../provider/profile_provider.dart';
import '../provider/screen_provider.dart';

class TimePickerAdaptive extends StatelessWidget {
  const TimePickerAdaptive({super.key});

  @override
  Widget build(BuildContext context) {
    providerfalse = Provider.of<PlatfromProvider>(context, listen: false);
    providertrue = Provider.of<PlatfromProvider>(context, listen: true);

    profileProviderfalse = Provider.of<ProfileProvider>(context, listen: false);
    profileProvidertrue = Provider.of<ProfileProvider>(context, listen: true);
    if (providertrue!.isios) {
      return ListTile(
        leading: const Icon(Icons.access_time),
        onTap: () async {
          TimeOfDay timeOfDay = await showTimePicker(
                context: context,
                initialTime: TimeOfDay.now(),
              ) ??
              TimeOfDay.now();
          providerfalse!.changetime(timeOfDay);
        },
        title: const Text('Pick Time'),
        trailing: Text(
            "${providertrue!.timeOfDay.hour} : ${providertrue!.timeOfDay.minute}"),
      );
    } else {
      return CupertinoListTile(
        padding: EdgeInsets.zero,
        leading: const Icon(CupertinoIcons.time),
        onTap: () {
          showCupertinoModalPopup(
            context: context,
            builder: (context) {
              return Container(
                  height: 200,
                  decoration: BoxDecoration(
                    color: profileProvidertrue!.isdark
                        ? CupertinoColors.white
                        : CupertinoColors.black,
                  ),
                  child: CupertinoDatePicker(
                    onDateTimeChanged: (value) {
                      providerfalse!.changeCupertinotime(value);
                    },
                    mode: CupertinoDatePickerMode.time,
                  ));
            },
          );
        },
        title: const Text('Pick Time'),
        trailing: Text(
            "${providertrue!.timeOfDay.hour} - ${providertrue!.timeOfDay.minute}"),
      );
    }
  }
}
