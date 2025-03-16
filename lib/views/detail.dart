import 'package:carousel_slider/carousel_slider.dart';
import 'package:fixitbhai/utils/reusable_widgets/divider.dart';
import 'package:flutter/material.dart';

class Detail extends StatefulWidget {
  const Detail({super.key});

  @override
  State<Detail> createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text("Detail"),
    );
  }
}
