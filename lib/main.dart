import 'package:flutter/material.dart';
import 'package:quran_gsg/screens/splach_screen.dart';
import 'business_logic/injection.dart';
import 'helper/route.dart';
void main() {
  InitGetIt();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return  const MaterialApp(
      debugShowCheckedModeBanner:false,
      onGenerateRoute:AppRouter.generateRoute,
      initialRoute:     SplachScreen.route,
    );
  }
}


