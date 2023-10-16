import 'package:flutter/material.dart';
import 'package:spotify/Class/ClasesImg.dart';

class TabbarView4 extends StatelessWidget {
  const TabbarView4({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TabBarView(
        children: [
          Container(
            padding: EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Descripción del artista:',
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Badboni es un artista de renombre con una larga carrera en la industria musical...',
                    style: TextStyle(
                      fontSize: 14.0,
                    ),
                  ),
                  SizedBox(height: 20.0),
                  Text(
                    'Selección del artista:',
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 20.0),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.2,
                    child: Card(
                      elevation: 2.0,
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/Badcard.png'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20.0),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Lanzamientos Populares',
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 12.0),
                      _buildLanzamientoCard(
                          'assets/Top50.png', 'Título 1', 'Subtítulo 1'),
                      _buildLanzamientoCard(
                          'assets/Top50.png', 'Título 2', 'Subtítulo 2'),
                      _buildLanzamientoCard(
                          'assets/Top50.png', 'Título 3', 'Subtítulo 3'),
                      _buildLanzamientoCard(
                          'assets/Top50.png', 'Título 4', 'Subtítulo 4'),
                      SizedBox(
                          height: 6.0), // Espacio entre los cards y el texto
                      Center(
                        child: Text(
                          'Ver Discografía',
                          style: TextStyle(
                            fontSize: 12.9,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Text(
                    'Con Badboni',
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Card_imagenes(),
                  Text(
                    'Acerca de',
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  _buildLargeCard(
                    'assets/Top50.png',
                    'Título del Card Grande',
                    'Subtítulo 1',
                    'Subtítulo 2',
                  ),
                ],
              ),
            ),
          ),
          Center(
            child: Column(
              children: [
                EventosSection(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class EventosSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          // Ejemplo de evento
          EventoWidget(
            nombre: 'Concierto en vivo',
            fecha: '15 de octubre de 2023',
            hora: '19:00 - 21:00',
          ),
          EventoWidget(
            nombre: 'Concierto en vivo',
            fecha: '15 de octubre de 2023',
            hora: '19:00 - 21:00',
          ),
          EventoWidget(
            nombre: 'Concierto en vivo',
            fecha: '15 de octubre de 2023',
            hora: '19:00 - 21:00',
          ),
        ],
      ),
    );
  }
}

class EventoWidget extends StatelessWidget {
  final String nombre;
  final String fecha;
  final String hora;

  EventoWidget({
    required this.nombre,
    required this.fecha,
    required this.hora,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2.0,
      margin: EdgeInsets.all(11.0),
      child: Container(
        width: double.infinity, // Ancho máximo
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  nombre,
                  style: TextStyle(
                    fontSize: 10.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8.0),
                Text('Fecha: $fecha'),
                Text('Hora: $hora'),
                // Agrega más contenido aquí si es necesario
              ],
            ),
          ),
        ),
      ),
    );
  }
}

//Wiget de los Cards Verticales
Widget _buildLanzamientoCard(String imagePath, String title, String subtitle) {
  return Card(
    elevation: 1.0,
    margin: EdgeInsets.only(bottom: 13.0),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 100.0,
          width: 100.0,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(imagePath),
              fit: BoxFit.cover,
            ),
          ),
        ),
        SizedBox(width: 8.0), // Espacio entre la imagen y el texto
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              subtitle,
              style: TextStyle(
                fontSize: 20.0,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ],
    ),
  );
}

//cards de Acerca de: 
Card _buildLargeCard(String imagePath, String title, String subtitle1, String subtitle2) {
  return Card(
    elevation: 2.0,
    margin: EdgeInsets.symmetric(vertical: 16.0),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 120.0,
          height: 120.0,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
              image: AssetImage(imagePath),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8.0),
                Text(
                  subtitle1,
                  style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.grey,
                  ),
                ),
                SizedBox(height: 8.0),
                Text(
                  subtitle2,
                  style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
        ),
        Icon(
          Icons.arrow_forward,
          size: 24.0,
          color: Colors.grey,
        ),
      ],
    ),
  );
}
