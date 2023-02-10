import 'package:flutter/material.dart';
import '../../constant.dart';

class KSliverAppBar extends StatelessWidget {
  const KSliverAppBar({Key? key, required this.text, required this.fixedText,this.leading})
      : super(key: key);
  final String text;
  final String fixedText;
  final Widget ?leading;
  @override
  SliverAppBar build(BuildContext context) {
    bool? pinned = true;
    bool? snap = false;
    bool? floating = false;
    return SliverAppBar(
      automaticallyImplyLeading: false,
      backgroundColor: kMainColor,
      pinned: pinned,
      snap: snap,
      leading:leading,
      floating: floating,
      expandedHeight: 140,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        background: Padding(
          padding: const EdgeInsets.only(bottom:13),
          child: Center(
              child: Text(
            text,
            style: kMainTextStyle.copyWith(fontFamily:'main',
            fontSize:52,
            ),
          )),
        ),
          titlePadding:EdgeInsets.only(top:3),
          title: Text(
            textAlign:TextAlign.center,
          fixedText.trim(),
          style: kMainTextStyle,
        ),
      ),
    );
  }
}
