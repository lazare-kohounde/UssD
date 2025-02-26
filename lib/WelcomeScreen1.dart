import 'package:flutter/material.dart';
import 'package:ussd/Dashboard.dart';
import 'package:ussd/WelcomeScreen.dart';

class WelcomeScreen1 extends StatelessWidget {
  const WelcomeScreen1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: size.width * 0.08),
        child: Stack(
          children: [
            // Bouton "Sauter" en haut à droite
            Positioned(
              top: size.height * 0.05,
              right: size.width * 0.00,
              child: TextButton(
                onPressed: () {
                  // Action pour sauter l'écran
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const Dashboard()),
                  );
                },
                child: const Text(
                  "Sauter",
                  style: TextStyle(
                    color: Color(0xFF179681),
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                  ),
                ),
              ),
            ),

            // Contenu principal
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                SizedBox(
                  height: 180,
                ),
                Center(
                  child: SizedBox(
                    width: 200, // Largeur fixe ou ajustable selon vos besoins
                    height: MediaQuery.of(context).size.height *
                        0.4, // 30% de la hauteur de l'écran
                    child: Image.asset(
                      "assets/images/banner2.png",
                      
                    ),
                  ),
                ),
                const Spacer(), // Pousse le contenu vers le bas
                // Texte principal
                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    text: "Ajouter des ",
                    style: TextStyle(
                      fontSize: size.width * 0.05,
                      fontWeight: FontWeight.w700,
                      color: Colors.black,
                    ),
                    children: [
                      TextSpan(
                        text: "codes USSD                               ",
                        style: TextStyle(
                          fontSize: size.width * 0.05,
                          fontWeight: FontWeight.w700,
                          color: const Color(0xFF179681), // Couleur verte
                        ),
                      ),
                      
                      const TextSpan(
                        text:
                            "\n facilement", // Ajout du retour à la ligne
                      ),
                    ],
                  ),
                ),

                SizedBox(height: size.height * 0.02),
                // Texte secondaire
                Text(
                  "Vous pouvez personnaliser des codes \nUSSD à votre guise",
                  style: TextStyle(
                    fontSize: size.width * 0.04,
                    fontWeight: FontWeight.w500,
                    color: Colors.black54,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                    height: size.height * 0.12), // Espacement vers les boutons
              ],
            ),
            // Boutons en bas
            Positioned(
              bottom: size.height * 0.03,
              left: 0,
              right: 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        // Bouton "Next" rond
                        ElevatedButton(
                          onPressed: () {
                            // Action pour aller à l'écran suivant
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const WelcomeScreen()),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            shape: const CircleBorder(side: BorderSide(width: 2.0, color: Color(0xFF179681), style: BorderStyle.solid) ),
                            
                            padding: const EdgeInsets.all(16),
                            backgroundColor:
                                Colors.white, // Couleur verte
                          ),
                          child: const Icon(
                            Icons.arrow_back,
                            color: Color(0xFF179681),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      // Remplacement de Column par Row
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        // Indicateur 1
                        Container(
                          width: 10,
                          height: 10,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color.fromARGB(255, 119, 227, 209),
                          ),
                        ),
                        const SizedBox(
                            width:
                                8), // Espacement horizontal entre les indicateurs
                        // Indicateur 2
                        Container(
                          width: 12,
                          height: 12,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color(0xFF179681),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        // Bouton "Next" rond
                        ElevatedButton(
                          onPressed: () {
                            // Action pour aller à l'écran suivant
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const Dashboard()),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            shape: const CircleBorder(),
                            padding: const EdgeInsets.all(16),
                            backgroundColor:
                                const Color(0xFF179681), // Couleur verte
                          ),
                          child: const Icon(
                            Icons.arrow_forward,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
