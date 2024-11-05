import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsi_satu/app/resources/palletes.dart';

class WgListcard extends StatelessWidget {
  final String pict;
  final String headlines;
  final String deskripsi;
  final String date;
  final String time;
  const WgListcard({
    super.key,
    required this.pict,
    required this.headlines,
    required this.deskripsi,
    required this.date,
    required this.time
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // Navigator.push(context, MaterialPageRoute(builder: (context) {
        //   return DetailBarangInventarisasi(
        //     idAlat: idAlat,
        //     nama: nama,
        //     pathPhoto: pathPhoto,
        //     merk: merk,
        //     harga: harga,
        //     kodeAlat: kodeAlat,
        //     vendor: vendor,
        //     penanggungJawab: penanggungJawab,
        //     deskripsi: deskripsi,
        //   );
        // }));
      },
      child: Card(
        color: onGridColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(
                  pict,
                  height: 120,
                  width: 120,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      headlines,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      deskripsi,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            const Icon(Icons.add_circle_outline_outlined),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              date,
                              style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 12,
                                  color: Colors.grey
                              ),
                            ),
                            const SizedBox(width: 5),
                            Text(
                              '•',
                              style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w400,
                                fontSize: 12,
                                color: Colors.grey,
                              ),
                            ),
                            const SizedBox(width: 5),
                            Text(
                              time,
                              style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 12,
                                  color: Colors.grey
                              ),
                            ),
                          ],
                        ),
                        const Row(
                          children: [
                            Icon(Icons.play_circle)
                          ],
                        )
                      ],
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
