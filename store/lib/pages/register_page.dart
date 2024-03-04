import 'package:flutter/material.dart';
import 'package:store/pages/Home_page.dart';
import 'package:store/widgets/Custom_Button.dart';
import 'package:store/widgets/Custome_TextField.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});
  static String id = 'Registerpage';
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
                      'Register',
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
                  height: 28,
                ),
                CustomButton(
                    onTap: () {
                      Navigator.pushNamed(context, HomePage.id);
                    },
                    Name: 'Register'),
                const SizedBox(
                  height: 17,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('already have an account !'),
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: const Text('   Login'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
