import 'package:flutter/material.dart';
import 'package:note/constants/color_scheme.dart';
import 'package:note/services/db_helper.dart';

class InputScreen extends StatefulWidget {
  const InputScreen({Key? key}) : super(key: key);

  @override
  State createState() => _InputScreenState();
}

class _InputScreenState extends State<InputScreen> {
  TextEditingController _titleController = TextEditingController();
  TextEditingController _descriptionController = TextEditingController();

  Future<void> _addData(BuildContext context) async {
    if (_titleController.text.isEmpty && _descriptionController.text.isEmpty) {
      Navigator.pop(context);
    } else {
      await SQLHelper.createData(
          _titleController.text, _descriptionController.text);
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(
            color: whiteColor,
          ),
          title: const Text(
            'New Note',
            style: TextStyle(color: whiteColor),
          ),
          centerTitle: true,
          backgroundColor: darkGreyColor,
          actions: <Widget>[
            IconButton(
              onPressed: () {
                _addData(context);
              },
              icon: Icon(
                Icons.done,
              ),
            )
          ],
        ),
        body: Scaffold(
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 8,
                  vertical: 16,
                ),
                child: TextFormField(
                  controller: _titleController,
                  decoration: const InputDecoration(
                    border: UnderlineInputBorder(
                      borderSide: BorderSide(color: whiteColor),
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: whiteColor),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: whiteColor),
                    ),
                    labelText: 'Title',
                    labelStyle: TextStyle(color: whiteColor),
                  ),
                  style: TextStyle(color: whiteColor),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 8,
                  vertical: 16,
                ),
                child: TextFormField(
                  controller: _descriptionController,
                  keyboardType: TextInputType.multiline,
                  maxLines: null,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    labelText: 'Description',
                    labelStyle: TextStyle(color: whiteColor),
                  ),
                  style: TextStyle(color: whiteColor),
                ),
              )
            ],
          ),
        ));
  }
}
