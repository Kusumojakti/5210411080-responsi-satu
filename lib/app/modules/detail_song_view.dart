import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:just_audio/just_audio.dart';
import 'package:rxdart/rxdart.dart';
import 'package:responsi_satu/app/resources/palletes.dart';

class PositionData{
  const PositionData(
      this.position,
      this.bufferedPosition,
      this.duration);

  final Duration position;
  final Duration bufferedPosition;
  final Duration duration;
}

class DetailSongView extends StatefulWidget {
  final String pict;
  final String artist;
  final String song;
  final String pathSong;
  const DetailSongView({
    super.key,
    required this.pict,
    required this.artist,
    required this.song,
    required this.pathSong
  });

  @override
  State<DetailSongView> createState() => _DetailSongViewState();
}

class _DetailSongViewState extends State<DetailSongView> {
  late AudioPlayer _audioPlayer;

  Stream<PositionData> get _positionDataStream => 
      Rx.combineLatest3<Duration, Duration, Duration?, PositionData>(
        _audioPlayer.positionStream,
        _audioPlayer.bufferedPositionStream,
        _audioPlayer.durationStream,
      (position, bufferedPosition, duration) => PositionData(
          position,
        bufferedPosition,
      duration ?? Duration.zero,
    ),);

  @override
  void initState() {
    super.initState();
    _audioPlayer = AudioPlayer()..setAsset(widget.pathSong);
    // _audioPlayer = AudioPlayer()..setAsset('assets/song/Avicii - The Nights.mp3');
  }


  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: primaryColor),
        flexibleSpace: SafeArea(
          child: Container(
            padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
            child: Stack(
              children: [
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      decoration: const BoxDecoration(
                        color: Colors.transparent,
                      ),
                    ),
                    Image.asset(
                      "assets/images/logo.png",
                      height: 50,
                      width: 100,
                    ),
                    const Icon(Icons.apps_rounded),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      body: Center(
        child: Container(
          padding: const EdgeInsets.fromLTRB(15, 20, 15, 10),
          child: Column(
            children: [
              Image.asset(
                widget.pict,
                height: 400,
                width: 400,
              ),
              Text(
                widget.song,
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w700,
                  fontSize: 21,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                widget.artist,
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Column(
                children: [
                  StreamBuilder<PositionData>(
                      stream: _positionDataStream,
                      builder: (context, snapshot) {
                        final positionData = snapshot.data;
                        return ProgressBar(
                            barHeight: 8,
                            baseBarColor: Colors.grey[600],
                            bufferedBarColor: Colors.grey,
                            progressBarColor: Colors.red,
                            thumbColor: Colors.red,
                            timeLabelTextStyle: GoogleFonts.poppins(
                              color: primaryColor,
                              fontWeight: FontWeight.w600
                            ),
                            progress: positionData?.position ?? Duration.zero,
                            total: positionData?.duration ?? Duration.zero,
                            buffered: positionData?.bufferedPosition ?? Duration.zero,
                            onSeek: _audioPlayer.seek,
                        );
                      }),
                  Controls(audioPlayer: _audioPlayer),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Controls extends StatelessWidget {
  const Controls({
    super.key,
    required this.audioPlayer,
  });

  final AudioPlayer audioPlayer;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
            onPressed: audioPlayer.seekToPrevious,
            icon: const Icon(Icons.skip_previous_rounded),
            iconSize: 40,
            color: primaryColor,
        ),
        StreamBuilder<PlayerState>(
          stream: audioPlayer.playerStateStream,
          builder: (context, snapshots) {
            final playerState = snapshots.data;
            final processingState = playerState?.processingState;
            final playing = playerState?.playing;
            if (!(playing ?? false)) {
              return IconButton(
                onPressed: audioPlayer.play,
                icon: const Icon(Icons.play_arrow_rounded),
                iconSize: 60,
                color: primaryColor,
              );
            } else if (processingState != ProcessingState.completed) {
              return IconButton(
                onPressed: audioPlayer.pause,
                icon: const Icon(Icons.pause),
                iconSize: 60,
                color: primaryColor,
              );
            }
            return const Icon(
              Icons.play_arrow_rounded,
              size: 60,
              color: primaryColor,
            );
          },
        ),
        IconButton(
          onPressed: audioPlayer.seekToNext,
          icon: const Icon(Icons.skip_next_rounded),
          iconSize: 40,
          color: primaryColor,
        ),
      ],
    );
  }
}
