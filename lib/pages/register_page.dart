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
                  image: AssetImage("assets/background.png"),
                  fit: BoxFit.cover)),
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Text(
              "Fuwa Fuwa\nnail cafe",
              style: GoogleFonts.chewy(
                  textStyle: const TextStyle(
                      fontSize: 36,
                      color: Color(0xFF6C5F57),
                      decoration: TextDecoration.none)),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: screen.height * 0.025,
            ),
            SizedBox(
                width: screen.width * 0.8,
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Name",
                        style: GoogleFonts.chewy(
                            textStyle: const TextStyle(
                                color: Color(0xFF6C5F57),
                                decoration: TextDecoration.none,
                                fontSize: 22)),
                      ),
                      Container(
                        margin: const EdgeInsets.all(8),
                        padding: const EdgeInsets.only(left: 12, right: 12),
                        width: screen.width * 0.8,
                        decoration: const BoxDecoration(
                            color: Color(0xFFCEB09D),
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
                          style: GoogleFonts.chewy(
                              textStyle: const TextStyle(
                                  color: Color(0xFF6C5F57),
                                  decoration: TextDecoration.none,
                                  fontSize: 22))),
                      Container(
                        margin: const EdgeInsets.all(8),
                        padding: const EdgeInsets.only(left: 12, right: 12),
                        width: screen.width * 0.8,
                        decoration: const BoxDecoration(
                            color: Color(0xFFCEB09D),
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
                          style: GoogleFonts.chewy(
                              textStyle: const TextStyle(
                                  color: Color(0xFF6C5F57),
                                  decoration: TextDecoration.none,
                                  fontSize: 22))),
                      Container(
                        margin: const EdgeInsets.all(8),
                        padding: const EdgeInsets.only(left: 12, right: 12),
                        width: screen.width * 0.8,
                        decoration: const BoxDecoration(
                            color: Color(0xFFCEB09D),
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
                          style: GoogleFonts.chewy(
                              textStyle: const TextStyle(
                                  color: Color(0xFF6C5F57),
                                  decoration: TextDecoration.none,
                                  fontSize: 22))),
                      Container(
                        margin: const EdgeInsets.all(8),
                        padding: const EdgeInsets.only(left: 12, right: 12),
                        width: screen.width * 0.8,
                        decoration: const BoxDecoration(
                            color: Color(0xFFCEB09D),
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
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFCAAF9F)),
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
                  } catch (e) {
                    print('Error: ${e.toString()}');
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
                      style: GoogleFonts.chewy(
                          textStyle: const TextStyle(
                              color: Color(0xFF6C5F57),
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
