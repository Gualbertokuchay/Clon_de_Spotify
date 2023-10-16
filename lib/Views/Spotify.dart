import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Spotify extends StatefulWidget {
  const Spotify({Key? key}) : super(key: key);

  @override
  _SpotifyState createState() => _SpotifyState();
}

class _SpotifyState extends State<Spotify> {
  final RxBool isPurchased = false.obs; // Variable observada para la animación

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            expandedHeight: 200.0,
            floating: false,
            pinned: false,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.network(
                'https://m.media-amazon.com/images/I/31L0q10HN4L.jpg',
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                SizedBox(height: 16),
                Text(
                  'Elige tu plan Premium:',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 16),
                PlanCard(
                  title: 'Plan Individual',
                  description: 'Disfruta de música sin anuncios, descargas offline y más.',
                  price: '\$9.99/mes',
                  isPurchased: isPurchased,
                ),
                PlanCard(
                  title: 'Plan Familiar',
                  description: 'Hasta 6 cuentas individuales, sin anuncios y descargas offline.',
                  price: '\$14.99/mes',
                  isPurchased: isPurchased,
                ),
                PlanCard(
                  title: 'Plan Estudiante',
                  description: 'Spotify Premium por mitad de precio para estudiantes.',
                  price: '\$4.99/mes',
                  isPurchased: isPurchased,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class PlanCard extends StatelessWidget {
  final String title;
  final String description;
  final String price;
  final RxBool isPurchased;

  PlanCard({
    required this.title,
    required this.description,
    required this.price,
    required this.isPurchased,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Card(
        elevation: 3,
        margin: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(16),
              child: Text(
                title,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                description,
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
            ),
            SizedBox(height: 16),
            Padding(
              padding: EdgeInsets.all(16),
              child: Text(
                price,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            ElevatedButton(
              onPressed: isPurchased.value
                  ? null // Deshabilita el botón después de la compra
                  : () {
                      // Agrega la lógica para comprar este plan
                      isPurchased.value = true; // Activa la animación de compra
                      Future.delayed(Duration(seconds: 2), () {
                        // Simula una pausa de 2 segundos para mostrar el mensaje
                        Get.snackbar(
                          '¡Gracias!',
                          'Has comprado el plan $title. ¡Disfrútalo!',
                        );
                      });
                    },
              child: isPurchased.value
                  ? Text('Comprado') // Cambia el texto del botón después de la compra
                  : Text('Comprar'),
            ),
          ],
        ),
      );
    });
  }
}
