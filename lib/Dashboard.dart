import 'package:flutter/material.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: size.width * 0.0),
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: size.width * 0.00,
            vertical: size.height * 0.00,
          ),
          child: Column(
            children: [
              // Header avec icône de question et icône de rafraîchissement
              Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: size.height * 0.05),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          onPressed: () {
                            // Action pour le bouton "?"
                          },
                          icon: const Icon(
                            Icons.help_outline,
                            color: Colors.black54,
                          ),
                        ),
                        const Text(
                          "Services",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF008055), // Couleur verte
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            // Action pour rafraîchir
                          },
                          icon: const Icon(
                            Icons.refresh,
                            color: Colors.black54,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: size.height * 0.02),

              // Grille avec les services
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: size.width * 0.05,
                    vertical: size.height * 0.00,
                  ),
                  child: GridView.count(
                    crossAxisCount: 2, // 2 colonnes
                    mainAxisSpacing: size.height * 0.03,
                    crossAxisSpacing: size.width * 0.03,
                    children: [
                      _buildServiceCard("*...#", "18", "MTN"),
                      _buildServiceCard("*...#", "5", "MOOV"),
                      _buildServiceCard("*...#", "20", "CELTIS"),
                      _buildServiceCard("*...#", "0", "USSD Pers."),
                    ],
                  ),
                ),
              ),

              // Section verte avec texte et bouton
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: size.width * 0.00,
                  vertical: size.height * 0.00,
                ),
                child: Stack(
                  
                    children: [
                      Positioned.fill(
                        child: Image.asset(
                          'assets/images/bg2.png', // Remplacez par le chemin de votre image
                          fit: BoxFit.fill, // S'adapte à la taille de l'écran
                          
                        ),
                      ),
                      Column(
                        children: [
                          SizedBox(
                            height: 150,
                          ),
                          const Text(
                            "Allez visiter notre plateforme et voir nos autres solutions",
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(height: size.height * 0.04),
                          ElevatedButton(
                            onPressed: () {
                              // Action pour "Faire un tour"
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              foregroundColor:
                                  const Color(0xFF179681), // Couleur verte
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50),
                              ),
                              minimumSize: Size(size.width * 0.9, 50),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Text(
                                  "Faire un tour",
                                  style: TextStyle(fontWeight: FontWeight.w600),
                                ),
                                SizedBox(width: 8),
                                Icon(Icons.arrow_forward),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 40,
                          )
                        ],
                      ),
                    ],
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildServiceCard(String code, String count, String label) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              code,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color(0xFF008055),
              ),
            ),
            SizedBox(height: 8),
            Text(
              count,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Text(
              label,
              style: const TextStyle(
                fontSize: 14,
                color: Colors.black54,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
