import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:homehero/pages/landingpage.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController name = TextEditingController();
  final TextEditingController phone = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

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
            Container(
                padding: const EdgeInsets.all(22),
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                width: screen.width * 0.9,
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Name",
                        style: GoogleFonts.aBeeZee(
                            textStyle: const TextStyle(
                                color: Colors.black,
                                decoration: TextDecoration.none,
                                fontSize: 16)),
                      ),
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
                          controller: name,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your name';
                            }
                            return null;
                          },
                        ),
                      ),
                      Text("phone number",
                          style: GoogleFonts.aBeeZee(
                              textStyle: const TextStyle(
                                  color: Colors.black,
                                  decoration: TextDecoration.none,
                                  fontSize: 16))),
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
                          controller: phone,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your phone number';
                            }
                            return null;
                          },
                        ),
                      ),
                      Text("email",
                          style: GoogleFonts.aBeeZee(
                              textStyle: const TextStyle(
                                  color: Colors.black,
                                  decoration: TextDecoration.none,
                                  fontSize: 16))),
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
                                  fontSize: 16))),
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
              height: screen.height * 0.01,
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
                  String isRegis = "";
                  try {
                    final credential =
                        await _firebaseAuth.createUserWithEmailAndPassword(
                      email: email.text,
                      password: password.text,
                    );

                    await credential.user!.updateDisplayName(name.text);
                    await credential.user!.updatePhotoURL(
                        "https://firebasestorage.googleapis.com/v0/b/fuwa-nail-cafe.appspot.com/o/defpic.jpg?alt=media&token=d1113876-d107-4876-aad3-56159335d6d3");

                    final userId = credential.user!.uid;

                    await _firestore.collection("customer").doc(userId).set({
                      'id': userId,
                      'email': email.text,
                      'name': name.text,
                      'phone_number': phone.text,
                    });

                    isRegis = "successful";
                  } on FirebaseAuthException catch (e) {
                    if (e.code == 'weak-password') {
                      isRegis = 'The password provided is too weak.';
                    } else if (e.code == 'email-already-in-use') {
                      isRegis = 'The account already exists for that email.';
                    }
                  }

                  setState(() {
                    _loading = false;
                  });
                  if (isRegis != "successful") {
                    // ignore: use_build_context_synchronously
                    await showDialog(
                        context: dialogContext,
                        builder: (BuildContext dialogContext) {
                          return AlertDialog(
                            title: const Text('Something was wrong!'),
                            content: Text(isRegis),
                            actions: <Widget>[
                              TextButton(
                                child: const Text('Try Again'),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                              ),
                            ],
                          );
                        });
                  } else {
                    // ignore: use_build_context_synchronously
                    await showDialog(
                        context: dialogContext,
                        builder: (BuildContext dialogContext) {
                          return AlertDialog(
                            title: const Text('Register success'),
                            content: Text(isRegis),
                            actions: <Widget>[
                              TextButton(
                                child: const Text('Ok'),
                                onPressed: () {
                                  Navigator.of(context).pushAndRemoveUntil(
                                      MaterialPageRoute<void>(
                                          builder: (BuildContext context) =>
                                              const LandingPage()),
                                      ModalRoute.withName('/'));
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
                              const LandingPage()),
                      ModalRoute.withName('/'));
                },
                child: const Text(
                  "You have an account ? Login",
                  style: TextStyle(color: Colors.red),
                ))
          ]),
        ),
      ),
    );
  }
}
