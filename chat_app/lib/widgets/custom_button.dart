import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomButton extends StatelessWidget {
  // ignore: non_constant_identifier_names
  CustomButton({Key? key,  required this.onTap,  required this.Name}) : super(key: key);
  // ignore: non_constant_identifier_names
  String? Name;
  VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap ,
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
        width: double.infinity,
        height: 60,
        child: Center(
          child: Text(
            '$Name',
            style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
