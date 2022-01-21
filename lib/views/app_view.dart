import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'home/home_screen.dart';

class AppView extends StatelessWidget {
  const AppView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/home',
      theme: ThemeData.light().copyWith(
        primaryColor: Colors.orange,
      ),
      routes: {
        '/home': (context) => const HomeScreen(),
      },
    );
  }
}
