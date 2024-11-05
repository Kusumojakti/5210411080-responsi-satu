import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsi_satu/app/components/wg_button.dart';
import 'package:responsi_satu/app/components/wg_label_textfield.dart';
import 'package:responsi_satu/app/components/wg_profile.dart';


class EditAkun extends StatelessWidget {
  const EditAkun({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController emailController = TextEditingController();
    final TextEditingController namaController = TextEditingController();
    final TextEditingController noteleponController = TextEditingController();
    final TextEditingController alamatController = TextEditingController();
    return Scaffold(
      body: SafeArea(
          child: Container(
            padding: const EdgeInsets.fromLTRB(15, 10, 15, 10),
            child: Column(
              children: [
                const SizedBox(
                  height: 25,
                ),
                const Center(
                  child: WgProfile(
                      nama: "Rafino PP",
                      universitas: "Universitas Teknologi Yogyakarta"),
                ),
                const SizedBox(
                  height: 50,
                ),
                WgLabelTextfield(
                  keyboardType: TextInputType.emailAddress,
                  expands: false,
                  textAlign: TextAlign.start,
                  label: "Email",
                  fieldFill: Colors.white,
                  hintText: "Email",
                  controller: emailController,
                ),
                const SizedBox(
                  height: 20,
                ),
                WgLabelTextfield(
                  controller: namaController,
                  keyboardType: TextInputType.name,
                  expands: false,
                  textAlign: TextAlign.start,
                  label: "Nama",
                  fieldFill: Colors.white,
                  hintText: "Nama",
                ),
                const SizedBox(
                  height: 20,
                ),
                WgLabelTextfield(
                  controller: noteleponController,
                  keyboardType: TextInputType.number,
                  expands: false,
                  textAlign: TextAlign.start,
                  label: "Nomor Telepon",
                  fieldFill: Colors.white,
                  hintText: "Nomor Telepon",
                ),
                const SizedBox(
                  height: 20,
                ),
                WgLabelTextfield(
                  controller: alamatController,
                  keyboardType: TextInputType.text,
                  expands: false,
                  textAlign: TextAlign.start,
                  label: "Alamat",
                  fieldFill: Colors.white,
                  hintText: "Alamat",
                ),
                const SizedBox(
                  height: 20,
                ),
                WgButton(
                    btnText: "Ubah Profil",
                    onTap: null,
                    textStyle: GoogleFonts.poppins(
                        fontWeight: FontWeight.w600,
                        fontSize: 24,
                        color: Colors.white
                    ))
              ],
            ),
          )),
    );
  }
}
