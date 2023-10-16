import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spotify/Class/ClasesBotonMinimalista.dart';
import 'package:spotify/Class/ClasesScrollFormat.dart';
import 'package:spotify/Views/Biblioteca.dart';
import 'package:spotify/Views/Buscar.dart';
import 'package:spotify/Views/Perfiles.dart';
import 'package:spotify/Views/Spotify.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Catalogo extends StatelessWidget {
  const Catalogo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color(0xFF000000),
        primaryColor: Colors.white,
      ),
      home: CatalogoPage(),
    );
  }
}

class CatalogoPage extends StatefulWidget {
  @override
  _CatalogoPageState createState() => _CatalogoPageState();
}

class _CatalogoPageState extends State<CatalogoPage> {
  final RxInt _currentIndex = 0.obs;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  User? _user;

  @override
  void initState() {
    super.initState();
    _getUser();
  }

  Future<void> _getUser() async {
    final user = _auth.currentUser;
    if (user != null) {
      setState(() {
        _user = user;
      });
    }
  }

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex.value = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> _pages = [
      TwoCardsInRowWithText(),
      SpotifySearch(),
      Biblioteca(),
      Spotify(),
    ];

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            const SizedBox(height: 16.0),
            Row(
              children: <Widget>[
                if (_user != null)
                  GestureDetector(
                    onTap: () {
                      // Navegar a la pantalla de perfil cuando se toque la imagen de perfil
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => Perfil(),
                        ),
                      );
                    },
                    child: CircleAvatar(
                      backgroundImage: NetworkImage(_user!.photoURL ?? ''),
                      radius: 16.0,
                      backgroundColor: Colors.transparent,
                    ),
                  ),
                const SizedBox(width: 8.0),
                BotonMinimalista(
                  texto: 'Todos',
                  color: _currentIndex.value == 0
                      ? Colors.greenAccent
                      : Colors.black,
                  textColor: _currentIndex.value == 0
                      ? Colors.black
                      : Colors.white,
                  fontSize: 12,
                  onPressed: () => _onTabTapped(0),
                ),
                const SizedBox(width: 8.0),
                const SizedBox(width: 8.0),
                BotonMinimalista(
                  texto: 'Podcast y Programas',
                  color: _currentIndex.value == 1
                      ? Colors.greenAccent
                      : Colors.black,
                  textColor: _currentIndex.value == 1
                      ? Colors.black
                      : Colors.white,
                  fontSize: 12.0,
                  onPressed: () => _onTabTapped(1),
                ),
              ],
            ),
            Expanded(
              child: _pages[_currentIndex.value],
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex.value,
        onTap: _onTabTapped,
        items: [
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/Navbar/hogar.png',
              color: Colors.white,
              width: 30,
              height: 30,
            ),
            label: 'Inicio',
            backgroundColor: Colors.black,
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/Navbar/Buscar.png',
              color: Colors.white,
              width: 30,
              height: 30,
            ),
            label: 'Buscar',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/Navbar/biblioteca.png',
              color: Colors.white,
              width: 30,
              height: 30,
            ),
            label: 'Tu biblioteca',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/Navbar/spotify.png',
              color: Colors.white,
              width: 30,
              height: 30,
            ),
            label: 'Premium',
          ),
        ],
        backgroundColor: Colors.transparent,
      ),
    );
  }
}
