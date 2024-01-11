import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobileuasrega/pages/login_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('lib/assets/splashbook.png'),
            Column(
              children: [
                Text(
                  'BookBriefs',
                  style: GoogleFonts.acme(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                Text('Quick glimpses into a world of captivating stories'),
              ],
            ),
          ],
        ),
      ),
      backgroundColor: Colors.cyanAccent.shade700,
      nextScreen: LoginPage(),
      splashIconSize: 250,
      duration: 3000,
      splashTransition: SplashTransition.slideTransition,
      animationDuration: const Duration(seconds: 1),
    );
  }
}
