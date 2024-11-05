import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsi_satu/app/components/wg_gridcard.dart';
import 'package:responsi_satu/app/components/wg_listcard.dart';
import 'package:responsi_satu/app/modules/detail_song_view.dart';

class GridItem {
  final String pict;
  final String artist;
  final String song;
  final String pathSong;

  GridItem({
    required this.pict,
    required this.artist,
    required this.song,
    required this.pathSong
  });
}

class ListItem {
  final String pict;
  final String headlines;
  final String deskripsi;
  final String date;
  final String time;

  ListItem({
    required this.pict,
    required this.headlines,
    required this.deskripsi,
    required this.date,
    required this.time
  });
}

final List<GridItem> gridItems = [
  GridItem(pict:"assets/images/album/avici.jpg", artist: "Avicii", song: "The Night", pathSong: "assets/song/Avicii - The Nights.mp3"),
  GridItem(pict:"assets/images/album/jc.jpg", artist: "Juicy Luicy", song: "Lampu Kuning", pathSong: "assets/song/Juicy Luicy - Lampu Kuning.mp3"),
  GridItem(pict:"assets/images/album/hindia.jpg", artist: "Hindia", song: "Kita ke Sana", pathSong: "assets/song/Hindia - Kita ke Sana.mp3"),
  GridItem(pict:"assets/images/album/so7.jpeg", artist: "Sheila On 7", song: "Melompat Lebih Tinggi", pathSong: "l"),
  GridItem(pict:"assets/images/amsterdamned.jpeg", artist: "Yellow Claw", song: "Amsterdamned", pathSong: "k"),
];

final List<ListItem> listItems = [
  ListItem(
      pict: "assets/images/headlines/juiciy.jpg",
      headlines: "Lampu Kuning Menjadi Entri Terbaru Juicy Luicy di Billboard Indonesia Hot 25",
      deskripsi: "Masuk sebagai New Entry di peringkat 21, Lampu Kuning menjadi lagu keempat Juicy Luicy yang mengisi chart Billboard Indonesia Hot 25",
      date: "4 weeks ago",
      time: "13.20 WIB"),
  ListItem(
      pict: "assets/images/headlines/coldplay.jpg",
      headlines: "Versi Vinyl Album Moon Music Coldplay Terbuat dari Sampah Plastik Sungai Cisadane",
      deskripsi: "Bukan hanya dari Sungai Cisadane, vinyl album terbaru Coldplay ini juga terbuat dari sampah plastik yang diangkut dari Sungai Klang, Selangor, Malaysia.",
      date: "4 weeks ago",
      time: "10.00 WIB"),
  ListItem(
      pict: "assets/images/headlines/jvs.png",
      headlines: "Singer-songwriter Snoh Aalegra to headline 2024 Java Jazz Festival",
      deskripsi: "The Grammy-nominated artist is slated to perform at Indonesia’s biggest jazz festival on May 26, the final day of the festival’s three-day run.",
      date: "8 weeks ago",
      time: "19.00 WIB"),
  ListItem(
      pict: "assets/images/headlines/richbrian.png",
      headlines: "Rich Brian Talks New Single ‘Bali’ & His Home-Recording ‘Experiment’ in Quarantine",
      deskripsi: "While most of the world is stuck inside over concerns of coronavirus, Rich Brian is hoping to take listeners on a trip to paradise with new single 'Bali' featuring Guapdad 4000.",
      date: "4 years ago",
      time: "12.00 WIB"),
  ListItem(
      pict: "assets/images/headlines/bill10.png",
      headlines: "Top 10 chart Billboard Indonesia 2023 minggu ini: lagu dari Raim Laode di pucuk, New West tembus sepuluh besar",
      deskripsi: "Sepuluh besar di chart Billboard Indonesia tidak terlihat perubahan yang cukup signifikan pada minggu ini",
      date: "21 weeks ago",
      time: "21.15 WIB"),
];

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.fromLTRB(15, 20, 15, 10),
              child: Column(
                children: [
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(Icons.person),
                      Row(
                        children: [
                          Icon(Icons.notifications_none),
                          SizedBox(
                            width: 15,
                          ),
                          Icon(Icons.settings),
                        ],
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Guest",
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w600,
                            fontSize: 21,
                            color: Colors.black
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            Text(
                              "Widget Grid View",
                              style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 18,
                                  color: Colors.black
                              ),
                            ),
                            const SizedBox(
                              width: 15,
                            ),
                            const Icon(Icons.arrow_forward_rounded)
                          ],
                        ),
                        Container(
                          margin: const EdgeInsets.fromLTRB(0, 20, 0, 10),
                          height: 250,
                          child: ListView.separated(
                              separatorBuilder: (context, index) =>
                              const SizedBox(
                                width: 10,
                              ),
                              shrinkWrap: true,
                              physics: const ClampingScrollPhysics(),
                              scrollDirection: Axis.horizontal,
                              itemCount: gridItems.length,
                            // Inside ListView.separated in HomeView
                            itemBuilder: (context, index) {
                              final item = gridItems[index];
                              return GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => DetailSongView(
                                        pict: item.pict,
                                        artist: item.artist,
                                        song: item.song,
                                        pathSong: item.pathSong,
                                      ),
                                    ),
                                  );
                                },
                                child: WgGridcard(
                                  pict: item.pict,
                                  artist: item.artist,
                                  song: item.song,
                                  pathSong: item.pathSong,
                                ),
                              );
                            },
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            Text(
                              "Widget List View",
                              style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 18,
                                  color: Colors.black
                              ),
                            ),
                            const SizedBox(
                              width: 15,
                            ),
                            const Icon(Icons.arrow_forward_rounded)
                          ],
                        ),
                        Container(
                          margin: const EdgeInsets.fromLTRB(0, 20, 0, 10),
                          height: 250,
                          child: ListView.separated(
                              separatorBuilder: (context, index) =>
                              const SizedBox(
                                width: 10,
                              ),
                              shrinkWrap: true,
                              physics: const ClampingScrollPhysics(),
                              scrollDirection: Axis.vertical,
                              itemCount: listItems.length,
                              itemBuilder: (context, index) {
                                final items = listItems[index];
                                return WgListcard(
                                    pict: items.pict,
                                    headlines: items.headlines,
                                    deskripsi: items.deskripsi,
                                    date: items.date,
                                    time: items.time
                                );
                              }
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          )),
    );
  }
}
