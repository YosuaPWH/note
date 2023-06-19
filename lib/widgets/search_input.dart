import 'package:flutter/material.dart';
import 'package:note/constants/color_scheme.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SearchInput extends StatelessWidget {
  const SearchInput(
      {Key? key, required this.controller, required this.hint, this.onChanged})
      : super(key: key);

  final TextEditingController controller;
  final String hint;
  final Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: TextFormField(
        controller: controller,
        style: TextStyle(
          color: lightGreyColor,
        ),
        onChanged: onChanged,
        textInputAction: TextInputAction.search,
        decoration: InputDecoration(
          isDense: true,
          hintText: hint,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(36),
            borderSide: BorderSide(
              width: 100,
            ),
          ),
          hintStyle: TextStyle(color: whiteColor),
          prefixIcon: Padding(
            padding: const EdgeInsets.all(12),
            child: SvgPicture.asset(
              'assets/icons/search.svg',
              color: lightGreyColor,
            ),
          ),
          fillColor: greyColor,
          filled: true,
        ),
      ),
    );
  }
}
