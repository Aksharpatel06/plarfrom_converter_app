import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:plarfrom_converter_app/utils/global_variable.dart';

class DatePickerAdaptive extends StatelessWidget {
  const DatePickerAdaptive({super.key});

  @override
  Widget build(BuildContext context) {
    if(providertrue!.isios)
      {
        return ListTile(
          leading: Icon(Icons.calendar_month),
          onTap: () async {
            DateTime dateTime = await showDatePicker(
              context: context,
              firstDate: DateTime(1950),
              lastDate: DateTime(2050),
            ) ??
                DateTime.now();
            providerfalse!.changedate(dateTime);
          },
          title: Text('Pick Date'),
          trailing: Text(
              "${providertrue!.dateTime.day} - ${providertrue!.dateTime.month} - ${providertrue!.dateTime.year}"),
        );
      } else
        {
          return CupertinoListTile(
            padding: EdgeInsets.zero,
            leading: Icon(CupertinoIcons.calendar),
            onTap: () {
              showCupertinoModalPopup(
                context: context,
                builder: (context) {
                  return Container(
                    height: 200,
                    decoration: BoxDecoration(
                      color: providertrue!.isdark
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
            title: Text('Pick Date'),
            trailing: Text(
                "${providertrue!.dateTime.day} - ${providertrue!.dateTime.month} - ${providertrue!.dateTime.year}"),
          );
        }
  }
}
