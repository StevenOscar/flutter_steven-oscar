class TouristDestination {
  String name;
  String description;
  String imagePath;

  TouristDestination({
    required this.name,
    required this.description,
    required this.imagePath,
  });
}

List<TouristDestination> touristDestinations = [
  TouristDestination(
    name: 'Yogyakarta',
    description:
        'Yogyakarta is known for its rich cultural heritage, Yogyakarta is a treasure trove of history, art, and tradition.',
    imagePath: 'assets/images/tourist_destinations/yogyakarta.jpg',
  ),
  TouristDestination(
    name: 'Borobudur',
    description:
        'Borobudur is the world\'s largest Buddhist temple and one of the greatest Buddhist monuments.',
    imagePath: 'assets/images/tourist_destinations/borobudur.jpg',
  ),
  TouristDestination(
    name: 'Komodo Island',
    description:
        'Komodo Island is famous for the Komodo dragon, the world\'s largest living lizard. The island is a part of Komodo National Park.',
    imagePath: 'assets/images/tourist_destinations/komodo_island.jpg',
  ),
  TouristDestination(
    name: 'Raja Ampat',
    description:
        'Raja Ampat is an archipelago comprising over 1,500 small islands, cays, and shoals surrounding the four main islands.',
    imagePath: 'assets/images/tourist_destinations/raja_ampat.jpg',
  ),
  TouristDestination(
    name: 'Jakarta',
    description:
        'Jakarta is the capital and largest city of Indonesia. It is a bustling metropolis with a mix of modern and traditional architecture, vibrant markets, and historical sites.',
    imagePath: 'assets/images/tourist_destinations/jakarta.jpg',
  ),
  TouristDestination(
    name: 'Bandung',
    description:
        'Bandung is a city in West Java known for its colonial and art deco architecture. It is surrounded by tea plantations.',
    imagePath: 'assets/images/tourist_destinations/bandung.jpg',
  ),
  TouristDestination(
    name: 'Ubud',
    description:
        'Ubud is a town on the Indonesian island of Bali in Ubud District, located amongst rice paddies and steep ravines.',
    imagePath: 'assets/images/tourist_destinations/ubud.jpg',
  ),
  TouristDestination(
    name: 'Surabaya',
    description:
        'Surabaya is the capital of the Indonesian province of East Java and the second-largest city in the country. It is a major commercial center and port city.',
    imagePath: 'assets/images/tourist_destinations/surabaya.jpg',
  ),
];