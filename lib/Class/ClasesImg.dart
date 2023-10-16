// Cards de Estacion popular
import 'package:flutter/material.dart';

Widget Card_imagenes() {
  return const SingleChildScrollView(
    scrollDirection: Axis.horizontal,
    child: Row(
      children: [
        ImageCard(imageAsset: 'assets/ThisPrinceRoyce.png'),
        SizedBox(width: 16.0), // Espacio entre las tarjetas
        ImageCard(imageAsset: 'assets/ThisRomeoSantos.png'),
        SizedBox(width: 16.0), // Espacio entre las tarjetas
        ImageCard(imageAsset: 'assets/ThisSwitf.png'),
        SizedBox(width: 16.0), // Espacio entre las tarjetas
        ImageCard(imageAsset: 'assets/ExitosMexicanos.png'),
        SizedBox(width: 16.0), // Espacio entre las tarjetas
        ImageCard(imageAsset: 'assets/ThisPrinceRoyce.png'),
        SizedBox(width: 16.0), // Espacio entre las tarjetas
        ImageCard(imageAsset: 'assets/ThisRomeoSantos.png'),
        SizedBox(width: 16.0), // Espacio entre las tarjetas
        ImageCard(imageAsset: 'assets/ThisSwitf.png'),
        SizedBox(width: 16.0), // Espacio entre las tarjetas
        ImageCard(imageAsset: 'assets/ExitosMexicanos.png'),
      ],
    ),
  );
}

class CardWithImage extends StatelessWidget {
  final String imageAsset;
  final String title;
  final String subtitle;

  const CardWithImage({
    super.key,
    required this.imageAsset,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      // Centra el contenido en la pantalla
      child: Card(
        color: Colors.transparent, // Hace que el Card sea transparente
        elevation: 3.0,
        child: Padding(
          padding: const EdgeInsets.all(3.0),
          child: Column(
            mainAxisSize:
                MainAxisSize.min, // Ajusta el tamaño según el contenido
            children: [
              SizedBox(
                width: 182,
                height: 188,
                child: Image.asset(
                  imageAsset,
                  fit: BoxFit.cover, // Ajusta la imagen para cubrir el espacio
                ),
              ),
              const SizedBox(height: 8.0),
              Text(
                title,
                style: const TextStyle(
                  fontSize:
                      19.5, // Ajusta el tamaño de fuente según tus preferencias
                  color: Colors.green,
                ),
              ),
              Text(
                subtitle,
                style: const TextStyle(fontSize: 20.0, color: Colors.white),
              ),
              const SizedBox(
                  height: 8.0), // Espacio entre el subtítulo y el nuevo texto
            ],
          ),
        ),
      ),
    );
  }
}

class ImageCard extends StatelessWidget {
  final String imageAsset;

  const ImageCard({
    super.key,
    required this.imageAsset,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.transparent, // Hace que el Card sea transparente
      elevation: 3.0,
      child: Padding(
        padding: const EdgeInsets.all(3.0),
        child: Column(
          mainAxisSize: MainAxisSize.min, // Ajusta el tamaño según el contenido
          children: [
            SizedBox(
              width: 182,
              height: 188,
              child: Image.asset(
                imageAsset,
                fit: BoxFit.cover, // Ajusta la imagen para cubrir el espacio
              ),
            ),
            const SizedBox(height: 8.0),
          ],
        ),
      ),
    );
  }
}
