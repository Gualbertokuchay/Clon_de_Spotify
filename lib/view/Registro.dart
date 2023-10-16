// ignore_for_file: file_names, use_build_context_synchronously

import 'package:flutter/foundation.dart' show Key, kDebugMode;
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:spotify/Views/Catalogo.dart';
import 'package:spotify/view/Home_screen.dart';
import 'Login.dart' show Login;

class Registro extends StatelessWidget {
  const Registro({Key? key}) : super(key: key);

  Future<void> _signInWithGoogle(BuildContext context) async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      if (googleUser == null) {
        if (kDebugMode) {
          print("El Usuario cancelo la autenticacion");
        }
        return;
      }

      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      final UserCredential authResult =
          await FirebaseAuth.instance.signInWithCredential(credential);
      final User? user = authResult.user;

      if (user != null) {
        _redirectToHomeScreen(context);
      }
    } catch (error) {
      if (kDebugMode) {
        print("Error al registrar los datos");
      }
    }
  }

  void _redirectToHomeScreen(BuildContext context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const Catalogo()),
    );
  }

  @override
  Widget build(BuildContext context) {
    const Color spotifyGreen = Color(0xFF1DB954);
    final Color borderColor = Colors.white.withOpacity(1.0);

    return Scaffold(
      body: Container(
        color: Colors.black,
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 80.0),
                Image.asset(
                  'assets/spotify.png',
                  width: 55.0,
                  height: 55.0,
                ),
                const SizedBox(height: 160.0),
                const Text(
                  'Millones de canciones',
                  style: TextStyle(fontSize: 22.0, color: Colors.white),
                ),
                const Text(
                  'Gratis en Spotify.',
                  style: TextStyle(fontSize: 22.0, color: Colors.white),
                ),
                const SizedBox(height: 80.0),
                Column(
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const HomeScreen()),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: spotifyGreen,
                        minimumSize: const Size(50, 40),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(500.0),
                          side: BorderSide(width: 1.0, color: borderColor),
                        ),
                      ),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Image.asset(
                              'assets/spotify.png',
                              width: 24.0,
                              height: 24.0,
                              color: Colors.white,
                            ),
                          ),
                          const Text(
                            'Registrarte Gratis',
                            style: TextStyle(fontSize: 18.0),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10.0),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Catalogo()),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: Colors.black,
                        minimumSize: const Size(50, 40),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(500.0),
                          side: BorderSide(width: 1.0, color: borderColor),
                        ),
                      ),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Image.asset(
                              'assets/Telefono.png',
                              width: 24.0,
                              height: 24.0,
                              color: Colors.white,
                            ),
                          ),
                          const Text(
                            'Continuar Con número de teléfono',
                            style: TextStyle(fontSize: 18.0),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10.0),
                    ElevatedButton(
                      onPressed: () => _signInWithGoogle(context),
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: Colors.black,
                        minimumSize: const Size(50, 40),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(500.0),
                          side: BorderSide(width: 1.0, color: borderColor),
                        ),
                      ),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Image.asset(
                              'assets/google.png',
                              width: 24.0,
                              height: 24.0,
                            ),
                          ),
                          const Text(
                            'Continuar con Google',
                            style: TextStyle(fontSize: 18.0),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10.0),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: Colors.black,
                        minimumSize: const Size(50, 40),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(500.0),
                          side: BorderSide(width: 1.0, color: borderColor),
                        ),
                      ),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(0.0),
                            child: Image.asset(
                              'assets/facebook.png',
                              width: 24.0,
                              height: 24.0,
                            ),
                          ),
                          const Text(
                            'Continuar con Facebook',
                            style: TextStyle(fontSize: 18.0),
                          ),
                        ],
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Login()),
                        );
                      },
                      child: const Text(
                        'Iniciar sesión',
                        style: TextStyle(fontSize: 16.0, color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
