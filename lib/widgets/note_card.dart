import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:note/constants/color_scheme.dart';

class NoteCard extends StatelessWidget {
  const NoteCard({super.key, required this.index, required this.data});

  final int index;
  final List<Map<String, dynamic>> data;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
          color: greyColor, borderRadius: BorderRadius.circular(16)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            data[index]['title'],
            style: TextStyle(
                fontSize: 16,
                color: lightGreyColor,
                fontWeight: FontWeight.w600),
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            data[index]['desc'],
            maxLines: 7,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontSize: 12,
              color: lightGreyColor,
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            data[index]['createdAt'],
            style: TextStyle(
              fontSize: 12,
              color: lightGreyColor,
            ),
          ),
        ],
      ),
    );
  }
}
