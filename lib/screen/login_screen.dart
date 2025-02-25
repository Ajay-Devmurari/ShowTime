import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:showtime/screen/signup_screen.dart';
import 'package:showtime/utils/colorlist.dart';
import '../widget/button.dart';
import '../widget/navbar.dart';
import '../widget/textbox.dart';


class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ht = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF0F2027), Color(0xFF203A43), Color(0xFF2C5364)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset(
              'assets/intro_logo.svg',
              height: ht * 0.18,
              color: ColorList.whiteColor,
            ),
            Text(
              'Login',
              style: GoogleFonts.poppins(
                fontSize: ht * 0.035,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
            SizedBox(height: ht * 0.02),
            const CustomTextBox(
              text: 'Email address',
              icon: Icon(Icons.email_outlined, color: Colors.white70),
            ),
            SizedBox(height: ht * 0.02),
            const CustomTextBox(
              text: 'Password',
              icon:
                  Icon(Icons.lock_outline_rounded, color: Colors.white70),
            ),
            SizedBox(height: ht * 0.01),
            Align(
              alignment: Alignment.centerRight,
              child: Text(
                "Forgot password?",
                style: GoogleFonts.poppins(
                  color: Colors.white70,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            SizedBox(height: ht * 0.02),
            CustomButton(
              text: 'Log In',
              onClick: () {
                Navigator.push(
                  context,
                  PageTransition(
                      curve: Easing.standard,
                      duration: const Duration(milliseconds: 800),
                      alignment: Alignment.center,
                      type: PageTransitionType.sharedAxisVertical,
                      child: const CustomNavbar()),
                );
              },
              color: Colors.blueAccent,
              fontColor: Colors.white,
            ),
            SizedBox(height: ht * 0.03),
            textWithDivider(),
            SizedBox(height: ht * 0.02),
            buildCustomIcons(),
            SizedBox(height: ht * 0.03),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Don't have an account? ",
                    style: GoogleFonts.poppins(color: Colors.white70)),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      PageTransition(
                        curve: Easing.standard,
                        duration: const Duration(milliseconds: 800),
                        alignment: Alignment.center,
                        type: PageTransitionType.sharedAxisVertical,
                        child: const SignupScreen(),
                      ),
                    );
                  },
                  child: Text(
                    'Sign Up',
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.bold,
                      color: Colors.blueAccent,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget textWithDivider() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Expanded(child: Divider(color: Colors.white54)),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Text('Or continue with',
              style: GoogleFonts.poppins(color: Colors.white54)),
        ),
        const Expanded(child: Divider(color: Colors.white54)),
      ],
    );
  }

  Widget buildCustomIcons() {
    Widget iconButton(String asset) {
      return Container(
        margin: const EdgeInsets.symmetric(horizontal: 8),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.white10,
        ),
        child: SvgPicture.asset(asset, height: 30),
      );
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        iconButton('assets/google_icon.svg'),
        iconButton('assets/apple_icon.svg'),
        iconButton('assets/facebook_icon.svg'),
      ],
    );
  }
}
