import 'package:arabic_numbers/arabic_numbers.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:quran_gsg/data_layer/surah.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../constant.dart';
import '../helper/component/changeButton.dart';
import '../helper/component/sliverApp_bar.dart';

class SurahPage extends StatefulWidget {
  SurahPage({Key? key, this.pageNum, this.surahList}) : super(key: key);
  late int ? pageNum;
  static const route = "/SurahPage";
  final List<Surahs>? surahList;

  @override
  State<SurahPage> createState() => _SurahPageState();
}

class _SurahPageState extends State<SurahPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return NestedScrollView(
      headerSliverBuilder: (context, innerBoxIsScroll) => [
        KSliverAppBar(
          text: 'c',
          fixedText: '${widget.surahList![widget.pageNum!].name}',
          leading: const BackButton(
            color: Color(0xff00A3AB),
          ),
        ),
      ],
      body: Scaffold(
        bottomNavigationBar: BottomAppBar(
          color: kMainColor,
          child: SizedBox(
            width: double.infinity,
            height: 50,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ChangeButton(
                  visible: widget.pageNum != 113,
                  icon: Icons.navigate_before,
                  onPressed: () {
                    setState(() {

                        widget.pageNum = (widget.pageNum! + 1);

                    });
                  },
                ),
                ChangeButton(
                    visible: widget.pageNum != 0,
                    icon: Icons.navigate_next,
                    onPressed: () {
                      setState(() {
                          widget.pageNum = widget.pageNum! - 1;

                      });
                    }),
              ],
            ),
          ),
        ),
        body: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemBuilder: (context, index) => PageItemBulider(
                  widget: widget,
                ),
                itemCount: 1,
              ),
            ),
          ],
        ),
      ),
    );
  }

}

class PageItemBulider extends StatelessWidget {
  PageItemBulider({
    super.key,
    required this.widget,
  });
  late List<String> ? _list;
  final SurahPage widget;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 10,
        right: 10,
        bottom: 5,
      ),
      child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
        RichText(
          text: TextSpan(text: ''.trim(), children: <InlineSpan>[
            for (var i = 0;
                i < widget.surahList![widget.pageNum!].ayahs!.length;
                i++) ...{

              TextSpan(
                text: '${widget.surahList![widget.pageNum!].ayahs![i].text}'
                    .trim(),
                /* recognizer: LongPressGestureRecognizer().onLongPress=saveBookMark(widget.pageNum,i),*/
                style: kSecandTextStyle.copyWith(
                  fontSize:arabicFontSize,
                ),
              ),
              TextSpan(text:"\uFD3F"+ArabicNumbers().convert(i+1).toString()+"\uFD3E",
                  style:TextStyle(
                    color:Color.fromARGB(255,0,0,0),
                    fontSize:arabicFontSize,
                    shadows: [
                      Shadow(
                        offset:Offset(.5,.5),
                        blurRadius:1.0,
                        color:Color(0xff00A3AB)
                      ),
                    ]
                  )
              ),
            }
          ]),
          textDirection: TextDirection.rtl,
        ),
      ]),
    );
  }
  saveBookMark(surah,ayah)async{
    final pref=await SharedPreferences.getInstance();
    await pref.setInt("surah",surah);
    await pref.setInt("ayah",ayah);
    print("bookmark");
  }
}
//todo:bookmark,
//todo:search
//todo:basmall