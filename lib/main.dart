import 'package:flutter/material.dart';
import 'package:plarfrom_converter_app/adaptive/adaptive.dart';
import 'package:provider/provider.dart';

import 'provider/screen_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      ChangeNotifierProvider(
        create: (context) => PlatfromProvider(),
      )
    ], child: AdaptiveWidget());
  }
}
