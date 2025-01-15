import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(LaunchApp(
    title: 'Launch Pad',
  ));
}

class LaunchApp extends StatelessWidget {
  const LaunchApp({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: title,
      home: LaunchHome(
        title: title,
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}

class LaunchHome extends StatefulWidget {
  const LaunchHome({super.key, required this.title});
  final String title;

  @override
  State<LaunchHome> createState() => _LaunchHomeState();
}

class _LaunchHomeState extends State<LaunchHome> {
  final List<Color> centerColor = [
    Color(0xffADCBFC),
    Color(0xffff2525),
    Color(0xffE247FC),
  ];
  final List<Color> outlineColor = [
    Color(0xff067CCB),
    Color(0xffc40050),
    Color(0xffA23AB7),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.greenAccent,
        title: Text(
          widget.title,
          style: GoogleFonts.orbitron(
            color: Colors.tealAccent,
            backgroundColor: Colors.black,
          ),
        ),
      ),
      body: Center(
        child: Wrap(
          spacing: 6.0,
          runSpacing: 6.0,
          children: [
            Pad(
              centerColor: centerColor[0],
              outlineColor: outlineColor[0],
              nodes: '1.mp3',
            ),
            Pad(
              centerColor: centerColor[1],
              outlineColor: outlineColor[1],
              nodes: '2.mp3',
            ),
            Pad(
              centerColor: centerColor[0],
              outlineColor: outlineColor[0],
              nodes: '3.mp3',
            ),
            Pad(
              centerColor: centerColor[2],
              outlineColor: outlineColor[2],
              nodes: '4.mp3',
            ),
            Pad(
              centerColor: centerColor[0],
              outlineColor: outlineColor[0],
              nodes: '5.mp3',
            ),
            Pad(
              centerColor: centerColor[1],
              outlineColor: outlineColor[1],
              nodes: '6.mp3',
            ),
            Pad(
              centerColor: centerColor[0],
              outlineColor: outlineColor[0],
              nodes: '7.mp3',
            ),
            Pad(
              centerColor: centerColor[2],
              outlineColor: outlineColor[2],
              nodes: '8.mp3',
            ),
            Pad(
              centerColor: centerColor[0],
              outlineColor: outlineColor[0],
              nodes: '9.mp3',
            ),
            Pad(
              centerColor: centerColor[1],
              outlineColor: outlineColor[1],
              nodes: '10.mp3',
            ),
            Pad(
              centerColor: centerColor[0],
              outlineColor: outlineColor[0],
              nodes: '11.mp3',
            ),
            Pad(
              centerColor: centerColor[2],
              outlineColor: outlineColor[2],
              nodes: '12.mp3',
            ),
            Pad(
              centerColor: centerColor[0],
              outlineColor: outlineColor[0],
              nodes: '13.mp3',
            ),
            Pad(
              centerColor: centerColor[1],
              outlineColor: outlineColor[1],
              nodes: '14.mp3',
            ),
            Pad(
              centerColor: centerColor[0],
              outlineColor: outlineColor[0],
              nodes: '15.mp3',
            ),
            Pad(
              centerColor: centerColor[2],
              outlineColor: outlineColor[2],
              nodes: '16.mp3',
            ),
            Pad(
              centerColor: centerColor[0],
              outlineColor: outlineColor[0],
              nodes: '17.mp3',
            ),
            Pad(
              centerColor: centerColor[1],
              outlineColor: outlineColor[1],
              nodes: '18.mp3',
            ),
            Pad(
              centerColor: centerColor[0],
              outlineColor: outlineColor[0],
              nodes: '19.mp3',
            ),
            Pad(
              centerColor: centerColor[2],
              outlineColor: outlineColor[2],
              nodes: '20.wav',
            ),
            Pad(
              centerColor: centerColor[0],
              outlineColor: outlineColor[0],
              nodes: '21.mp3',
            ),
            Pad(
              centerColor: centerColor[1],
              outlineColor: outlineColor[1],
              nodes: '22.wav',
            ),
            Pad(
              centerColor: centerColor[0],
              outlineColor: outlineColor[0],
              nodes: '23.wav',
            ),
            Pad(
              centerColor: centerColor[2],
              outlineColor: outlineColor[2],
              nodes: '24.wav',
            ),
            Pad(
              centerColor: centerColor[0],
              outlineColor: outlineColor[0],
              nodes: '25.wav',
            ),
            Pad(
              centerColor: centerColor[1],
              outlineColor: outlineColor[1],
              nodes: '26.wav',
            ),
            Pad(
              centerColor: centerColor[0],
              outlineColor: outlineColor[0],
              nodes: '27.wav',
            ),
            Pad(
              centerColor: centerColor[2],
              outlineColor: outlineColor[2],
              nodes: '28.wav',
            ),
          ],
        ),
      ),
    );
  }
}

class Pad extends StatefulWidget {
  const Pad({
    super.key,
    required this.centerColor,
    required this.outlineColor,
    required this.nodes,
  });
  final Color centerColor;
  final Color outlineColor;
  final String nodes;

  @override
  State<Pad> createState() => _PadState();
}

class _PadState extends State<Pad> {
  late Color _centerColor;
  late Color _outlineColor;
  final AudioPlayer player = AudioPlayer();

  @override
  void initState() {
    super.initState();
    _centerColor = widget.centerColor;
    _outlineColor = widget.outlineColor;
  }

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;
    return GestureDetector(
      onTap: () async {
        setState(() {
          _centerColor = Colors.white;
          _outlineColor = Colors.white;
          player.play(AssetSource(widget.nodes));
        });

        await Future.delayed(const Duration(milliseconds: 500));

        setState(() {
          _centerColor = widget.centerColor;
          _outlineColor = widget.outlineColor;
        });
      },
      child: Container(
        width: width / 4.3,
        height: height / 8.2,
        decoration: BoxDecoration(
          gradient: RadialGradient(
            colors: [_centerColor, _outlineColor],
            radius: 0.5,
          ),
          borderRadius: BorderRadius.circular(10.0),
          boxShadow: [
            BoxShadow(color: Colors.pink, blurRadius: 5.0),
          ],
        ),
      ),
    );
  }
}
