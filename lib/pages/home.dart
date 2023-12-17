import 'package:caninde_tur/components/customBottomNavigatorBar.dart';
import 'package:caninde_tur/components/pointItem.dart';
import 'package:caninde_tur/components/search.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(245, 245, 245, 1),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: ListView(

          children: [
            const SizedBox(height: 20),
            Search(
              textPlaceholder: "Buscar",
              onChange: (value) {},
              controller: searchController,
            ),
            const SizedBox(height: 20),
            const PointItem(
              image: "https://i.pinimg.com/736x/b1/5b/77/b15b77e242b3da858ead2664385383df.jpg",
              title: "Basílica de São Francisco",
              description: "sla sla sla",
              address: "Rua São Lucas, 124, Centro",
              userName: "Júnior Lima",
              isFavorite: false,
              favoriteLevel: 4,
            ),
            const SizedBox(height: 12),
            const PointItem(
              image: "https://santuariodecaninde.com/wp-content/uploads/2021/01/WhatsApp-Image-2021-01-13-at-11.42.50.jpeg",
              title: "Zoológico de São Francisco",
              description: "sla sla sla",
              address: "Rua São Lucas, 124, Alto do Moinho",
              userName: "Júnior Lima",
              isFavorite: true,
              favoriteLevel: 5,
            ),
            const SizedBox(height: 12),
            const PointItem(
              image: "https://val-paraiso.ceara-hotels.com/data/Images/OriginalPhoto/5965/596586/596586204/image-caninde-hotel-val-paraiso-3.JPEG",
              title: "Hotel Val Paraíso",
              description: "sla sla sla",
              address: "Rua São Lucas, 124, Centro",
              userName: "Júnior Lima",
              isFavorite: false,
              favoriteLevel: 4,
            ),
          ],
        ),
      ),
      bottomNavigationBar: const CustomBottomNavigationBar(
        currentIndex: 0,
      ),
    );
  }
}
