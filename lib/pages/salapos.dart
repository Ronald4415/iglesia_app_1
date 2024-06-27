// ignore_for_file: library_private_types_in_public_api
import 'package:flutter/material.dart';

class salapos extends StatefulWidget {
  const salapos({super.key});

  @override
  _SalaposState createState() => _SalaposState();
}

class _SalaposState extends State<salapos> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    );
    _animation = Tween<double>(
      begin: 1.0,
      end: 0.5,
    ).animate(_controller);
    _controller.forward();
    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        Navigator.pop(context);
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (BuildContext context, Widget? child) {
        return Opacity(
          opacity: _animation.value,
          child: Stack(
            children: [
              Image.asset(
                'assets/Positivo.png',
                fit: BoxFit.cover,
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
              ),
              const Center(
                child: Text(
                  'Felicidades \n avanza 2 casillas',
                  style: TextStyle(
                    fontSize: 24,
                    color: Color.fromARGB(255, 0, 0, 0),
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Roboto',
                    decoration: TextDecoration.none,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
