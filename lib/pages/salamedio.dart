// ignore_for_file: avoid_print

import 'package:flutter/material.dart';

// ignore: use_key_in_widget_constructors
class SalaMedio extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          _buildBackgroundImage(),
          _buildLogo(),
          _buildButtons(),
          _buildBottomButton(context),
        ],
      ),
    );
  }

  Widget _buildBackgroundImage() {
    return Stack(
      fit: StackFit.expand,
      children: [
        Image.asset(
          'assets/fondo2.png',
          fit: BoxFit.cover,
        ),
        const Positioned(
          top: 120, // Ajusta la posición vertical de la línea y el texto
          left: 0,
          right: 0,
          child: Center(
            child: Text(
              'Preguntas',
              style: TextStyle(
                color: Colors.black,
                fontSize: 30, // Tamaño del texto
                fontWeight: FontWeight.bold, // Negrita
              ),
            ),
          ),
        ),
        Positioned(
          top: 170, // Ajusta la posición vertical de la línea
          left: 20,
          right: 20,
          child: Container(
            height: 2, // Ajusta el grosor de la línea
            color: Colors.amber, // Color dorado
          ),
        ),

        // Líneas debajo de los botones de arriba
        Positioned(
          top: 480, // Ajusta la posición vertical de la línea
          left: 20,
          right: 20,
          child: Container(
            height: 2, // Ajusta el grosor de la línea
            color: Colors.amber, // Color de la línea
          ),
        ),
        Positioned(
          top: 420, // Ajusta la posición vertical de la línea
          left: 20,
          right: 20,
          child: Container(
            height: 2, // Ajusta el grosor de la línea
            color: Colors.amber, // Color de la línea
          ),
        ),

        // Texto "Esta es tu sala"
        const Positioned(
          top: 435, // Ajusta la posición vertical del texto
          left: 0,
          right: 0,
          child: Center(
            child: Text(
              '¿Cual es tu sala ?',
              style: TextStyle(
                color: Colors.black,
                fontSize: 30, // Tamaño del texto
                fontWeight: FontWeight.bold, // Negrita
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildLogo() {
    return Positioned(
      top: 9,
      left: 0,
      child: Image.asset(
        'assets/logo2.png',
        width: 200,
        height: 130,
      ),
    );
  }

  Widget _buildButtons() {
    return Stack(
      children: [
        // Botón 1
        Positioned(
          top: 190,
          left: 80,
          child: _buildButton(
            color: const Color.fromRGBO(245, 163, 160, 1),
            onPressed: () {
              _handleButtonPressed(1);
            },
          ),
        ),
        // Botón 2
        Positioned(
          top: 190,
          left: 200,
          child: _buildButton(
            color: const Color.fromRGBO(244, 217, 79, 1),
            onPressed: () {
              _handleButtonPressed(2);
            },
          ),
        ),
        // Botón 3
        Positioned(
          top: 190,
          left: 320,
          child: _buildButton(
            color: const Color.fromRGBO(0, 104, 56, 1),
            onPressed: () {
              _handleButtonPressed(3);
            },
          ),
        ),
        // Botón 4
        Positioned(
          top: 270,
          left: 80,
          child: _buildButton(
            color: const Color.fromRGBO(164, 28, 32, 1),
            onPressed: () {
              _handleButtonPressed(4);
            },
          ),
        ),
        // Botón 5
        Positioned(
          top: 270,
          left: 200,
          child: _buildButton(
            color: const Color.fromARGB(255, 0, 0, 0),
            onPressed: () {
              _handleButtonPressed(5);
            },
          ),
        ),
        // Botón 6
        Positioned(
          top: 270,
          left: 320,
          child: _buildButton(
            color: const Color.fromRGBO(0, 171, 236, 1),
            onPressed: () {
              _handleButtonPressed(6);
            },
          ),
        ),
        // Botón 7 con contorno negro
        Positioned(
          top: 350,
          left: 140,
          child: _buildOutlinedButton(
            color: const Color.fromARGB(255, 255, 255, 255),
            onPressed: () {
              _handleButtonPressed(7);
            },
          ),
        ),
        // Botón 8
        Positioned(
          top: 350,
          left: 260,
          child: _buildButton(
            color: const Color.fromARGB(255, 255, 0, 212),
            onPressed: () {
              _handleButtonPressed(8);
            },
          ),
        ),

        // Botones de la parte de abajo
        Positioned(
          top: 520,
          left: 80,
          child: _buildButton(
            color: const Color.fromRGBO(245, 163, 160, 1),
            onPressed: () {
              _handleButtonPressed(1);
            },
          ),
        ),
        // Botón 2
        Positioned(
          top: 520,
          left: 200,
          child: _buildButton(
            color: const Color.fromRGBO(244, 217, 79, 1),
            onPressed: () {
              _handleButtonPressed(2);
            },
          ),
        ),
        // Botón 3
        Positioned(
          top: 520,
          left: 320,
          child: _buildButton(
            color: const Color.fromRGBO(0, 104, 56, 1),
            onPressed: () {
              _handleButtonPressed(3);
            },
          ),
        ),
        // Botón 4
        Positioned(
          top: 600,
          left: 80,
          child: _buildButton(
            color: const Color.fromRGBO(164, 28, 32, 1),
            onPressed: () {
              _handleButtonPressed(4);
            },
          ),
        ),
        // Botón 5
        Positioned(
          top: 600,
          left: 200,
          child: _buildButton(
            color: const Color.fromARGB(255, 0, 0, 0),
            onPressed: () {
              _handleButtonPressed(5);
            },
          ),
        ),
        // Botón 6
        Positioned(
          top: 600,
          left: 320,
          child: _buildButton(
            color: const Color.fromRGBO(0, 171, 236, 1),
            onPressed: () {
              _handleButtonPressed(6);
            },
          ),
        ),
        // Botón 7 con contorno negro
        Positioned(
          top: 680,
          left: 200,
          child: _buildButton(
            color: const Color.fromARGB(255, 157, 79, 245),
            onPressed: () {
              _handleButtonPressed(7);
            },
          ),
        ),
      ],
    );
  }

  Widget _buildButton({
    required Color color,
    required VoidCallback onPressed,
  }) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }

  Widget _buildOutlinedButton({
    required Color color,
    required VoidCallback onPressed,
  }) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black, width: 2),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Container(
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }

  Widget _buildBottomButton(BuildContext context) {
    return Positioned(
      bottom: 20,
      left: MediaQuery.of(context).size.width / 2 - 50,
      child: ElevatedButton(
        onPressed: () {
          // Acción al presionar el botón
          _handleButtonPressed(9);
        },
        child: const Text('Botón Inferior'),
      ),
    );
  }

  void _handleButtonPressed(int buttonIndex) {
    // Función que maneja el evento de presionar un botón
    print('Botón $buttonIndex presionado');
  }
}

void main() {
  runApp(MaterialApp(
    home: SalaMedio(),
  ));
}
