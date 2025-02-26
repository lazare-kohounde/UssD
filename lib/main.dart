import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:math';
import 'package:ussd/HomeScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Définir la couleur de l'arrière-plan de l'application
    const Color backgroundColor = Color(0xFFF9F9F9);

    // Configurer la barre de statut avec la couleur de l'arrière-plan
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor:
            backgroundColor, // Couleur de fond de la barre de statut
        statusBarIconBrightness:
            Brightness.dark, // Icônes sombres pour fond clair
      ),
    );

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
        scaffoldBackgroundColor: backgroundColor, // Fond de l'application
      ),
      home: const HomeScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();

    // Initialisation de l'AnimationController pour l'animation de rotation
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2), // Durée de la rotation
    )..repeat();

    // Transition automatique vers l'écran suivant après 5 secondes
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const HomeScreen()),
      );
    });
  }

  @override
  void dispose() {
    _controller.dispose(); // Libérer les ressources
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Responsivité
    final size = MediaQuery.of(context).size;
    final isLargeScreen = size.width > 600;

    // Taille fixe basée sur la maquette
    final double logoWidth = isLargeScreen ? 160 : 120;
    final double logoHeight = isLargeScreen ? 80 : 50;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Center(
              child: AnimatedBuilder(
                animation: _controller,
                builder: (context, child) {
                  // Rotation de l'image
                  return Transform.rotate(
                    angle: _controller.value *
                        2 *
                        pi *
                        (380 / 360), // Convertir 380° en radians
                    child: child,
                  );
                },
                child: Image.asset(
                  'assets/images/ussd.png', // Chemin de l'image
                  width: logoWidth,
                  height: logoHeight,
                  fit: BoxFit.contain,
                ),
              ),
            ),
            // Texte en bas : "By PEYA"
            Positioned(
              bottom: size.height * 0.02,
              left: 0,
              right: 0,
              child: Text(
                'By PEYA',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: isLargeScreen ? 20 : 14,
                  fontStyle: FontStyle.italic,
                  color: Colors.black87,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
