import 'package:flutter/material.dart';

class EmptyWidget extends StatelessWidget {
  const EmptyWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Tiada Rekod.',
        style: TextStyle(color: Colors.redAccent, fontSize: 20),
      ),
    );
  }
}
