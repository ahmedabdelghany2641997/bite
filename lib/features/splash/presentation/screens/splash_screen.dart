import 'dart:async';

import 'package:bite/core/constants/app_colors.dart';
import 'package:bite/features/auth/presentation/screens/signup_screen.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 5), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const SignupScreen()),
      );
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [AppColors.primaryColor, AppColors.secondaryColor],
          ),
        ),
        
        
        child: Column(
          children: [
            const Spacer(flex: 4),
      
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset("assets/images/imagelogo.png", height: 96, width: 96),
                const SizedBox(height: 16),
                const Text(
                  'Recipe Finder',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'Plus Jakarta Sans',
                    fontWeight: FontWeight.w800,
                    fontSize: 36,
                    height: 40 / 36,
                    letterSpacing: -0.9,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'COOK WITH PASSION',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'Plus Jakarta Sans',
                    fontWeight: FontWeight.w800,
                    fontSize: 14,
                    letterSpacing: 1.2,
                    color: Colors.white.withOpacity(0.8),
                  ),
                ),
              ],
            ),
      
            const Spacer(flex: 3),
      
            Padding(
              padding: const EdgeInsets.only(bottom: 60),
              child: Column(
                children: [
                  SizedBox(
                    width: 150,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: const LinearProgressIndicator(
                        value: 0.3,
                        backgroundColor: Colors.white24,
                        color: Colors.white,
                        minHeight: 4,
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  const Text(
                    'LOADING KITCHEN',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                      letterSpacing: 1.5,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        
      ),
      
    );
  }
}
