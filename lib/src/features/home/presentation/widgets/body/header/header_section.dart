import 'package:flutter/material.dart';

class HeaderSection extends StatelessWidget {
  final String title;
  final Color dividerColor;
  const HeaderSection(
      {super.key, required this.title, required this.dividerColor});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 10.0,
          width: 55,
          child: Divider(
            color: dividerColor,
            thickness: 3,
          ),
        ),
      ],
    );
  }
}
