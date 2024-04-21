import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:homehero/pages/homepage.dart';
import 'package:homehero/pages/register_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();

  bool _loading = false;

  @override
  Widget build(BuildContext context) {
    Size screen = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: screen.width,
          height: screen.height,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/bg.png"), fit: BoxFit.cover)),
          child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
            SizedBox(
              height: screen.height * 0.05,
            ),
            SizedBox(
              height: 200,
              child: Image.asset(
                'assets/logo.png',
              ),
            ),
            SizedBox(
              height: 50,
              child: Text(
                "HOMEHERO",
                style: GoogleFonts.jomhuria(
                    textStyle: const TextStyle(
                        height: 0.1,
                        color: Colors.white,
                        decoration: TextDecoration.none,
                        fontSize: 98,
                        shadows: [
                      Shadow(
                          // bottomLeft
                          offset: Offset(-1.5, -1.5),
                          color: Colors.black),
                      Shadow(
                          // bottomRight
                          offset: Offset(1.5, -1.5),
                          color: Colors.black),
                      Shadow(
                          // topRight
                          offset: Offset(1.5, 1.5),
                          color: Colors.black),
                      Shadow(
                          // topLeft
                          offset: Offset(-1.5, 1.5),
                          color: Colors.black),
                    ])),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              child: Text(
                "Clean homes, fresh lives with HomeHero",
                style: GoogleFonts.jomhuria(
                    textStyle: const TextStyle(
                        height: 0,
                        color: Colors.white,
                        decoration: TextDecoration.none,
                        fontSize: 33)),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: screen.height * 0.1,
            ),
            Container(
                padding: EdgeInsets.all(22),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                width: screen.width * 0.8,
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("email",
                          style: GoogleFonts.aBeeZee(
                              textStyle: const TextStyle(
                                  color: Colors.black,
                                  decoration: TextDecoration.none,
                                  fontSize: 18))),
                      Container(
                        margin: const EdgeInsets.all(8),
                        padding: const EdgeInsets.only(left: 12, right: 12),
                        width: screen.width * 0.8,
                        decoration: const BoxDecoration(
                            color: Color(0x66FFAF65),
                            borderRadius:
                                BorderRadius.all(Radius.circular(12))),
                        child: TextFormField(
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                          ),
                          controller: email,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your email';
                            }
                            return null;
                          },
                        ),
                      ),
                      Text("password",
                          style: GoogleFonts.aBeeZee(
                              textStyle: const TextStyle(
                                  color: Colors.black,
                                  decoration: TextDecoration.none,
                                  fontSize: 22))),
                      Container(
                        margin: const EdgeInsets.all(8),
                        padding: const EdgeInsets.only(left: 12, right: 12),
                        width: screen.width * 0.8,
                        decoration: const BoxDecoration(
                            color: Color(0x66FFAF65),
                            borderRadius:
                                BorderRadius.all(Radius.circular(12))),
                        child: TextFormField(
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                          ),
                          controller: password,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your password';
                            }
                            return null;
                          },
                        ),
                      ),
                    ],
                  ),
                )),
            SizedBox(
              height: screen.height * 0.05,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFFFAF65)),
              onPressed: () async {
                if (_formKey.currentState!.validate()) {
                  setState(() {
                    _loading = true;
                  });
                  BuildContext dialogContext = context;
                  String isLogin = "";
                  try {
                    await FirebaseAuth.instance.signInWithEmailAndPassword(
                        email: email.text, password: password.text);
                    isLogin = "successful";
                  } on FirebaseAuthException catch (e) {
                    if (e.code == 'user-not-found') {
                      isLogin = "No user found for that email.";
                    } else if (e.code == 'wrong-password') {
                      isLogin = "Wrong password provided for that user.";
                    }
                    isLogin = 'Error: ${e.message}';
                  }

                  setState(() {
                    _loading = false;
                  });
                  if (isLogin == "successful") {
                    // ignore: use_build_context_synchronously
                    Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute<void>(
                            builder: (BuildContext context) =>
                                const HomePage()),
                        ModalRoute.withName('/'));
                  } else {
                    // ignore: use_build_context_synchronously
                    await showDialog(
                        context: dialogContext,
                        builder: (BuildContext dialogContext) {
                          return AlertDialog(
                            title: const Text('Error Something was wrong'),
                            content: Text(isLogin),
                            actions: <Widget>[
                              TextButton(
                                child: const Text('Ok'),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                              ),
                            ],
                          );
                        });
                  }
                }
              },
              child: _loading
                  ? const CircularProgressIndicator()
                  : Text('SIGN UP',
                      style: GoogleFonts.aBeeZee(
                          textStyle: const TextStyle(
                              color: Colors.black,
                              decoration: TextDecoration.none,
                              fontSize: 22))),
            ),
            TextButton(
                onPressed: () {
                  Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute<void>(
                          builder: (BuildContext context) =>
                              const RegisterPage()),
                      ModalRoute.withName('/'));
                },
                child: const Text(
                  "If you don’t have an account ? Register",
                  style: TextStyle(color: Colors.red),
                ))
          ]),
        ),
      ),
    );
  }
}
