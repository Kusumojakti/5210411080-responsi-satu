import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsi_satu/app/components/wg_button.dart';
import 'package:responsi_satu/app/components/wg_label_textfield.dart';
import 'package:responsi_satu/app/modules/login_view.dart';
import 'package:responsi_satu/app/resources/palletes.dart';

class RegistrasiView extends StatefulWidget {
  const RegistrasiView({super.key});

  @override
  State<RegistrasiView> createState() => _RegistrasiViewState();
}

class _RegistrasiViewState extends State<RegistrasiView> {
  bool _isPasswordVisible = false;
  bool _isConfirmPasswordVisible = false;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController namaController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

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
                "Daftar",
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w600,
                  fontSize: 38,
                  color: Colors.black,
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
                        if (value!.isEmpty) {
                          return "*Required";
                        }
                        return null;
                      }, obscureText: null,
                    ),
                    const SizedBox(height: 20),
                    WgLabelTextfield(
                      controller: passwordController,
                      keyboardType: TextInputType.text,
                      expands: false,
                      textAlign: TextAlign.start,
                      label: "Masukkan Password",
                      fieldFill: Colors.white,
                      hintText: "Password",
                      isRequired: true,
                      isDense: true,
                      obscureText: !_isPasswordVisible,
                      suffix: IconButton(
                        icon: Icon(
                          _isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                        ),
                        onPressed: () {
                          setState(() {
                            _isPasswordVisible = !_isPasswordVisible;
                          });
                        },
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "*Required";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 20),
                    WgLabelTextfield(
                      controller: confirmPasswordController,
                      keyboardType: TextInputType.text,
                      expands: false,
                      textAlign: TextAlign.start,
                      label: "Masukkan Kembali Password",
                      fieldFill: Colors.white,
                      hintText: "Password",
                      isRequired: true,
                      isDense: true,
                      obscureText: !_isConfirmPasswordVisible,
                      suffix: IconButton(
                        icon: Icon(
                          _isConfirmPasswordVisible
                              ? Icons.visibility
                              : Icons.visibility_off,
                        ),
                        onPressed: () {
                          setState(() {
                            _isConfirmPasswordVisible = !_isConfirmPasswordVisible;
                          });
                        },
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "*Required";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Belum punya akun?",
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w400,
                            fontSize: 13,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 5),
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () => Get.to(const LoginView()),
                          child: Text(
                            "Masuk",
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w400,
                              fontSize: 13,
                              color: primaryColor,
                            ),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 80),
                    WgButton(
                      btnText: "Daftar",
                      onTap: null,
                      textStyle: GoogleFonts.poppins(
                        fontWeight: FontWeight.w600,
                        fontSize: 24,
                        color: Colors.white,
                      ),
                    )
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
