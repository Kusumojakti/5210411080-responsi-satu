import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LogoutView extends StatelessWidget {
  const LogoutView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Text(
            "Login View Ready",
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.w600,
              fontSize: 36
            ),
          ),
        ),
      ),
    );
  }
}
