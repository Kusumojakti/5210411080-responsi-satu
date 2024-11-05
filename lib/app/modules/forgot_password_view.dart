import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsi_satu/app/components/wg_button.dart';
import 'package:responsi_satu/app/components/wg_label_textfield.dart';
import 'package:responsi_satu/app/modules/otp_view.dart';

class ForgotPasswordView extends StatefulWidget {
  const ForgotPasswordView({super.key});

  @override
  State<ForgotPasswordView> createState() => _ForgotPasswordViewState();
}

class _ForgotPasswordViewState extends State<ForgotPasswordView> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Form( // Wrap with Form widget
            key: _formKey,
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
                  "Lupa Password",
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w600,
                    fontSize: 38,
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
                        "Pesan",
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        "Masukkan email Anda dan tunggu kode etik akan dikirimkan.",
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
                      WgLabelTextfield(
                        controller: emailController,
                        keyboardType: TextInputType.emailAddress,
                        expands: false,
                        textAlign: TextAlign.start,
                        label: "Masukkan Email",
                        fieldFill: Colors.white,
                        hintText: "Email",
                        isRequired: true,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Masukkan email anda!";
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 20),
                      const SizedBox(height: 80),
                      WgButton(
                        btnText: "Kirim",
                        onTap: () {
                          if (_formKey.currentState!.validate()) {
                            Get.to(const OtpView());
                          }
                        },
                        textStyle: GoogleFonts.poppins(
                          fontWeight: FontWeight.w600,
                          fontSize: 24,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
