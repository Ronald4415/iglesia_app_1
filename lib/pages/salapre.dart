import 'dart:math';
import 'package:flutter/material.dart';

class salapre extends StatelessWidget {
  final List<String> preguntas = [
    'Bautismo\n'
        '1.)¿Por qué recibimos el Espíritu Santo en el bautismo \n y luego otra vez en la confirmación?\n'
        'a) Porque su presencia en nosotros caduca.\n'
        'b) Para reforzar lo que recibimos y recibir lo que necesitamos.\n'
        'c) Porque así podemos celebrarlo dos veces.\n',
    '2.)\nCual fue la fruta prohibida que se comio Eva \n'
        'a)Pera\n'
        'b)Durazno\n'
        'd)Manzana',
    // Agrega más preguntas aquí según sea necesario
  ];

  String obtenerPreguntaAleatoria() {
    Random random = Random();
    int indice = random.nextInt(preguntas.length);
    return preguntas[indice];
  }

  @override
  Widget build(BuildContext context) {
    String preguntaAleatoria = obtenerPreguntaAleatoria();

    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          // Fondo
          Positioned.fill(
            child: Image.asset(
              'assets/preguntas.png', // Ruta de la imagen de fondo
              fit: BoxFit.cover,
            ),
          ),
          // Botón para regresar a la sala anterior
          Positioned(
            top: 20,
            left: 20,
            child: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
          // Contenido de la pantalla
          Center(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(
                preguntaAleatoria,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 0, 0, 0), // Color del texto
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
