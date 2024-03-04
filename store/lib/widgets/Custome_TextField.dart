import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomTextField extends StatelessWidget {
  CustomTextField(
      {Key? key,
      required this.name,
      required this.onchanged,
      this.obscuretext = false,
      @required this.keyboardtype})
      : super(key: key);
  String? name;
  Function(String)? onchanged;
  bool obscuretext;
  TextInputType? keyboardtype;
  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: keyboardtype,
      obscureText: obscuretext,
      // ignore: body_might_complete_normally_nullable
      onChanged: onchanged,
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        hintText: name,
      ),
    );
  }
}
