import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:spotify/Views/PerfilesCards.dart';
import 'package:spotify/view/Home.dart';

class Perfil extends StatefulWidget {
  const Perfil({Key? key}) : super(key: key);

  @override
  _PerfilState createState() => _PerfilState();
}

class _PerfilState extends State<Perfil> {
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

void _signOut() {
  Get.offAll(Home()); // Navega a la pantalla de inicio en lugar de cerrar la sesión
}

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.black,
      child: ListView(
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.black,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 10),
                CircleAvatar(
                  radius: 35.4,
                  backgroundImage: _user?.photoURL != null
                      ? NetworkImage(_user!.photoURL!)
                      : AssetImage('assets/Perfil.png') as ImageProvider,
                ),
                Text(
                  _user?.displayName ?? 'Nombre de Usuario',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  _user?.email ?? '',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 60),
          ListTile(
            leading: ColorFiltered(
              colorFilter: ColorFilter.mode(
                Colors.white,
                BlendMode.srcIn,
              ),
              child: Image.asset(
                'assets/Novedades.png',
                width: 24,
              ),
            ),
            title: Text('Mi Perfil'),
            onTap: () {
              Navigator.pop(context);
              // Usa la función _navigateToMiPerfil o navega a tu pantalla de perfil personalizada
            },
          ),
          ListTile(
            leading: ColorFiltered(
              colorFilter: ColorFilter.mode(
                Colors.white,
                BlendMode.srcIn,
              ),
              child: Image.asset(
                'assets/Historia.png',
                width: 24,
              ),
            ),
            title: Text('Configuración'),
            onTap: () {
              Navigator.pop(context);
              // Navega a la pantalla de configuración
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      ConfiguracionScreen(), // Reemplaza con el nombre de tu pantalla de configuración
                ),
              );
            },
          ),
          ListTile(
            leading: ColorFiltered(
              colorFilter: ColorFilter.mode(
                Colors.white,
                BlendMode.srcIn,
              ),
              child: Image.asset(
                'assets/configuracion.png',
                width: 24,
              ),
            ),
            title: Text('Cerrar Sesión'),
            onTap: _signOut, // Cierra sesión al tocar este botón
          ),
        ],
      ),
    );
  }
}
