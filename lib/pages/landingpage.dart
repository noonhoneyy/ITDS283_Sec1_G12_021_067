import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:homehero/pages/register_page.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    Size screen = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
          width: screen.width,
          height: screen.height,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/bg.png"), fit: BoxFit.cover)),
          child: Column(
            children: [
              SizedBox(
                height: screen.height * 0.05,
              ),
              Container(
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
                          height: 0.1,
                          color: Colors.white,
                          decoration: TextDecoration.none,
                          fontSize: 33)),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(
                height: screen.height * 0.2,
              ),
              Container(
                padding: EdgeInsets.all(20),
                width: screen.width * 0.9,
                height: screen.height * 0.3,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Welcome",
                      style: GoogleFonts.aBeeZee(
                          textStyle: const TextStyle(
                              color: Color(0xFFFFAF65),
                              decoration: TextDecoration.none,
                              fontSize: 33)),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      width: screen.width * 0.7,
                      child: Divider(
                        color: Color(0xFFFFAF65),
                      ),
                    ),
                    Container(
                      width: screen.width * 0.8,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LandingPage()),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFFFFAF65)),
                        child: Text(
                          "LOGIN",
                          style: GoogleFonts.aBeeZee(
                              textStyle: const TextStyle(color: Colors.black)),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: screen.height * 0.02,
                    ),
                    Container(
                      width: screen.width * 0.8,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const RegisterPage()),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFFFFAF65)),
                        child: Text(
                          "REGISTER",
                          style: GoogleFonts.aBeeZee(
                              textStyle: const TextStyle(color: Colors.black)),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          )),
    );
  }
}
