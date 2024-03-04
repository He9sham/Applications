import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:weather_app/Cubits/weather_cubit/weather_cubit.dart';
import 'package:weather_app/widget/search_widget.dart';

String? cityname;

// ignore: must_be_immutable, camel_case_types
class Search_page extends StatelessWidget {
  const Search_page({super.key});

  static String id = 'search page';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: const Text(
          'Search a City',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: const Center(
        child: SearchWidget(),
      ),
    );
  }
}
