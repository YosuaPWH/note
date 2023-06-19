import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:note/constants/color_scheme.dart';
import 'package:note/widgets/note_card.dart';
import 'package:note/widgets/search_input.dart';

class NotesPage extends StatefulWidget {
  const NotesPage({super.key});

  @override
  State<NotesPage> createState() => _NotesPageState();
}

class _NotesPageState extends State<NotesPage> {
  late TextEditingController _inputSearch;

  @override
  void initState() {
    super.initState();
    _inputSearch = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SearchInput(
          controller: _inputSearch,
          hint: 'Search Notes...',
          onChanged: (query) {
            log('search: $query');
          },
        ),
        Expanded(
          child: MasonryGridView.count(
            crossAxisCount: 2,
            mainAxisSpacing: 12,
            crossAxisSpacing: 12,
            itemCount: 4,
            padding: const EdgeInsets.all(16),
            itemBuilder: (context, index) {
              return NoteCard(
                index: index,
              );
            },
          ),
        )
      ],
    );
  }
}
