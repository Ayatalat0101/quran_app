import 'package:flutter/material.dart';
import 'package:quran_gsg/screens/surahList_screen.dart';
import '../constant.dart';



class SplachScreen extends StatelessWidget {
  static const route='/SplachScreen';
  const SplachScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds:3),(){
      Navigator.pushNamed(context,SurahListScreen.route);
    });
    return Scaffold(
      body: SafeArea(
        child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          Column(
            children: [
              Center(
                  child: Text(
                'c',
                style: TextStyle(
                    fontSize: 80.0,
                    fontWeight: FontWeight.normal,
                    fontFamily: 'main',
                    foreground: Paint()
                      ..shader = const LinearGradient(
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
                      ).createShader(const Rect.fromLTWH(0.0, 0.0, 200.0, 100.0),
                      ),
                ),
              ),
              ),
              Text(
                "Quran".trim(),
                style: kMainTextStyle,
              ),
            ],
          ),
          Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: const [
            Tab(
              icon: Icon(
                Icons.chrome_reader_mode_outlined,
                size: 40,
                color: Color(0xff047285),
              ),
              text: 'QURAN',
            ),
            Tab(
              icon: Icon(Icons.play_arrow, color: Color(0xff047285), size: 40),
              text: 'CONTINUE',
            ),
            Tab(
              icon: Icon(
                Icons.lightbulb,
                color: Color(0xff047285),
                size: 40,
              ),
              text: 'DISCOVER',
            ),
          ]),
        ]),
      ),
    );
  }
}
