import 'package:flutter/material.dart';
import 'package:note/constants/color_scheme.dart';

class NoteCard extends StatelessWidget {
  const NoteCard({super.key, required this.index});

  final int index;

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
            'Title',
            style: TextStyle(
                fontSize: 16,
                color: lightGreyColor,
                fontWeight: FontWeight.w600),
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            index % 2 == 0
                ? 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Non nunc ultricies amet viverra massa urna aenean dolor etiam. Lorem ipsum dolor sit amet, consectetur adipiscing elit.  Lorem ipsum dolor sit amet, consectetur adipiscing elit.'
                : 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Non nun .',
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
            'May 31 2023',
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
