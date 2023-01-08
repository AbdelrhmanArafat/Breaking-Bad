// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class CustomDivider extends StatelessWidget {
  double endIndent;
  CustomDivider({
    Key? key,
    required this.endIndent,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Divider(
      height: 30,
      endIndent: endIndent,
      color: Colors.indigo,
      thickness: 2,
    );
  }
}
