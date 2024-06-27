import 'package:flutter/material.dart';

class salareto extends StatefulWidget {
  const salareto({Key? key}) : super(key: key);

  @override
  _SalaretoState createState() => _SalaretoState();
}

class _SalaretoState extends State<salareto>
    with SingleTickerProviderStateMixin {
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
      end: 0.3,
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
          child: Scaffold(
            body: Stack(
              fit: StackFit.expand,
              children: [
                Image.asset(
                  'assets/reto.png',
                  fit: BoxFit.cover,
                ),
                const Center(
                  child: Text(
                    'Debes cumplir el \n reto que te va a proponer \nx persona',
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
          ),
        );
      },
    );
  }
}
