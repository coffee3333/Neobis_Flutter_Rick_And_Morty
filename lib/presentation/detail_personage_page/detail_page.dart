import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:neobis_flutter_rick_and_morty/domain/personage/personage.dart';

class DetailPersonagePage extends StatelessWidget {
  final Personage personage;
  const DetailPersonagePage({super.key, required this.personage});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(200.0),
        child: Stack(
          fit: StackFit.expand,
          children: [
            Image.asset(
              personage.fotoUrl, // Replace with the path to your image asset
              fit: BoxFit.cover,
            ),
            // Blurred Background
            BackdropFilter(
              filter: ImageFilter.blur(
                  sigmaX: 5.0,
                  sigmaY: 5.0), // Adjust the sigma values for more or less blur
              child: Container(
                color: Colors.black.withOpacity(
                    0.5), // Adjust the opacity based on your design
                height: 220,
                width: 220,
              ),
            ),

            Positioned(
              child: AppBar(
                backgroundColor:
                    Colors.transparent, // Make the AppBar transparent
                elevation: 0.0,
                // toolbarHeight: 220,
              ),
            ),
          ],
        ),
      ),
      body: const Placeholder(),
    );
  }
}
