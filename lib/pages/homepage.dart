import 'dart:collection';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'booking.dart';
import 'bookingnownoon.dart';
import 'profilenongnoon.dart';
import 'service.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final _pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    Size screen = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color(0xFFFFF2AC),
      extendBody: true,
      body: SafeArea(
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(image: AssetImage("assets/home.png"),fit: BoxFit.cover)
          ),
          child: Column(
            children: [
              Container(
                height: 100,
                margin: const EdgeInsets.only(top: 5),
                padding: const EdgeInsets.only(left: 25,right: 18),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("HOMEHERO",
                    style: TextStyle(fontSize: 96,fontFamily: "Jomhuria",color: Colors.white,shadows: outlinedText(strokeColor: Colors.black),height: 1.2)),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).pushReplacement(
                                              MaterialPageRoute(builder: (context) => Profile()));
                      },
                      child: Image.asset("assets/profile.png",scale: 2),
                    )
                  ],
                ),
              ),
              Container(
                //margin: const EdgeInsets.only(top: 0),
                height: 190,
                padding: const EdgeInsets.only(left: 10,right: 10),
                child: PageView.builder(
                    controller: _pageController,
                    itemCount: 4, // Total number of items in the list.
                    itemBuilder: (BuildContext context, int index) {
                        // Create and return the widgets for each item.
                        return  SizedBox(
                          width: 330,
                          height: 190,
                    child: Center(
                        child: Image.asset("assets/sc${index+1}.png"),
                    ),
                    
                );
                   
                    },
                ),
                
              ),
              SmoothPageIndicator(  controller: _pageController,  // PageController  
              count:  4,  
          
              effect:  ExpandingDotsEffect(activeDotColor: Color (0xFFFFF2AC),dotColor: Color(0x80FFF2AC)),  // your preferred effect  
              ),
              
              SizedBox(
                height: screen.height * 0.13
                
              ),
              
              Container(
                width: screen.width * 0.97,
                height: screen.height * 0.084,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(50)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 1,
                    blurRadius: 5,
                    offset: Offset(0, 5), // changes position of shadow
                    ),
                    ],
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Padding(
        padding: EdgeInsets.only(top:10,left: 5.0), // หรือปรับค่า padding ตามที่คุณต้องการ
        child: Image.asset(
          'assets/cathero.png', // ระบุที่อยู่ไฟล์รูปภาพของคุณที่นี่
          width: screen.width * 0.18, // หรือตั้งค่าความกว้างที่คุณต้องการ
          height: screen.height * 0.5, // ความสูงควรเท่ากับความสูงของ Container
          fit: BoxFit.cover, // ปรับเข้ากับขนาดที่กำหนด
        ),
      ),
      // คุณสามารถเพิ่มข้อความหรือวิดเจ็ตอื่นๆ ที่ต้องการไว้ด้านขวาของรูปภาพ
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height:9),
          Text("Clean homes, fresh",
          style: TextStyle(fontSize: 30,
          fontFamily: "Jomhuria",
          color: Color(0xFF533526),
          fontWeight: FontWeight.w400,
          height: 0.749,
          ),
          ),
          SizedBox(height: 2),
          Text(
            "lives with HomeHero",
          style: TextStyle(
            fontSize: 30,
            fontFamily: "Jomhuria",
            color: Color(0xFF533526),
            fontWeight: FontWeight.w400,
            height: 1,
            ),
          ), 
        ],
      ),
      InkWell(
  onTap: () {
    // เพิ่มการนำทางไปยังหน้าที่ต้องการ
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => BookingNow(), // แทนที่ด้วยหน้าปลายทางที่ถูกต้อง
      ),
    );
  },
       child:Expanded( // ใช้ Expanded เพื่อให้ container ขยายเต็มพื้นที่ที่เหลือ
      child: Container(
        margin: EdgeInsets.only(left: 12,right: 12), 
        padding: EdgeInsets.all(5),
        width: 139,
        height: 59,
        decoration: BoxDecoration(
          color: Color(0xFFFFAF65),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20), // มุมบนซ้ายมีความโค้ง 20
            topRight: Radius.circular(45),  // มุมบนขวามีความโค้ง 5
            bottomLeft: Radius.circular(20), // มุมล่างซ้ายมีความโค้ง 15
            bottomRight: Radius.circular(45), // มุมล่างขวามีความโค้ง 10
      ),
      border: Border.all(
      color: Color(0xFF533526),  // สีของขอบ
      width: 2,  // ความหนาของขอบ
    ),
        ),
        child: Text(
          "Booking Now!",
          textAlign: TextAlign.center, // จัดข้อความให้อยู่ทางขวา
          style: TextStyle(
            height: 1.7,
            fontFamily: 'Jomhuria',
            fontSize: 30,
            color: Color(0xFFFFF2AC),
            shadows: outlinedText(strokeColor: Color(0xFF533526))
          ),
        ),
      ),
       ),
      ),
                ],
              ),
            
            ),
              Container(
                margin: const EdgeInsets.only(top:10),
                padding: const EdgeInsets.only(left: 12,right: 12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Coupons & Rewards",style: TextStyle(fontSize: 40,fontFamily: "Jomhuria",color: Colors.white,shadows: outlinedText(strokeColor: Colors.black)),),
                    
                  ],
                ),
              ),


              Container(
  margin: const EdgeInsets.only(top: 0),
  padding: const EdgeInsets.only(left: 3, right: 0),
  height: screen.height * 0.16, // กำหนดความสูงของ Container ที่คุณต้องการ
  // ใช้ ListView.builder เพื่อสร้าง list ที่เลื่อนได้แนวนอน
  child: ListView.builder(
    scrollDirection: Axis.horizontal, // ตั้งค่าให้เลื่อนแนวนอน
    itemCount: 9, // จำนวนรายการทั้งหมด
    itemBuilder: (BuildContext context, int index) {
      // สร้างและคืนค่า widget สำหรับแต่ละรายการ
      return Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5), // ระยะห่างระหว่าง items
          child: Image.asset("assets/scc${index + 1}.png"),
        ),
      );
    },
  ),
),
              Spacer(),
              // bottom nav bar
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
                                              MaterialPageRoute(builder: (context) => Service()));
                                          },
                                          
                                        ),
                                      ],
                                    )
                  ],
                ),
              )
          ],),
        ),
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

  /// Outlines a text using shadows.
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

