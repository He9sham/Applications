import 'package:flutter/material.dart';
import 'package:store/pages/Home_page.dart';
import 'package:store/pages/register_page.dart';
import 'package:store/widgets/Custom_Button.dart';
import 'package:store/widgets/Custome_TextField.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});
  static String id = 'login page';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: Form(
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                  height: 70,
                ),
                Image.asset('assets/images/scholar.png'),
                const Text(
                  'Scholar Chat',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Pacifico'),
                ),
                const SizedBox(
                  height: 70,
                ),
                const Row(
                  children: [
                    Text(
                      'LOGIN',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 13,
                ),
                CustomTextField(onchanged: (data) {}, name: 'Email'),
                const SizedBox(
                  height: 11,
                ),
                CustomTextField(
                    obscuretext: true, onchanged: (data) {}, name: 'Password'),
                const SizedBox(
                  height: 29,
                ),
                CustomButton(
                    onTap: () {
                      Navigator.pushNamed(context, HomePage.id);
                    },
                    Name: 'LOGIN'),
                const SizedBox(
                  height: 17,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('don`t have an account?'),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, RegisterPage.id);
                      },
                      child: const Text('   Register'),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
