import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:plarfrom_converter_app/utils/global_variable.dart';
import 'package:provider/provider.dart';

import '../provider/profile_provider.dart';
import '../provider/screen_provider.dart';

class DatePickerAdaptive extends StatelessWidget {
  const DatePickerAdaptive({super.key});

  @override
  Widget build(BuildContext context) {
    providerfalse = Provider.of<PlatfromProvider>(context, listen: false);
    providertrue = Provider.of<PlatfromProvider>(context, listen: true);

    profileProviderfalse = Provider.of<ProfileProvider>(context, listen: false);
    profileProvidertrue = Provider.of<ProfileProvider>(context, listen: true);
    if(providertrue!.isios)
      {
        return ListTile(
          leading: const Icon(Icons.calendar_month),
          onTap: () async {
            DateTime dateTime = await showDatePicker(
              context: context,
              firstDate: DateTime(1950),
              lastDate: DateTime(2050),
            ) ??
                DateTime.now();
            providerfalse!.changedate(dateTime);
          },
          title: const Text('Pick Date'),
          trailing: Text(
              "${providertrue!.dateTime.day} - ${providertrue!.dateTime.month} - ${providertrue!.dateTime.year}"),
        );
      } else
        {
          return CupertinoListTile(
            padding: EdgeInsets.zero,
            leading: const Icon(CupertinoIcons.calendar),
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
                      mode: CupertinoDatePickerMode.date,
                      onDateTimeChanged: (value) {
                        providerfalse!.changedate(value);
                      },
                    ),
                  );
                },
              );
            },
            title: const Text('Pick Date'),
            trailing: Text(
                "${providertrue!.dateTime.day} - ${providertrue!.dateTime.month} - ${providertrue!.dateTime.year}"),
          );
        }
  }
}
