import 'package:flutter/material.dart';
import 'package:iglesia_app_1/pages/seleccion.dart';

void main() => runApp(const MiApp());

class MiApp extends StatelessWidget {
  // ignore: use_key_in_widget_constructors
  const MiApp({Key? key});

  @override
  Widget build(BuildContext context) {
    // ignore: deprecated_member_use
    return WillPopScope(
        onWillPop: () async {
          return !await Navigator.maybePop(context);
        },
        child: MaterialApp(
          title: "Material App",
          debugShowCheckedModeBanner: false,
          home: Navigator(
            onGenerateRoute: (settings) {
              return PageRouteBuilder(
                pageBuilder: (context, animation, secondaryAnimation) {
                  return Scaffold(
                    body: Stack(
                      fit: StackFit.expand,
                      children: [
                        Image.asset(
                          'assets/logo.png',
                          fit: BoxFit.cover,
                        ),
                        Positioned(
                          left: 120,
                          top: 825,
                          child: SizedBox(
                            width: 200, // Ancho del botón
                            height: 35, // Alto del botón
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const Seleccion(),
                                  ),
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    const Color.fromARGB(255, 255, 255, 255),
                                // Cambiar el color del fondo del botón aquí
                              ),
                              child: const Text(
                                "Iniciar juego",
                                style: TextStyle(
                                  color: Color.fromARGB(255, 1, 48, 84),
                                  // Cambiar el color del texto aquí
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
                transitionsBuilder:
                    (context, animation, secondaryAnimation, child) {
                  const begin = Offset(0.0, 1.0);
                  const end = Offset.zero;
                  const curve = Curves.ease;

                  var tween = Tween(begin: begin, end: end)
                      .chain(CurveTween(curve: curve));

                  return SlideTransition(
                    position: animation.drive(tween),
                    child: child,
                  );
                },
                transitionDuration: const Duration(milliseconds: 100),
              );
            },
          ),
        ));
  }
}
