import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:note/constants/color_scheme.dart';
import 'package:note/widgets/search_input.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class TodosPage extends StatefulWidget {
  const TodosPage({super.key});

  @override
  State<TodosPage> createState() => _TodosPageState();
}

class _TodosPageState extends State<TodosPage> {
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
          child: ListView.separated(
              padding: const EdgeInsets.all(16),
              itemBuilder: (context, index) => Slidable(
                    key: ValueKey(index),
                    endActionPane: ActionPane(
                      extentRatio: 0.18,
                      motion: ScrollMotion(),
                      children: [
                        Container(
                          height: 50,
                          width: 50,
                          margin: const EdgeInsets.only(left: 8),
                          decoration: BoxDecoration(
                            color: dangerColor,
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(14),
                            child: SvgPicture.asset('assets/icons/trash.svg'),
                          ),
                        )
                      ],
                    ),
                    child: Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: greyColor,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Row(
                        children: [
                          SvgPicture.asset('assets/icons/circle.svg'),
                          const SizedBox(
                            width: 16,
                          ),
                          Expanded(
                            child: Text(
                              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Non nun .',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontSize: 16,
                                color: whiteColor,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
              separatorBuilder: (context, index) => const SizedBox(
                    height: 8,
                  ),
              itemCount: 4),
        ),
      ],
    );
  }
}
