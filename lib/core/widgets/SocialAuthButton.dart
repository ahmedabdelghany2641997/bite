import 'package:flutter/material.dart';

class SocialAuthButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;

  const SocialAuthButton({super.key, required this.text, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Expanded( 
      child: OutlinedButton(
        onPressed: onTap,
        style: OutlinedButton.styleFrom(
          side: const BorderSide(color: Color(0xFFE2E8F0)), 
          padding: const EdgeInsets.symmetric(vertical: 16),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
        ),
        child: Text(
          text,
          style: const TextStyle(
            color: Color(0xFF475569),
            fontWeight: FontWeight.w600,
            fontFamily: 'Plus Jakarta Sans',
          ),
        ),
      ),
    );
  }
}