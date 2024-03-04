import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store/pages/Home_page.dart';
import 'package:store/pages/cubit/HomePage_cubit/store_cubit.dart';
import 'package:store/pages/login_page.dart';
import 'package:store/pages/register_page.dart';
import 'package:store/pages/update_product_page.dart';

void main() {
  runApp(Store_app());
}

class Store_app extends StatelessWidget {
  const Store_app({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => StoreCubit(),  //  you can add multi bloc provider
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          routes: {
            HomePage.id: (context) => HomePage(),
            UpDateProductPage.id: (context) => UpDateProductPage(),
            LoginPage.id : (context)=> LoginPage(),
            RegisterPage.id : (context) => RegisterPage(),
          },
          initialRoute: LoginPage.id,
        ),
    );
  }
}
