import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:chat_app/Pages/Chat_page.dart';
import 'package:chat_app/Pages/register_page.dart';
import 'package:chat_app/helper/Awesome_widgets.dart';
import 'package:chat_app/widgets/custom_button.dart';
import 'package:chat_app/widgets/text_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class LoginPage extends StatefulWidget {
  static String id = 'Register';

  const LoginPage({Key? key}) : super(key: key);
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isloading = false;
  String? email, password;

  GlobalKey<FormState> fromkey = GlobalKey();

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
                      height: 29,
                    ),
                    CustomButton(
                        onTap: () async {
                          if (fromkey.currentState!.validate()) {
                            isloading = true;
                            setState(() {});
                            try {
                              await Login_User();
                              // ignore: use_build_context_synchronously
                              Navigator.pushNamed(context, ChatPage.id , arguments: email);
                            } on FirebaseAuthException catch (e) {
                              if (e.code ==
                                      'The supplied auth credential is incorrect, malformed or has expired ' ||
                                  e.code ==
                                      'Logging in as with empty reCAPTCHA token') {
                                // ignore: use_build_context_synchronously
                                Awesome_widgets(context, DialogType.error,
                                    'ERROR', 'the account is incorrect');
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
        ));
  }

  // ignore: non_constant_identifier_names
  Future<void> Login_User() async {
    // ignore: unused_local_variable
    UserCredential user = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email!, password: password!);
  }
}
