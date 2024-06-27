import 'dart:ui';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:iglesia_app_1/data/data_imagenes.dart';
import 'package:iglesia_app_1/models/model_personajes.dart';
import 'package:iglesia_app_1/pages/salapri.dart';

class Seleccion extends StatefulWidget {
  const Seleccion({Key? key});

  @override
  State<Seleccion> createState() => _SeleccionState();
}

class _SeleccionState extends State<Seleccion> {
  int _currentCarouselIndex = 0;

  @override
  Widget build(BuildContext context) {
    // ignore: deprecated_member_use
    return WillPopScope(
      onWillPop: () async {
        // Aquí puedes manejar el botón de "atrás" del sistema para esta pantalla.
        // Por ejemplo, puedes volver a la pantalla anterior si hay una en la pila de navegación:
        if (Navigator.canPop(context)) {
          Navigator.pop(context);
          return false;
        }
        // Si no hay ninguna pantalla a la que volver, permite que la aplicación se cierre:
        return true;
      },
      child: Scaffold(
        body: Stack(
          fit: StackFit.expand,
          children: [
            Image.asset(
              'assets/fondosel.png',
              fit: BoxFit.cover,
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
            const SizedBox(height: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 40),
                Expanded(
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      // Imágenes a ambos lados del carrusel
                      Positioned(
                        left: 16,
                        child: Image.asset(
                          'assets/izquierda.png',
                          width: 50,
                          height: 50,
                        ),
                      ),
                      Positioned(
                        right: 16,
                        child: Image.asset(
                          'assets/derecha.png',
                          width: 50,
                          height: 50,
                        ),
                      ),
                      CarouselSlider.builder(
                        itemCount: carruselImages.length,
                        itemBuilder: (context, index, realIndex) {
                          final carruselImage = carruselImages[index];
                          return CardImages(
                            carruselImages: carruselImage,
                          );
                        },
                        options: CarouselOptions(
                          height: MediaQuery.of(context).size.height * 0.5,
                          autoPlay: false,
                          autoPlayCurve: Curves.easeOut,
                          enlargeCenterPage: true,
                          autoPlayInterval: const Duration(seconds: 0),
                          scrollDirection: Axis.horizontal,
                          disableCenter:
                              true, // Desactiva el ajuste automático al centro
                          onPageChanged: (index, reason) {
                            setState(() {
                              _currentCarouselIndex = index;
                            });
                          },
                        ),
                      ),
                      Positioned(
                        top: 90, // Ajusta la posición vertical del texto
                        left: 0,
                        right: 0,
                        child: Center(
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width * 0.8,
                            child: const Text(
                              'Elige tu personaje',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                height: 1.25,
                                color: Colors.white,
                                fontSize: 40, // Tamaño de fuente más grande
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                      // Botón con posición y tamaño personalizados
                      Positioned(
                        bottom: 60,
                        right: 130,
                        child: SizedBox(
                          width: 190,
                          height: 50,
                          child: ElevatedButton(
                            onPressed: () {
                              // Acción al presionar el botón
                              final selectedImage =
                                  carruselImages[_currentCarouselIndex];
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Salapri(
                                    image: selectedImage.image,
                                  ),
                                ),
                              );
                            },
                            child: const Text(
                              'Seleccionar',
                              style: TextStyle(
                                color: Colors.blue, // Cambia el color del texto
                                fontSize: 20, // Cambia el tamaño de la letra
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class CardImages extends StatelessWidget {
  final personajes carruselImages;
  const CardImages({Key? key, required this.carruselImages});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Center(
        child: Stack(
          alignment: Alignment.center,
          children: [
            ImageFiltered(
              imageFilter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
              child: Image.asset(
                carruselImages.image,
                fit: BoxFit.cover,
              ),
            ),
            Image.asset(
              carruselImages.image,
              fit: BoxFit.cover,
            ),
          ],
        ),
      ),
    );
  }
}
