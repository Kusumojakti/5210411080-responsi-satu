import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsi_satu/app/components/wg_button.dart';
import 'package:responsi_satu/app/components/wg_label_textfield.dart';
import 'package:responsi_satu/app/modules/forgot_password_view.dart';
import 'package:responsi_satu/app/modules/parent_tab.dart';
import 'package:responsi_satu/app/modules/registrasi_view.dart';
import 'package:responsi_satu/app/resources/palletes.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

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
                "Masuk",
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w600,
                  fontSize: 38,
                  color: Colors.black,
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(15, 60, 15, 15),
                child: Form(
                  key: _formKey,
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
                            return "Email wajib diisi!!";
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 20),
                      WgLabelTextfield(
                        controller: passwordController,
                        keyboardType: TextInputType.visiblePassword,
                        expands: false,
                        textAlign: TextAlign.start,
                        label: "Masukkan Password",
                        fieldFill: Colors.white,
                        hintText: "Password",
                        isRequired: true,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Password wajib diisi!!";
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
                          GestureDetector(
                            onTap: () => Get.to(const ForgotPasswordView()),
                            child: Text(
                              "Lupa password?",
                              style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w400,
                                fontSize: 13,
                                color: primaryColor,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 5),
                      Row(
                        children: [
                          GestureDetector(
                            onTap: () => Get.to(const RegistrasiView()),
                            child: Text(
                              "Daftar",
                              style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w400,
                                fontSize: 13,
                                color: primaryColor,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 80),
                      WgButton(
                        btnText: "Masuk",
                        onTap: () {
                          if (_formKey.currentState!.validate()) {
                            // If form is valid, proceed to next screen
                            Get.to(const ParentTab());
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
