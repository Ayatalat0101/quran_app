


import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:quran_gsg/screens/surahpage.dart';
import '../business_logic/injection.dart';
import '../business_logic/surah_cubit.dart';
import '../screens/splach_screen.dart';
import '../screens/surahList_screen.dart';
import '../screens/widgets/search_field.dart';

class AppRouter {
  static  Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case SplachScreen.route:
        return MaterialPageRoute(builder: (_) => SplachScreen());
      case SurahListScreen.route:
        return MaterialPageRoute(builder: (_) =>BlocProvider(
            create: (BuildContext context)=>getIt<SurahCubit>(),
            child:  SurahListScreen()
        ),);
      case SurahPage.route:
        return MaterialPageRoute(builder: (_) => SurahPage());
        default:
          return MaterialPageRoute(
              builder: (_) => Scaffold(
              body: Center(
              child: Text('No route defined for ${settings.name}'))));
    }
  }
}