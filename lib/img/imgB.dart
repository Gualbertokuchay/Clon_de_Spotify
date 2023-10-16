import 'package:flutter/material.dart';

import 'package:spotify/Class/classTabarB.dart';

class Badboni extends StatefulWidget {
  const Badboni({Key? key}) : super(key: key);

  @override
  State<Badboni> createState() => _BadboniState();
}

class _BadboniState extends State<Badboni> {

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      initialIndex: 0,
      child: Scaffold(
        body: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                expandedHeight: 350.0,
                backgroundColor: Colors.transparent,
                floating: false,
                pinned: true,
                flexibleSpace: FlexibleSpaceBar(
                  background: Image.asset(
                    'assets/badboni.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ];
          },
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  '28.6 M oyentes mensuales',
                  style: TextStyle(
                    fontSize: 10.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            primary: Colors.black,
                            onPrimary: Colors.white,
                            side: BorderSide(color: Colors.white),
                          ),
                          child: Text('Seguir'),
                        ),
                        PopupMenuButton(
                          itemBuilder: (BuildContext context) {
                            return <PopupMenuEntry>[
                              PopupMenuItem(
                                child: Text('Opción 1'),
                                // Agrega la lógica para la opción 1 aquí
                              ),
                              PopupMenuItem(
                                child: Text('Opción 2'),
                                // Agrega la lógica para la opción 2 aquí
                              ),
                            ];
                          },
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.shuffle,
                          color: Colors.green,
                          size: 40.0,
                        ),
                        Icon(
                          Icons.play_arrow,
                          color: Colors.green,
                          size: 40.0,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              TabBar(
                tabs: [
                  Tab(text: 'Música'),
                  Tab(text: 'Eventos'),
                ],
                labelColor: Colors.white,
                unselectedLabelColor: Colors.grey,
                indicatorColor: Colors.green,
                onTap: (index) {
                  setState(() {
                  });
                },
              ),
              TabbarView(),
            ],
          ),
        ),
      ),
    );
  }
}

