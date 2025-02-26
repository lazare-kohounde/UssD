import 'package:flutter/material.dart';
import 'package:ussd/WelcomeScreen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size; // Obtenir la taille de l'écran

    return Scaffold(
      body: Stack(
        children: [
          // Image en arrière-plan
          Positioned.fill(
            child: Opacity(
              opacity: 0.3, // Ajuster l'opacité de l'image
              child: Image.asset(
                'assets/images/background.jpg', // Remplacez par le chemin de votre image
                fit: BoxFit.cover, // S'adapte à la taille de l'écran
              ),
            ),
          ),
          // Contenu au-dessus de l'image
          Padding(
            padding: EdgeInsets.symmetric(horizontal: size.width * 0.08),
            child: Column(
              mainAxisAlignment:
                  MainAxisAlignment.end, // Aligner les contenus en bas
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Textes sous le bouton
                Text(
                  "Plus besoin de garder les",
                  style: TextStyle(
                    fontSize:
                        size.width * 0.05, // Responsif pour la taille de texte
                    fontWeight: FontWeight.w700,
                    color: Colors.black,
                  ),
                  textAlign: TextAlign.center,
                ),
                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    text: 'Code ',
                    style: TextStyle(
                      fontSize: size.width * 0.05,
                      fontWeight: FontWeight.w700,
                      color: Colors.black,
                    ),
                    children: [
                      TextSpan(
                        text: 'USSD',
                        style: TextStyle(
                          fontSize: size.width * 0.05,
                          fontWeight: FontWeight.w700,
                          color: const Color(0xFF179681), // Vert spécifique
                        ),
                      ),
                      const TextSpan(
                        text: ' en tête',
                      ),
                    ],
                  ),
                ),
                SizedBox(height: size.height * 0.02), // Espacement
                Text(
                  "Gagnez du temps en utilisant notre solution",
                  style: TextStyle(
                    fontSize: size.width * 0.04,
                    fontWeight: FontWeight.w500,
                    color: Colors.black54,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                    height: size.height * 0.05), // Espacement avant le bouton
                // Bouton "Démarrer"
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      // Naviguer vers WelcomeScreen et empêcher le retour
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              const WelcomeScreen(), // Assurez-vous que WelcomeScreen est défini
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(200, 50),
                      backgroundColor: const Color(0xFF179681), // Couleur verte
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(50), // Bouton arrondi
                      ),
                    ),
                    child: Text(
                      "Démarrer",
                      style: TextStyle(
                        fontSize: size.width * 0.045,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),

                SizedBox(height: size.height * 0.05), // Espacement en bas
              ],
            ),
          ),
        ],
      ),
    );
  }
}
