// ignore_for_file: file_names

import 'package:flutter/material.dart';

class OtraCard extends StatelessWidget {
  final String imageAsset;
  final String title;
  final String subtitle;
  final String description;
  final Color textColor;
  final Color backgroundColor;
  final double imageWidth;
  final double imageHeight;
  final double fontSizeTitle;
  final double fontSizeSubtitle;
  final double fontSizeDescription;
  final Color fontColorTitle;

  const OtraCard({
    super.key,
    required this.imageAsset,
    required this.title,
    required this.subtitle,
    required this.description,
    required this.textColor,
    required this.backgroundColor,
    this.imageWidth = 130,
    this.imageHeight = 125,
    this.fontSizeTitle = 19.450,
    this.fontSizeSubtitle = 20.0,
    this.fontSizeDescription = 11.90,
    this.fontColorTitle = Colors.green,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: backgroundColor,
      elevation: 5.0,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            Image.asset(
              imageAsset,
              width: imageWidth,
              height: imageHeight,
            ),
            const SizedBox(width: 8.0),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: fontSizeTitle,
                    color: fontColorTitle,
                  ),
                ),
                Text(
                  subtitle,
                  style:
                      TextStyle(fontSize: fontSizeSubtitle, color: textColor),
                ),
                Text(
                  description,
                  style: TextStyle(
                      fontSize: fontSizeDescription, color: textColor),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class ScrollCardFormat extends StatelessWidget {
  final String imageAsset;
  final String title;
  final String subtitle;
  final String description;
  final String description2;
  final Color textColor;
  final Color backgroundColor;
  final double imageWidth;
  final double imageHeight;
  final double fontSizeTitle;
  final double fontSizeSubtitle;
  final double fontSizeDescription;
  final Color fontColorTitle;

  const ScrollCardFormat({
    super.key,
    required this.imageAsset,
    required this.title,
    required this.subtitle,
    required this.description,
    required this.description2,
    required this.textColor,
    required this.backgroundColor,
    this.imageWidth = 130,
    this.imageHeight = 125,
    this.fontSizeTitle = 19.450,
    this.fontSizeSubtitle = 20.0,
    this.fontSizeDescription = 11.90,
    this.fontColorTitle = Colors.green,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: backgroundColor,
      elevation: 5.0,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            Image.asset(
              imageAsset,
              width: imageWidth,
              height: imageHeight,
            ),
            const SizedBox(width: 8.0),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: fontSizeTitle,
                    color: fontColorTitle,
                  ),
                ),
                Text(
                  subtitle,
                  style:
                      TextStyle(fontSize: fontSizeSubtitle, color: textColor),
                ),
                Text(
                  description,
                  style: TextStyle(
                      fontSize: fontSizeDescription, color: textColor),
                ),
                Text(
                  description2,
                  style: TextStyle(
                      fontSize: fontSizeDescription, color: textColor),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class ScrollCard extends StatelessWidget {
  final String imageAsset;
  final String title;
  final String subtitle;
  final String description;
  final String description2; // Segunda descripción
  final Color textColor;
  final Color backgroundColor;
  final double imageWidth;
  final double imageHeight;
  final double fontSizeTitle;
  final double fontSizeSubtitle;
  final double fontSizeDescription;
  final Color fontColorTitle;

  const ScrollCard({
    super.key,
    required this.imageAsset,
    required this.title,
    required this.subtitle,
    required this.description,
    required this.description2,
    required this.textColor,
    required this.backgroundColor,
    this.imageWidth = 130,
    this.imageHeight = 125,
    this.fontSizeTitle = 19.450,
    this.fontSizeSubtitle = 20.0,
    this.fontSizeDescription = 11.90,
    this.fontColorTitle = Colors.green,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: backgroundColor,
      elevation: 5.0,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            Image.asset(
              imageAsset,
              width: imageWidth,
              height: imageHeight,
            ),
            const SizedBox(width: 8.0),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: fontSizeTitle,
                    color: fontColorTitle,
                  ),
                ),
                Text(
                  subtitle,
                  style:
                      TextStyle(fontSize: fontSizeSubtitle, color: textColor),
                ),
                Text(
                  description,
                  style: TextStyle(
                      fontSize: fontSizeDescription, color: textColor),
                ),
                Text(
                  description2, // Mostrar la segunda descripción
                  style: TextStyle(
                      fontSize: fontSizeDescription, color: textColor),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
