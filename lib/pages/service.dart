import 'dart:collection';
// import 'dart:developer';
import 'package:flutter/material.dart';

import 'booking.dart';
import 'homepage.dart';
import 'reviewpage.dart';

class Service extends StatefulWidget {
  const Service({Key? key}) : super(key: key);
  

  @override
  State<Service> createState() => _ServiceState();

  

  /// Outlines a text using shadows.

}

class _ServiceState extends State<Service> {
  @override
  Widget build(BuildContext context) {
    Size screen = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(image: AssetImage("assets/bookingback.png"),fit: BoxFit.cover)
        ),
        child: Column(
            children: [
              Container(
                height: 100,
                margin: const EdgeInsets.only(top: 10),
                padding: const EdgeInsets.only(left: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    //Text("HOMEHERO",
                    //style: TextStyle(fontSize: 89,fontFamily: "Jomhuria",color: Colors.white,shadows: outlinedText(strokeColor: Colors.black),),),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).pushReplacement(
                                              MaterialPageRoute(builder: (context) => HomePage()));
                      },
                      child: Image.asset("assets/arrow.png",scale: 1),
                    )
                  ],
                ),
              ),
              
          
        Spacer(),
        Image.asset(
              'assets/service.png', // ใส่ชื่อไฟล์รูปภาพของคุณที่นี่
              width: screen.width * 0.98, // ปรับความกว้างตามที่ต้องการ
              height: screen.height * 0.5, // ปรับความสูงตามที่ต้องการ
              fit: BoxFit.contain, // หรือเลือก BoxFit ที่เหมาะสม
            ),
          Spacer(),
          SizedBox(
                height: 144,
                child: Stack(
                  children: [
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                          height: 100,
                           decoration: BoxDecoration(
                             color: Color(0xFFB57859),
                             borderRadius: BorderRadius.only(
                               topLeft: Radius.circular(20.0),
                               topRight: Radius.circular(20.0),
                             ),
                           ),
                               
                             ),
                    ),
                           Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceAround, // This will arrange the icon buttons equally spaced
                                      children: <Widget>[
                                        _buildBottomNavItem(
                                          icon: 'assets/ibhome.png',
                                          label: 'Home',
                                          onTap: () {
                                            Navigator.of(context).pushReplacement(
                                              MaterialPageRoute(builder: (context) => HomePage()));
                                          },
                                        ),
                                        _buildBottomNavItem(
                                          icon: 'assets/ibca.png',
                                          label: 'Booking',
                                          onTap: () {
                                            Navigator.of(context).pushReplacement(
                                              MaterialPageRoute(builder: (context) => Booking()));
                                          },
                                        ),
                                        _buildBottomNavItem(
                                          icon: 'assets/ibser.png',
                                          label: 'Service',
                                          onTap: () {
                                            // Handle Service tap
                                            Navigator.of(context).pushReplacement(
                                              MaterialPageRoute(builder: (context) => Service()));
                                          },
                                        ),
                                        _buildBottomNavItem(
                                          icon: 'assets/ibre.png',
                                          label: 'Review',
                                          onTap: () {
                                            // Handle Review tap
                                            Navigator.of(context).pushReplacement(
                                              MaterialPageRoute(builder: (context) => Review()));
                                          },
                                        ),
                                      ],
                                    )
                  ],
                ),
              )
        ],),
      ),
    
    );
  }
  Widget _buildBottomNavItem({
    required String icon,
    required String label,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(icon, width: 65, height: 65), // Icon size can be adjusted
          SizedBox(height: 12),
          Text(label, style: TextStyle(
            fontFamily: "Inter",
            color: Colors.white, fontSize: 12, fontWeight: FontWeight.w500)),
        ],
      ),
    );
  }
  static List<Shadow> outlinedText({double strokeWidth = 1, Color strokeColor = Colors.black, int precision = 5}) {
  Set<Shadow> result = HashSet();
  for (int x = 1; x < strokeWidth + precision; x++) {
    for(int y = 1; y < strokeWidth + precision; y++) {
      double offsetX = x.toDouble();
      double offsetY = y.toDouble();
      result.add(Shadow(offset: Offset(-strokeWidth / offsetX, -strokeWidth / offsetY), color: strokeColor));
      result.add(Shadow(offset: Offset(-strokeWidth / offsetX, strokeWidth / offsetY), color: strokeColor));
      result.add(Shadow(offset: Offset(strokeWidth / offsetX, -strokeWidth / offsetY), color: strokeColor));
      result.add(Shadow(offset: Offset(strokeWidth / offsetX, strokeWidth / offsetY), color: strokeColor));
    }
  }
  return result.toList();
}
}
