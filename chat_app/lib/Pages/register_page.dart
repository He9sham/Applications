import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:chat_app/Pages/Chat_page.dart';
import 'package:chat_app/helper/Awesome_widgets.dart';
import 'package:chat_app/widgets/custom_button.dart';
import 'package:chat_app/widgets/text_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class RegisterPage extends StatefulWidget {
  static String id = 'Registerpage';

  const RegisterPage({Key? key}) : super(key: key);
  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  String? email;

  String? password, Phone;

  GlobalKey<FormState> fromkey = GlobalKey();

  bool isloading = false;

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isloading,
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(8),
          child: Form(
            key: fromkey,
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
                  CustomTextField(
                      onchanged: (data) {
                        email = data;
                      },
                      name: 'Email'),
                  const SizedBox(
                    height: 11,
                  ),
                  CustomTextField(
                      obscuretext: true,
                      onchanged: (data) {
                        password = data;
                      },
                      name: 'Password'),
                  const SizedBox(
                    height: 28,
                  ),
                  CustomButton(
                      onTap: () async {
                        if (fromkey.currentState!.validate()) {
                          isloading = true;
                          setState(() {});
                          try {
                            await Register_User();
                            // ignore: use_build_context_synchronously
                            Navigator.pushNamed(
                              context,
                              ChatPage.id,
                              arguments: email,
                            );
                          } on FirebaseAuthException catch (e) {
                            if (e.code == 'email-already-in-use') {
                              // ignore: use_build_context_synchronously
                              Awesome_widgets(context, DialogType.error,
                                  'ERROR', 'the account already is used');
                            }
                          } catch (e) {
                            // ignore: use_build_context_synchronously
                            Awesome_widgets(
                                context,
                                DialogType.warning,
                                'Warning',
                                'An error occurred, please try again later');
                          }
                          isloading = false;
                          setState(() {});
                        }
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
      ),
    );
  }

  // ignore: non_constant_identifier_names
  Future<void> Register_User() async {
    // ignore: unused_local_variable
    UserCredential user = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email!, password: password!);
  }
}
