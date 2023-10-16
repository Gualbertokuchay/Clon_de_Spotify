// ignore_for_file: file_names, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FormatoSin extends StatefulWidget {
  const FormatoSin({Key? key}) : super(key: key);

  @override
  _FormatoSinState createState() => _FormatoSinState();
}

class _FormatoSinState extends State<FormatoSin> {
  TextEditingController emailController = TextEditingController();
  bool isButtonEnabled = false;

  Future<void> _enviarCorreoRecuperacion(BuildContext context) async {
    final email = emailController.text;

    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(
        email: email,
      );

      // Indica al usuario que se ha enviado un correo de restablecimiento de contraseña.
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'Se ha enviado un correo de restablecimiento de contraseña a $email',
          ),
        ),
      );
    } catch (e) {
      // Maneja los errores aquí
      // ignore: avoid_print
      print('Error al enviar el correo de restablecimiento de contraseña: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(
          "Recuperar cuenta",
          style: TextStyle(color: Colors.white, fontSize: 13),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      backgroundColor: Colors.black,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 40.0),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Email o Nombre de usuario',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextField(
                  controller: emailController,
                  style: const TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.grey[800],
                  ),
                  onChanged: (text) {
                    setState(() {
                      isButtonEnabled = text.isNotEmpty;
                    });
                  },
                ),
                const SizedBox(height: 20.0),
                const Text(
                  'Te enviaremos un correo de restablecimiento de contraseña',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                  ),
                ),
                const SizedBox(height: 10.0),
                Center(
                  child: ElevatedButton(
                    onPressed: isButtonEnabled
                        ? () {
                            _enviarCorreoRecuperacion(context);
                          }
                        : null,
                    style: ElevatedButton.styleFrom(
                      shadowColor: Colors.white,
                      backgroundColor: isButtonEnabled ? Colors.white : Colors.white,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Enviar Correo',
                        style: TextStyle(
                          color: isButtonEnabled ? Colors.black : Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
