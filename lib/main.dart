import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Crunchyroll',
      theme: ThemeData(
        primarySwatch: Colors.orange,
        useMaterial3: true,
      ),
      home: const CrunchyrollHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class CrunchyrollHomePage extends StatelessWidget {
  const CrunchyrollHomePage({super.key});

  final List<Map<String, String>> animeList = const [
    {
      'title': 'Fire Force',
      'subtitle': 'Fire Force (En\'en no Shōbōtai) es un manga y anime shōnen de acción creado por Atsushi Ōkubo (Soul Eater) que narra la lucha contra la "combustión humana espontánea", un fenómeno que convierte a personas en monstruos en llamas llamados "Infernales".',
      'imageUrl': 'https://raw.githubusercontent.com/MunizSalinasVictor/Imagenes-para-flutter-6toI-11-feb-2026/refs/heads/main/fire%20force.jpg',
    },
    {
      'title': 'One Piece',
      'subtitle': 'El One Piece es el tesoro legendario escondido por Gol D. Roger en Laugh Tale, la última isla de Grand Line, siendo el motor de la "Gran Era de los Piratas".',
      'imageUrl': 'https://raw.githubusercontent.com/MunizSalinasVictor/Imagenes-para-flutter-6toI-11-feb-2026/refs/heads/main/one-piece-wano.jpg',
    },
    {
      'title': 'Dragon Ball Super',
      'subtitle': 'Dragon Ball Super es la cuarta serie de anime de la franquicia, producida por Toei Animation entre 2015 y 2018. Escrita bajo la supervisión de Akira Toriyama, narra las aventuras de Goku tras derrotar a Majin Buu, situándose antes del final de DBZ, introduciendo a los Dioses de la Destrucción, nuevas transformaciones divinas y el torneo multiversal.',
      'imageUrl': 'https://raw.githubusercontent.com/MunizSalinasVictor/Imagenes-para-flutter-6toI-11-feb-2026/refs/heads/main/dragon-ball-super.jpg',
    },
    {
      'title': 'Attack On Titan',
      'subtitle': 'Attack on Titan (Shingeki no Kyojin) narra la lucha de la humanidad por sobrevivir contra los titanes, criaturas gigantescas que devoran humanos, forzando a los supervivientes a vivir refugiados tras inmensas murallas. El protagonista, Eren Jaeger, jura exterminarlos tras presenciar una devastadora invasión, descubriendo oscuros secretos sobre el origen de los titanes y el mundo.',
      'imageUrl': 'https://raw.githubusercontent.com/MunizSalinasVictor/Imagenes-para-flutter-6toI-11-feb-2026/refs/heads/main/aot.png',
    },
    {
      'title': 'Frieren',
      'subtitle': 'Frieren: Beyond Journey\'s End (Sousou no Frieren) es un anime de fantasía y recuentos de la vida que narra la historia de una elfa inmortal, Frieren, tras derrotar al Rey Demonio. Centrado en la melancolía y la reflexión, explora el viaje de Frieren para entender la mortalidad humana, la amistad y el paso del tiempo.',
      'imageUrl': 'https://raw.githubusercontent.com/MunizSalinasVictor/Imagenes-para-flutter-6toI-11-feb-2026/refs/heads/main/frieren.jpg',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[850], // Fondo gris oscuro
      appBar: AppBar(
        title: const Text(
          'Crunchyroll',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.orange[800],
        elevation: 4,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: ListView.separated(
          itemCount: animeList.length,
          separatorBuilder: (context, index) => const SizedBox(height: 12), // Espaciado entre cards (12px)
          itemBuilder: (context, index) {
            final anime = animeList[index];
            return AnimeCard(
              title: anime['title']!,
              subtitle: anime['subtitle']!,
              imageUrl: anime['imageUrl']!,
            );
          },
        ),
      ),
    );
  }
}

class AnimeCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String imageUrl;

  const AnimeCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Colors.orange,
            Colors.deepOrange,
            Colors.orangeAccent,
          ],
        ),
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(2), // Pequeño padding para que el gradiente se vea alrededor
        child: Container(
          decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Lado izquierdo - Imagen
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(10),
                  bottomLeft: Radius.circular(10),
                ),
                child: Image.network(
                  imageUrl,
                  width: 120,
                  height: 140,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      width: 120,
                      height: 140,
                      color: Colors.grey[800],
                      child: const Icon(
                        Icons.broken_image,
                        color: Colors.white54,
                        size: 40,
                      ),
                    );
                  },
                  loadingBuilder: (context, child, loadingProgress) {
                    if (loadingProgress == null) return child;
                    return Container(
                      width: 120,
                      height: 140,
                      color: Colors.grey[800],
                      child: const Center(
                        child: CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation<Color>(Colors.orange),
                        ),
                      ),
                    );
                  },
                ),
              ),
              
              // Lado derecho - Título y descripción
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Título en negro
                      Text(
                        title,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 8),
                      // Subtítulo en negritas y negro
                      Text(
                        subtitle,
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold, // Negritas
                          color: Colors.black,
                        ),
                        maxLines: 4,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}