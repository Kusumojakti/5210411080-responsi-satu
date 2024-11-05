import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsi_satu/app/modules/login_view.dart';
import 'package:responsi_satu/app/resources/custom_function.dart';
import 'package:responsi_satu/app/resources/palletes.dart';

class OtpView extends StatefulWidget {
  const OtpView({super.key});

  @override
  State<OtpView> createState() => _OtpViewState();
}

class _OtpViewState extends State<OtpView> {
  String enteredCode = "";

  void verifyCode() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (enteredCode == "11111") {
        CustomFunction().responseSuksesAction(
            "Verifikasi Sukses", () {
          Get.to(const LoginView());
        });
      } else {
        CustomFunction().responseFailed("Verifikasi Gagal");
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              const SizedBox(height: 40),
              Center(
                child: Image.asset(
                  "assets/images/logo.png",
                  width: 252,
                  height: 96,
                ),
              ),
              const SizedBox(height: 50),
              Text(
                "OTP Verification",
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w600,
                  fontSize: 32,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 60),
              Container(
                alignment: Alignment.centerLeft,
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Masukkan kode otp yang telah dikirimkan ke email anda!",
                      style: GoogleFonts.poppins(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(15, 60, 15, 15),
                child: Column(
                  children: [
                    OtpTextField(
                      numberOfFields: 5,
                      borderColor: primaryColor,
                      showFieldAsBox: true,
                      onCodeChanged: (String code) {
                        setState(() {
                          enteredCode = code;
                        });
                      },
                      onSubmit: (String verificationCode) {
                        enteredCode = verificationCode;
                        verifyCode();
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
