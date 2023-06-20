import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:note/constants/color_scheme.dart';
import 'package:note/constants/constants.dart';
import 'package:note/screens/input_screen.dart';
import 'package:note/screens/pages/notes_page.dart';
import 'package:note/screens/pages/todos_page.dart';
import 'package:note/services/db_helper.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  late PageController _pageController;

  int _currentPage = 0;
  List<Map<String, dynamic>> _allData = [];

  void _refreshData() async {
    final data = await SQLHelper.getData();
    setState(() {
      _allData = data;
    });
  }

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    _refreshData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: () => _pageController.animateToPage(0,
                        duration: defaultDuration, curve: Curves.easeInOut),
                    icon: SvgPicture.asset(
                      'assets/icons/notes.svg',
                      width: 28,
                      colorFilter: ColorFilter.mode(
                          (_currentPage == 0 ? primaryColor : greyColor),
                          BlendMode.srcIn),
                    ),
                  ),
                  const SizedBox(
                    width: 56,
                  ),
                  IconButton(
                    onPressed: () => _pageController.animateToPage(1,
                        duration: defaultDuration, curve: Curves.easeInOut),
                    icon: SvgPicture.asset(
                      'assets/icons/todos.svg',
                      width: 28,
                      colorFilter: ColorFilter.mode(
                          _currentPage == 1 ? primaryColor : greyColor,
                          BlendMode.srcIn),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: PageView(
                controller: _pageController,
                onPageChanged: (index) {
                  setState(() {
                    _currentPage = index;
                  });
                },
                children: [
                  NotesPage(
                    data: _allData,
                  ),
                  TodosPage(),
                ],
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const InputScreen(),
            ),
          ).then((value) => {_refreshData()});
        },
        child: Icon(Icons.add),
        backgroundColor: primaryColor,
      ),
    );
  }
}
