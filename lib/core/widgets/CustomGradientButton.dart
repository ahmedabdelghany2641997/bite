import 'package:flutter/material.dart';

class CustomGradientButton extends StatelessWidget {
  final String text;
  final void Function() onTap;

  const CustomGradientButton({
    super.key,
    required this.text,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity, 
      height: 56, 
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: [
            Color(0xFFFF7043), 
            Color(0xFFEE4327), 
          ],
        ),
        borderRadius: BorderRadius.circular(30), 
        boxShadow: [
          BoxShadow(
            color: const Color(0xFFEE4327).withOpacity(0.3),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(30),
          child: Center(
            child: Text(
              text,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}