
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

final baseUrl ='assets/quran.json';
  Color kMainColor =Color(0xff14232A);
  TextStyle kMainTextStyle = TextStyle(
      fontSize:34.0 ,
     fontFamily: 'title',
     fontWeight:  FontWeight.normal,
      foreground: Paint()..shader = LinearGradient(
        colors: <Color>[
          Color(0xff00A3AB),
          Color(0xff5FD3D1),
          Color(0xff02A7AD),
          Color(0xff73BAC2),
          Color(0xff0283A3),
          Color(0xff0493AB),
          Color(0xff047285),
          //add more color here.
        ],
      ).createShader(Rect.fromLTWH(0.0, 0.0, 200.0, 100.0))
  );
  TextStyle kSecandTextStyle=TextStyle(
      fontSize:  30.0 ,
      fontFamily: 'secondary',
      fontWeight:  FontWeight.w500,
      color:Colors.black
  );
TextStyle ksubTextStyle =
TextStyle(
    fontSize:14.0 ,
    fontWeight:  FontWeight.normal,
    color:Colors.grey[800],
);

Color kSubTextColor = Color(0xff00A3AB);

double arabicFontSize=28;
double mushafFontSize=40;
Future saveSettings ()async{
  final pref=await SharedPreferences.getInstance();
   await pref.setInt("arabicFontSize",arabicFontSize.toInt());
   await pref.setInt("mushafFontSize",mushafFontSize.toInt());

}

Future getSettings ()async{
  try {
    final pref = await SharedPreferences.getInstance();
    arabicFontSize = await pref.getInt("arabicFontSize")!.toDouble();
    mushafFontSize= await pref.getInt("mushafFontSize")!.toDouble();
  } catch(_) {
    arabicFontSize =28;
    mushafFontSize =40;
  }
}