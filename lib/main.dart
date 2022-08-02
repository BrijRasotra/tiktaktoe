import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tik_tak/Screens/splash%20screen.dart';
import 'package:tik_tak/provider/tiktakprovider.dart';

import 'Screens/homepage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context)=>TikTakProvider(),
      child: MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      home:  SplashScreen(),
      ),
    );
  }
}
