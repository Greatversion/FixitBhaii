import 'package:fixitbhai/new/example_data.dart';
import 'package:flutter/material.dart';

class HeaderClip extends StatelessWidget {
  const HeaderClip({
    Key? key,
    required this.data,
    required this.context,
  }) : super(key: key);

  final PageData data;
  final BuildContext context;

  @override
  Widget build(BuildContext _) {
    // final textTheme = Theme.of(context).textTheme;
    return Image.asset("assets/images/pp.jpg");
  }
}
