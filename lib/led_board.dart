import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:concertapp/logonpage.dart';


@override
Widget build(BuildContext context) {
  return MaterialApp(
    title: 'Flutter LED Board',
    theme: ThemeData(primarySwatch: Colors.blue),
    home: const LEDBoard(),
  );
}

class LEDBoard extends StatefulWidget {
  const LEDBoard({Key? key}) : super(key: key);

  @override
  _LEDBoardState createState() => _LEDBoardState();
}

class _LEDBoardState extends State<LEDBoard> with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _animation;
  final String _text = "Welcome to the Juncert LED Board! ";

  @override
  void initState() {
    super.initState();

    // Animation Controller
    _controller = AnimationController(
      duration: const Duration(seconds: 10), // 애니메이션 속도
      vsync: this,
    )..repeat(); // 무한 반복

    // 애니메이션
    _animation = Tween<double>(begin: 1.0, end: -1.0).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('LED Board')),
      body: Center(
        child: ClipRect(
          child: Container(
            height: 50, // 전광판 높이
            color: Colors.black,
            child: AnimatedBuilder(
              animation: _animation,
              builder: (context, child) {
                return FractionalTranslation(
                  translation: Offset(_animation.value, 0), // x축 이동
                  child: child,
                );
              },
              child: Row(
                children: [
                  Text(
                    _text,
                    style: const TextStyle(
                      fontSize: 24,
                      color: Colors.green, // 전광판 텍스트 색상
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  // 텍스트 반복 효과
                  Text(
                    _text,
                    style: const TextStyle(
                      fontSize: 24,
                      color: Colors.green,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}