import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  const ButtonWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (Platform.isIOS) {
      return CupertinoButton(
        child: Text('iOS'),
        onPressed: () {},
      );
    }
    return ElevatedButton(
      onPressed: () {},
      child: Text('Android'),
    );
  }
}
