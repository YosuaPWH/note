import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:note/constants/color_scheme.dart';
import 'package:note/services/db_helper.dart';
import 'package:note/widgets/note_card.dart';
import 'package:note/widgets/search_input.dart';

class NotesPage extends StatefulWidget {
  const NotesPage({Key? key, required this.data}) : super(key: key);

  final List<Map<String, dynamic>> data;

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
    log(DateTime.now().timeZoneName);
    return Column(
      children: [
        SearchInput(
          controller: _inputSearch,
          hint: 'Search Notes...',
        ),
        Expanded(
          child: MasonryGridView.count(
            crossAxisCount: 2,
            mainAxisSpacing: 12,
            crossAxisSpacing: 12,
            itemCount: widget.data.length,
            padding: const EdgeInsets.all(16),
            itemBuilder: (context, index) {
              return NoteCard(
                index: index,
                data: widget.data,
              );
            },
          ),
        )
      ],
    );
  }
}
