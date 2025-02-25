import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:showtime/utils/colorlist.dart';
import 'intro_screen2.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({super.key});

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 5), () {
      Navigator.push(
        context,
        PageTransition(
          duration: const Duration(milliseconds: 1000),
          type: PageTransitionType.sharedAxisHorizontal,
          child: const IntroScreen2(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final ht = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [
          Color(0xFF1E3C72),
          Color(0xFF2A5298),
          Color(0xFF6DD5FA),
          Color(0xFFB2F3FF),
        ], begin: Alignment.topRight, end: Alignment.bottomLeft)),
        child: Center(
            child: Text(
          'Watcher',
          style: GoogleFonts.nunito(
              fontSize: ht * 0.08,
              fontWeight: FontWeight.bold,
              color: ColorList.whiteColor),
        )),
      ),
    );
  }
}
