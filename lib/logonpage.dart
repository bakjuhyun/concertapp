import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fading_image_button/fading_image_button.dart';
import 'package:concertapp/main.dart';
import 'package:concertapp/concert_information.dart';
import 'package:concertapp/setting.dart';
import 'package:concertapp/led_board.dart';


// 메인화면(홈페이지) 클래스
class HomePage extends StatelessWidget {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    final String userEmail = _auth.currentUser?.email ?? '사용자';
    return Scaffold(

      //상단 앱바 부분
      appBar: AppBar(
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () async {
              await _auth.signOut();
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => LoginPage()),
              );
            },
          ),
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: ()  {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SettingPage(),
                ),
              );
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(

            //상단 콘서트 광고화면
            children: [
              FadingImageButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => TheGlow2025()),
                  );
                  },
                image: Image.asset("asset/image/2025theglow.jpeg"),
                onPressedImage: Image.asset("asset/image/2025theglow.jpeg"),
                width: 350,
                height: 450,
              ),
              SizedBox(height: 1),

              FadingImageButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LoveSome2025()),
                  );
                },
                image: Image.asset("asset/image/2025lovesome.jpeg"),
                onPressedImage: Image.asset("asset/image/2025lovesome.jpeg"),
                width: 350,
                height: 450,
              ),
              SizedBox(height: 1),

              FadingImageButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => TheGlow2025()),
                  );
                },
                image: Image.asset("asset/image/2025punklodge.jpeg"),
                onPressedImage: Image.asset("asset/image/2025punklodge.jpeg"),
                width: 350,
                height: 450,
              ),
              SizedBox(height: 1),

              FadingImageButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => TheGlow2025()),
                  );
                },
                image: Image.asset("asset/image/2025loudbridgefestival.jpeg"),
                onPressedImage: Image.asset("asset/image/2025loudbridgefestival.jpeg"),
                width: 350,
                height: 450,
              ),
              SizedBox(height: 1),

              FadingImageButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => TheGlow2025()),
                  );
                },
                image: Image.asset("asset/image/2025soundberrytheater.jpeg"),
                onPressedImage: Image.asset("asset/image/2025soundberrytheater.jpeg"),
                width: 350,
                height: 450,
              ),
              SizedBox(height: 1),

              FadingImageButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => TheGlow2025()),
                  );
                },
                image: Image.asset("asset/image/2025cherryblossommusicfestival.jpeg"),
                onPressedImage: Image.asset("asset/image/2025cherryblossommusicfestival.jpeg"),
                width: 350,
                height: 450,
              ),
              SizedBox(height: 1),

              FadingImageButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => TheGlow2025()),
                  );
                },
                image: Image.asset("asset/image/2025seoulspringfestival.png"),
                onPressedImage: Image.asset("asset/image/2025seoulspringfestival.png"),
                width: 350,
                height: 450,
              ),
              SizedBox(height: 1),

              FadingImageButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => TheGlow2025()),
                  );
                },
                image: Image.asset("asset/image/2025superpop.png"),
                onPressedImage: Image.asset("asset/image/2025superpop.png"),
                width: 350,
                height: 450,
              ),
              SizedBox(height: 1),

              FadingImageButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => TheGlow2025()),
                  );
                },
                image: Image.asset("asset/image/2025greencamp.png"),
                onPressedImage: Image.asset("asset/image/2025greencamp.png"),
                width: 350,
                height: 450,
              ),
              SizedBox(height: 1),
            ],
          ),
        ),
      ),
    //.
    );
  }
}