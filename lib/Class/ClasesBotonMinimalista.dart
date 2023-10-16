// ignore_for_file: file_names

import 'package:flutter/material.dart';

class BotonMinimalista extends StatefulWidget {
  final String texto;
  final VoidCallback onPressed;
  final Color textColor;
  final Color color;
  final double fontSize; // Nueva propiedad para el tamaño de la fuente

  const BotonMinimalista({
    Key? key,
    required this.texto,
    required this.onPressed,
    required this.textColor,
    required this.color,
    required this.fontSize, // Agregar el tamaño de la fuente al constructor
  }) : super(key: key);

  @override
  State<BotonMinimalista> createState() => _BotonMinimalistaState();
}

class _BotonMinimalistaState extends State<BotonMinimalista> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onPressed,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
        decoration: BoxDecoration(
          color: widget.color,
          borderRadius: BorderRadius.circular(50.0),
          boxShadow: [
            BoxShadow(
              color: Colors.white.withOpacity(0.10),
              spreadRadius: 2,
              blurRadius: 2,
              offset: const Offset(0, 0),
            ),
          ],
        ),
        child: Text(
          widget.texto,
          style: TextStyle(
            color: widget.textColor,
            fontSize: widget.fontSize, // Usar el tamaño de la fuente proporcionado
          ),
        ),
      ),
    );
  }
}
