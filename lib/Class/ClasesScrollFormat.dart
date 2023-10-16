import 'package:flutter/material.dart';
import 'package:spotify/Class/ClasesImg.dart';
import 'package:spotify/Views/Cards.dart';
import 'package:spotify/img/imgB.dart';
import 'package:spotify/img/imgJ.dart';
import 'package:spotify/img/imgM.dart';
import 'package:spotify/img/imgN.dart';
import 'package:spotify/img/imgP.dart';

class TwoCardsInRowWithText extends StatelessWidget {
  TwoCardsInRowWithText({Key? key});

  final List<String> artistImages = [
    'assets/badboni.png',
    'assets/juniorH.png',
    'assets/Natael.png',
    'assets/pesopluma.png',
    'assets/ThisMana.png',
    // Agrega más rutas de imágenes según sea necesario
  ];

  // Lista de rutas de pantalla correspondientes a cada imagen
  final List<Widget Function()> screenRoutes = [
    () => Badboni(), // Reemplaza NuevaPantalla1() con la pantalla correspondiente
    () => Junior(), // Reemplaza NuevaPantalla2() con la pantalla correspondiente
    () => Natael(), // Reemplaza NuevaPantalla3() con la pantalla correspondiente
    () => Pesopluma(), // Reemplaza NuevaPantalla4() con la pantalla correspondiente
    () => Mana(), // Reemplaza NuevaPantalla5() con la pantalla correspondiente
    // Agrega más rutas de pantalla según sea necesario
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 16.0,
          ),
          const Text(
            ' Lista',
            style: TextStyle(color: Colors.white, fontSize: 25.0),
          ),
          const SizedBox(
            height: 16.0,
          ),
          Vistas(),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
            child: Text(
              'Estaciones populares',
              style: TextStyle(color: Colors.white, fontSize: 20.0),
            ),
          ),
          const SizedBox(height: 0.0),
          Card_imagenes(),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
            child: Text(
              'Artistas Populares',
              style: TextStyle(color: Colors.white, fontSize: 20.0),
            ),
          ),
          const SizedBox(height: 0.0),
          Container(
            height: 180,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: artistImages.length,
              itemBuilder: (context, index) {
                return _buildCircularImage(context, index, 170.0);
              },
            ),
          ),
          const SizedBox(
            height: 16.0,
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
            child: Text(
              '100% Mexicano',
              style: TextStyle(color: Colors.white, fontSize: 20.0),
            ),
          ),
          VistaCards(),
        ],
      ),
    );
  }

  void _navigateToNewScreen(BuildContext context, int index) {
    if (index >= 0 && index < screenRoutes.length) {
      // Navega a la pantalla correspondiente cuando se toca la imagen
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => screenRoutes[index]()),
      );
    }
  }

  Widget _buildCircularImage(BuildContext context, int index, double size) {
    return GestureDetector(
      onTap: () {
        _navigateToNewScreen(context, index);
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          width: size,
          height: size,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white,
            image: DecorationImage(
              image: AssetImage(artistImages[index]),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
