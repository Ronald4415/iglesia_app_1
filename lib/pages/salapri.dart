// ignore_for_file: unnecessary_null_comparison

import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:chewie/chewie.dart';
import 'package:iglesia_app_1/pages/salamedio.dart';
import 'package:iglesia_app_1/pages/salaneg.dart';
import 'package:iglesia_app_1/pages/salapos.dart';
import 'package:iglesia_app_1/pages/salapre.dart';
import 'package:iglesia_app_1/pages/salareto.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Salapri(image: 'assets/logo.png'),
    );
  }
}

class Salapri extends StatefulWidget {
  final String image;

  const Salapri({Key? key, required this.image}) : super(key: key);

  @override
  _SalapriState createState() => _SalapriState();
}

class _SalapriState extends State<Salapri> {
  QRViewController? controller;
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  bool isControllerInitialized = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/fondo2.png',
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            top: 80,
            left: MediaQuery.of(context).size.width / 8,
            child: Padding(
              padding: const EdgeInsets.all(80),
              child: Image.asset(
                widget.image,
                width: 180,
                height: 200,
              ),
            ),
          ),
          Positioned(
            bottom: 280,
            left: 30,
            right: 50,
            child: Image.asset(
              'assets/bautismo.png',
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            top: 105,
            left: 0,
            right: 0,
            child: Center(
              child: Text(
                'BAUTISMO',
                style: TextStyle(
                  fontSize: 45,
                  color: const Color.fromARGB(255, 0, 0, 0),
                  fontFamily: 'Roman',
                ),
              ),
            ),
          ),
          Positioned(
            top: 155,
            left: 30,
            right: 30,
            child: Container(
              height: 1,
              color: Colors.black,
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 50),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => salapre()),
                      ),
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: const Color.fromARGB(255, 1, 48, 84),
                        fixedSize: const Size(150, 10),
                      ),
                      child: const Text(
                        'PREGUNTAS',
                        style: TextStyle(fontFamily: 'LeBoton'),
                      ),
                    ),
                    const SizedBox(width: 70),
                    ElevatedButton(
                      onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => salareto()),
                      ),
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: const Color.fromARGB(255, 1, 48, 84),
                        fixedSize: const Size(150, 10),
                      ),
                      child: const Text(
                        'RETO',
                        style: TextStyle(fontFamily: 'LeBoton'),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => salaneg()),
                      ),
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: const Color.fromARGB(255, 1, 48, 84),
                        fixedSize: const Size(150, 10),
                      ),
                      child: const Text(
                        '- 1 CASILLA',
                        style: TextStyle(fontFamily: 'LeBoton'),
                      ),
                    ),
                    const SizedBox(width: 70),
                    ElevatedButton(
                      onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => salapos()),
                      ),
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: const Color.fromARGB(255, 1, 48, 84),
                        fixedSize: const Size(150, 10),
                      ),
                      child: const Text(
                        '+ 2 CASILLAS',
                        style: TextStyle(fontFamily: 'LeBoton'),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 30),
                ElevatedButton(
                  onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SalaMedio()),
                  ),
                  style: ElevatedButton.styleFrom(
                    foregroundColor: const Color.fromARGB(255, 1, 48, 84),
                    backgroundColor: const Color.fromARGB(255, 253, 209, 67),
                    fixedSize: const Size(160, 10),
                  ),
                  child: const Text(
                    'SIGUIENTE SALA',
                    style: TextStyle(fontSize: 12, fontFamily: 'LeBoton'),
                  ),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 70),
              child: ElevatedButton(
                onPressed: () async {
                  if (controller != null && isControllerInitialized) {
                    await controller!.toggleFlash();
                  }
                },
                style: ElevatedButton.styleFrom(
                  shape: const CircleBorder(),
                  backgroundColor: const Color.fromARGB(255, 1, 48, 84),
                ),
                child: const CircleAvatar(
                  backgroundImage: AssetImage('assets/codqr.png'),
                  radius: 30,
                ),
              ),
            ),
          ),
          Positioned(
            top: 9,
            left: 0,
            child: Image.asset(
              'assets/logo2.png',
              width: 200,
              height: 130,
            ),
          ),
        ],
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _initializeController();
  }

  void _initializeController() {
    // Obtener el estado de QRView
    final qrViewState = qrKey.currentState as _qrViewState?; // Corrección aquí
    if (qrViewState != null) {
      // Obtener el controlador del estado de QRView
      controller = qrViewState.controller;
      if (controller != null) {
        controller!.scannedDataStream.listen((scanData) {
          String? qrResult = scanData.code;
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => VideoScreen(qrResult!)),
          );
        });
        setState(() {
          isControllerInitialized =
              true; // Actualizar el estado de inicialización
        });
      }
    }
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}

class BarcodeFormats {
  static qr() {}
}

class QRScannerScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _QRScannerScreenState();
}

class _QRScannerScreenState extends State<QRScannerScreen> {
  late QRViewController controller;
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Escanea el código QR'),
      ),
      body: QRView(
        key: qrKey,
        onQRViewCreated: _onQRViewCreated,
      ),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) {
      String? qrResult = scanData.code;
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => VideoScreen(qrResult!)),
      );
    });
  }
}

class VideoScreen extends StatefulWidget {
  final String qrResult;

  const VideoScreen(this.qrResult, {Key? key}) : super(key: key);

  @override
  _VideoScreenState createState() => _VideoScreenState();
}

class _VideoScreenState extends State<VideoScreen> {
  late VideoPlayerController _videoPlayerController;
  ChewieController? _chewieController;

  @override
  void initState() {
    super.initState();
    _videoPlayerController =
        VideoPlayerController.asset('assets/videobautizo.mp4');
    _initializeVideoPlayer();
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    _chewieController?.dispose();
    super.dispose();
  }

  void _initializeVideoPlayer() async {
    await _videoPlayerController.initialize();
    setState(() {
      _chewieController = ChewieController(
        videoPlayerController: _videoPlayerController,
        autoPlay: true,
        looping: true,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Reproducción de Video'),
      ),
      body: Center(
        child: _chewieController != null &&
                _chewieController!.videoPlayerController.value.isInitialized
            ? Chewie(
                controller: _chewieController!,
              )
            : const CircularProgressIndicator(),
      ),
    );
  }
}
