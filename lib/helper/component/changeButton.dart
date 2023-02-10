

import 'package:flutter/material.dart';
import '../../constant.dart';

class ChangeButton extends StatelessWidget {
  const ChangeButton({Key? key, required this.visible, required this.icon, required this.onPressed}) : super(key: key);
   final bool visible;
  final IconData icon;
 final Function() onPressed;
  @override
  Visibility build(BuildContext context) {
    return   Visibility(child: IconButton(onPressed:onPressed,
        icon: Icon(icon ,size:40,color:kSubTextColor)),
      visible:visible ,
    );
  }
}
