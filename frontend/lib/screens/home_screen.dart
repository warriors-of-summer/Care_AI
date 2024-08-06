import 'package:flutter/material.dart';
import 'dart:async';

import 'package:frontend/screens/prompt_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    // 1초 후에 다음 페이지로 이동
    Timer(
      const Duration(milliseconds: 500),
      () {
        Navigator.of(context).pushReplacement(
          PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) =>
                const PromptScreen(),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              // 페이드 인 애니메이션 설정
              return FadeTransition(
                opacity: animation,
                child: child,
              );
            },
            // 애니메이션 지속 시간 설정
            transitionDuration: const Duration(milliseconds: 1000),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xff23B6E4),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Care Ai",
              style: TextStyle(
                color: Colors.white,
                fontSize: 40,
                fontWeight: FontWeight.w700,
              ),
            ),
            Icon(
              Icons.health_and_safety_sharp,
              color: Colors.white,
              size: 120,
            )
          ],
        ),
      ),
    );
  }
}
