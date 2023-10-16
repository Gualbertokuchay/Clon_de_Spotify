import 'package:flutter/material.dart';
import 'package:spotify/Class/ClasesImg.dart';


//Vista 100 Mexicano
class VistaCards extends StatelessWidget {
  const VistaCards({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          CardWithImage(
            imageAsset: 'assets/ExitosMexicanos.png',
            title: '',
            subtitle: 'Subtítulo 1',
          ),
          SizedBox(width: 8.0),
          CardWithImage(
            imageAsset: 'assets/Top50.png',
            title: 'Tarjeta 2',
            subtitle: 'Subtítulo 2',
          ),
          SizedBox(width: 8.0),
          CardWithImage(
            imageAsset: 'assets/Top50.png',
            title: 'Tarjeta 2',
            subtitle: 'Subtítulo 2',
          ),
          SizedBox(width: 8.0),
          CardWithImage(
            imageAsset: 'assets/Top50.png',
            title: 'Tarjeta 2',
            subtitle: 'Subtítulo 2',
          ),
          SizedBox(width: 8.0),
          CardWithImage(
            imageAsset: 'assets/Top50.png',
            title: 'Tarjeta 2',
            subtitle: 'Subtítulo 2',
          ),
          SizedBox(width: 8.0),
          CardWithImage(
            imageAsset: 'assets/Top50.png',
            title: 'Tarjeta 2',
            subtitle: 'Subtítulo 2',
          ),
          // Agrega más tarjetas aquí según sea necesario
        ],
      ),
    );
  }
}



//Vista lista 

class Vistas extends StatelessWidget {
  const Vistas({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          CardWithImage(
            imageAsset: 'assets/ExitosMexicanos.png',
            title: 'Tarjeta 1',
            subtitle: 'Subtítulo 1',
          ),
          SizedBox(width: 8.0),
          CardWithImage(
            imageAsset: 'assets/Top50.png',
            title: 'Tarjeta 2',
            subtitle: 'Subtítulo 2',
          ),
          SizedBox(width: 8.0),
          CardWithImage(
            imageAsset: 'assets/Top50.png',
            title: 'Tarjeta 2',
            subtitle: 'Subtítulo 2',
          ),
          SizedBox(width: 8.0),
          CardWithImage(
            imageAsset: 'assets/Top50.png',
            title: 'Tarjeta 2',
            subtitle: 'Subtítulo 2',
          ),
          SizedBox(width: 8.0),
          CardWithImage(
            imageAsset: 'assets/Top50.png',
            title: 'Tarjeta 2',
            subtitle: 'Subtítulo 2',
          ),
          SizedBox(width: 8.0),
          CardWithImage(
            imageAsset: 'assets/Top50.png',
            title: 'Tarjeta 2',
            subtitle: 'Subtítulo 2',
          ),
          // Agrega más tarjetas aquí según sea necesario
        ],
      ),
    );
  }
}
