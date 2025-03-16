import 'package:flutter/material.dart';

Widget mainDivider(context,{required String text}) {
  return SliverToBoxAdapter(
    child: SizedBox(
      // height: 50,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Left Line
            // Expanded(
            //   child: Container(
            //     margin: const EdgeInsets.only(right: 8.0),
            //     height: 1, // Thickness of the line
            //     color: Colors.white,
            //   ),
            // ),

            // Text
            Text(
              text,
              style: TextStyle(
              color: (Theme.of(context).brightness == Brightness.dark)
                  ? Color.fromARGB(255, 166, 157, 157)
                  : Colors.black54,
              letterSpacing: 2.5,
              fontSize: 15,
              fontWeight: FontWeight.w900),
            ),

            // Right Line
            Expanded(
              child: Container(
                margin: const EdgeInsets.only(left: 8.0),
                height: 1, // Thickness of the line
                color: const Color.fromARGB(106, 255, 255, 255),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

Widget mainDividerclean(String text, context) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // Left Line
        // Expanded(
        //   child: Container(
        //     margin: const EdgeInsets.only(right: 8.0),
        //     height: 1, // Thickness of the line
        //     color: Colors.white,
        //   ),
        // ),

        // Text
        Text(
          text,
          style: TextStyle(
              color: (Theme.of(context).brightness == Brightness.dark)
                  ? Color.fromARGB(255, 166, 157, 157)
                  : Colors.black54,
              letterSpacing: 2.5,
              fontSize: 15,
              fontWeight: FontWeight.w900),
        ),

        // Right Line
        Expanded(
          child: Container(
            margin: const EdgeInsets.only(left: 8.0),
            height: 1, // Thickness of the line
            color: (Theme.of(context).brightness == Brightness.dark)
                ? Color.fromARGB(106, 255, 255, 255)
                : Colors.black54,
          ),
        ),
      ],
    ),
  );
}
