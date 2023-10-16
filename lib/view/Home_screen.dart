import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:spotify/Views/Catalogo.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _emailController = TextEditingController();

  bool _isGoogleSignIn = false;

  @override
  void initState() {
    super.initState();
    _signInWithGoogle(context);
  }

  Future<void> _signInWithGoogle(BuildContext context) async {
    try {
      await Firebase.initializeApp();

      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      if (googleUser != null) {
        final GoogleSignInAuthentication googleAuth = await googleUser.authentication;
        final AuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken,
          idToken: googleAuth.idToken,
        );

        final UserCredential userCredential = await FirebaseAuth.instance.signInWithCredential(credential);

        if (userCredential.user != null) {
          setState(() {
            _isGoogleSignIn = true;
            _emailController.text = userCredential.user!.email ?? '';
          });

          _showConfirmationDialog(context);
        }
      }
    } catch (error) {
    }
  }

  void _showConfirmationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Confirmar Inicio de Sesión'),
          content: const Text('¿Estás seguro de iniciar sesión con esta cuenta?'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                if (_isGoogleSignIn) {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const Catalogo()),
                  );
                }
              },
              child: const Text('Continuar'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancelar'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: const Text(
          'Crear cuenta',
          style: TextStyle(
            color: Colors.white,
            fontSize: 14.0,
          ),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const Text(
              '¿Cuál es tu email?',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24.0,
              ),
              textAlign: TextAlign.left,
            ),
            const SizedBox(height: 20.0),
            TextField(
              controller: _emailController,
              decoration: InputDecoration(
                fillColor: Colors.grey[900],
                filled: true,
                labelStyle: const TextStyle(
                  color: Colors.white,
                  fontSize: 18.0,
                ),
                enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey),
                ),
              ),
            ),
            const SizedBox(height: 20.0),
            const Text(
              'Tendrás que confirmar esta dirección de email más tarde.',
              style: TextStyle(
                color: Colors.white,
                fontSize: 12.0,
              ),
              textAlign: TextAlign.left,
            ),
            const SizedBox(height: 20.0),
            Align(
              alignment: Alignment.center,
              child: ElevatedButton(
                onPressed: () {
                  // Realizar la autenticación con email y contraseña aquí
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.grey,
                  onPrimary: Colors.black,
                  minimumSize: const Size(200, 50),
                ),
                child: const Text('Siguiente'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
