import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:showtime/screen/login_screen.dart';
import 'package:showtime/screen/signup_screen.dart';
import 'package:showtime/utils/colorlist.dart';
import 'package:showtime/widget/button.dart';

class IntroScreen2 extends StatefulWidget {
  const IntroScreen2({super.key});

  @override
  State<IntroScreen2> createState() => _IntroScreen2State();
}

class _IntroScreen2State extends State<IntroScreen2> {
  @override
  Widget build(BuildContext context) {
    final ht = MediaQuery.of(context).size.height;
    return Scaffold(
        body: Stack(
      fit: StackFit.expand,
      children: [
        Positioned.fill(
          child: SvgPicture.asset(
            'assets/intro_image.svg',
            fit: BoxFit.cover,
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Watcher',
              style: GoogleFonts.nunito(
                  fontSize: ht * 0.08,
                  fontWeight: FontWeight.bold,
                  color: ColorList.whiteColor),
            ),
            SizedBox(
              height: ht * 0.01,
            ),
            Text(
              textAlign: TextAlign.center,
              'Your Ticket to Screen Satisfaction\nRate, Review, Reel in the Best!',
              style: GoogleFonts.roboto(
                  fontSize: ht * 0.02, color: ColorList.whiteColor),
            ),
          ],
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CustomButton(
              text: 'Signup',
              onClick: () {
                Navigator.push(
                  context,
                  PageTransition(
                    curve: Easing.standard,
                    duration: const Duration(milliseconds: 800),
                    alignment: Alignment.center,
                    type: PageTransitionType.sharedAxisHorizontal,
                    child: const SignupScreen(),
                  ),
                );
              },
              color: ColorList.blueColor,
            ),
            CustomButton(
              text: 'I have already an account',
              onClick: () {
                Navigator.push(
                  context,
                  PageTransition(
                    curve: Easing.standard,
                    duration: const Duration(milliseconds: 800),
                    alignment: Alignment.center,
                    type: PageTransitionType.sharedAxisVertical,
                    child: const LoginScreen(),
                  ),
                );
              },
              fontColor: ColorList.whiteColor,
            )
          ],
        ),
      ],
    ));
  }
}
