import 'package:education_app/constants/color.dart';
import 'package:flutter/material.dart';

class SearchField extends StatelessWidget {
  const SearchField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        prefixIcon: const Icon(
          Icons.search,
          color: kPrimaryColor,
          size: 26,
        ),
        suffixIcon: const Icon(
          Icons.mic,
          color: kPrimaryColor,
          size: 26,
        ),
        floatingLabelBehavior: FloatingLabelBehavior.never,
        labelText: "Search",
        labelStyle: const TextStyle(
          color: Colors.grey,
        ),
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(35),
        ),
        isDense: true,
      ),
    );
  }
}
