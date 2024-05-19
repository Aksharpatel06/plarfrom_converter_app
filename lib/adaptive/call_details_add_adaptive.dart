import 'package:flutter/material.dart';
import 'package:plarfrom_converter_app/adaptive/time_picker_adaptive.dart';
import 'package:plarfrom_converter_app/utils/global_variable.dart';
import 'package:provider/provider.dart';

import '../provider/screen_provider.dart';
import 'call_field_adaptive.dart';
import 'call_image_adaptive.dart';
import 'call_save_adaptive.dart';
import 'date_picker_adaptive.dart';

class CallDetailsAddScreenAdapatiev extends StatelessWidget {
  const CallDetailsAddScreenAdapatiev({super.key});

  @override
  Widget build(BuildContext context) {

    providerfalse = Provider.of<PlatfromProvider>(context, listen: false);
    providertrue = Provider.of<PlatfromProvider>(context, listen: true);

    if(providertrue!.isios)
      {
        return const Padding(
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CallImageAdaptive(),
                CallFieldAdaptive(),
                DatePickerAdaptive(),
                TimePickerAdaptive(),
                CallSaveAdaptive(),
              ],
            ),
          ),
        );
      }else{
      return const Padding(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CallImageAdaptive(),
              CallFieldAdaptive(),
              SizedBox(
                height: 20,
              ),
              DatePickerAdaptive(),
              SizedBox(
                height: 20,
              ),
              TimePickerAdaptive(),
              CallSaveAdaptive(),
            ],
          ),
        ),
      );
    }
  }
}
