import 'package:flutter/material.dart';
import 'package:tunerplus/modules/views/tuner/page.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Tuner plus',
      debugShowCheckedModeBanner: false,
      home: TunerPage(),
    );
  }
}
