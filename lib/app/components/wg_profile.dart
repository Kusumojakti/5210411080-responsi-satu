import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsi_satu/app/resources/palletes.dart';

class WgProfile extends StatelessWidget {
  final String nama;
  final String universitas;
  const WgProfile({
    super.key,
    required this.nama,
    required this.universitas
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // Navigator.push(context, MaterialPageRoute(builder: (context) {
        //   return const DetailKegiatanRuangan();
        // }));
      },
      child: Card(
        color: onGridColor,
        child: Container(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8), // Rounded corners
                child: Image.asset(
                  "assets/images/profile.jpg",
                  height: 120,
                  width: 120,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                nama,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                ),
              ),
              const SizedBox(
                height: 4,
              ),
              Text(
                  universitas,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                  )
              ),
              const SizedBox(
                height: 4,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
