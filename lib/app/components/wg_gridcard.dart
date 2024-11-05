import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsi_satu/app/modules/detail_song_view.dart';
import 'package:responsi_satu/app/resources/palletes.dart';

class WgGridcard extends StatelessWidget {
  final String pict;
  final String artist;
  final String song;
  final String pathSong;
  const WgGridcard({
    super.key,
    required this.pict,
    required this.artist,
    required this.song,
    required this.pathSong
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return DetailSongView(
            pict: pict,
            artist: artist,
            song: song,
            pathSong: pathSong,
          );
        }));
      },
      child: Card(
        color: onGridColor,
        child: Container(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8), // Rounded corners
                child: Image.asset(
                  pict,
                  height: 150,
                  width: 170,
                  fit: BoxFit.cover, // Ensures the image covers the area
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                artist,
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
                  song,
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
