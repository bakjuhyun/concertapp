import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fading_image_button/fading_image_button.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:concertapp/logonpage.dart';


//TheGlow 콘서트화면 클래스
class TheGlow2025 extends HomePage {
final FirebaseAuth _auth = FirebaseAuth.instance;

@override
Widget build(BuildContext context) {
  final String userEmail = _auth.currentUser?.email ?? '사용자';
  return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: Icon(Icons.close),
              onPressed: () {
              Navigator.pop(context);
            }
            ),
        ],
      ),
    body: Padding(
  padding: const EdgeInsets.all(16),
  child: Column(
    children: [
      SingleChildScrollView(
      scrollDirection: Axis.horizontal,
        child: Row(

          //상단 콘서트 이미지화면
            children: [
            FadingImageButton(
            onPressed: () => print('2025TheGlow pressed 1'),
            image: Image.asset("asset/image/2025theglow.jpeg"),
              onPressedImage: Image.asset("asset/image/theglow.jpeg"),
              width: 500,
              height: 500,
            ),
              SizedBox(height: 1),

              FadingImageButton(
                onPressed: () => print('2025TheGlow pressed 2'),
                image: Image.network(
                    "https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAyNTAxMTRfMTQx%2FMDAxNzM2ODUwODI0MDk0.cXgqzhzpmyrT4yyb8GZog622sAkduvSiFjbNdevfaNkg.EKWWrmpmjRvKIsrPjWNjcjsv6t1onxeJYC6MZ2WbHVEg.PNG%2Fimage.png&type=sc960_832"
                ),
                onPressedImage: Image.network(
                    "https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAyNTAxMTRfMTQx%2FMDAxNzM2ODUwODI0MDk0.cXgqzhzpmyrT4yyb8GZog622sAkduvSiFjbNdevfaNkg.EKWWrmpmjRvKIsrPjWNjcjsv6t1onxeJYC6MZ2WbHVEg.PNG%2Fimage.png&type=sc960_832"
                ),
                width: 500,
                height: 500,
              ),
              SizedBox(height: 1),

              FadingImageButton(
                onPressed: () => print('2025TheGlow pressed 3'),
                image: Image.network(
                    "https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAyNTAyMDVfMjEx%2FMDAxNzM4NzQzOTQwMjI4.fQNR2tytbWaJ-pwfAYc8Kz4ZfZxRkFXI6Tk601brRikg.5E3N2Dv0xBcu5OBFdKFOyjGMO_k0eZq3KQSc5L2k74kg.JPEG%2F%25B4%25F5_%25B1%25DB%25B7%25CE%25BF%25EC_2025_2%25C2%25F7_%25B6%25F3%25C0%25CE%25BE%25F7_%25B9%25D9%25BA%25B8_%25C0%25CC%25C2%25F9%25C7%25F5_%25B5%25A5%25C4%25AB_%25C1%25B6%25C0%25CE%25BD%25BA_%25BA%25F4%25B8%25AE%25B7%25EB_%25B8%25B6%25B6%25F3%25C4%25C9%25BD%25C3_%25C4%25DA%25BD%25BA%25B8%25F0%25BD%25BA_%25B9%25CC%25B5%25E5%25B3%25AA%25C0%25D5.jpg&type=sc960_832"
                ),
                onPressedImage: Image.network(
                    "https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAyNTAyMDVfMjEx%2FMDAxNzM4NzQzOTQwMjI4.fQNR2tytbWaJ-pwfAYc8Kz4ZfZxRkFXI6Tk601brRikg.5E3N2Dv0xBcu5OBFdKFOyjGMO_k0eZq3KQSc5L2k74kg.JPEG%2F%25B4%25F5_%25B1%25DB%25B7%25CE%25BF%25EC_2025_2%25C2%25F7_%25B6%25F3%25C0%25CE%25BE%25F7_%25B9%25D9%25BA%25B8_%25C0%25CC%25C2%25F9%25C7%25F5_%25B5%25A5%25C4%25AB_%25C1%25B6%25C0%25CE%25BD%25BA_%25BA%25F4%25B8%25AE%25B7%25EB_%25B8%25B6%25B6%25F3%25C4%25C9%25BD%25C3_%25C4%25DA%25BD%25BA%25B8%25F0%25BD%25BA_%25B9%25CC%25B5%25E5%25B3%25AA%25C0%25D5.jpg&type=sc960_832"
                ),
                width: 500,
                height: 500,
              ),
              SizedBox(height: 1),
          ],
        ),
      ),

  //공식 링크 버튼
  InkWell(
    highlightColor: Colors.white.withOpacity(0.5),
    splashColor: Colors.cyanAccent.withOpacity(0.4),
  onTap: () {
  final uri = Uri.parse('https://theglowseoul.com/');
  child: Text('공식 홈페이지로 이동');
  launchUrl(uri);
  },
  child: SizedBox(
  height: 70,
  child: Image.network(
      "https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAyNTAxMTRfMTQx%2FMDAxNzM2ODUwODI0MDk0.cXgqzhzpmyrT4yyb8GZog622sAkduvSiFjbNdevfaNkg.EKWWrmpmjRvKIsrPjWNjcjsv6t1onxeJYC6MZ2WbHVEg.PNG%2Fimage.png&type=sc960_832"
  ),
  ),
  ),
    ],
  ),
    ),
  );
}
}



