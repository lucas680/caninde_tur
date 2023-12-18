import 'package:caninde_tur/components/customBottomNavigatorBar.dart';
import 'package:caninde_tur/components/pointItem.dart';
import 'package:caninde_tur/components/search.dart';
import 'package:caninde_tur/entities/commentEntity.dart';
import 'package:caninde_tur/entities/pointEntity.dart';
import 'package:caninde_tur/entities/userEntity.dart';
import 'package:caninde_tur/pages/pointDetail.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final searchController = TextEditingController();

  final List<PointEntity> points = [
    PointEntity(
      id: 0,
      title: "Basílica de São Francisco",
      description:
          "A estátua de São Francisco em Canindé se destaca pela sua grandiosidade e pela sua localização estratégica no alto de uma colina, proporcionando uma visão imponente majestosa.",
      address: "Rua São Lucas, 124, Centro",
      images: [
        "https://i.pinimg.com/736x/b1/5b/77/b15b77e242b3da858ead2664385383df.jpg",
        "https://www.cnbbne1.org.br/wp-content/uploads/2020/09/Abertura_Imagens_A%C3%A9reas_Bas%C3%ADlica_Festa_2019-7-1024x574.jpeg",
        "https://www.ipatrimonio.org/wp-content/uploads/2018/01/Canind%C3%A9-Bas%C3%ADlica-de-S%C3%A3o-Francisco-Imagem-Pfhenrique.jpg",
      ],
      favoriteLevel: 4,
      isFavorite: false,
      user: UserEntity(
        id: 1,
        name: "Júnior Lima",
      ),
      comments: [
        CommentEntity(
          id: 0,
          user: UserEntity(id: 2, name: "Brenda Cairu"),
          description: "Visitei essa estátua durante a festa e São Francisco e fiquei maravilhada, é um monumento muito lindo!",
          favoriteLevel: 5,
          date: "05/12",
        ),
        CommentEntity(
          id: 1,
          user: UserEntity(id: 3, name: "Marcos Antônio", image: "https://www.otempo.com.br/image/contentid/policy:1.2972085:1688395207/Libano-1-jpg.jpg?f=3x2&w=1224"),
          description: "Apesar de ser um lugar belíssimo, infelizmente não é bem cuidado, pelo menos quando eu fui havia lixo jogado por toda parte.",
          favoriteLevel: 3,
          date: "28/11",
        ),
      ],
    ),
    PointEntity(
      id: 1,
      title: "Zoológico de São Francisco",
      description: "sla testeee",
      address: "Rua São Lucas, 124, Alto do Moinho",
      images: [
        "https://santuariodecaninde.com/wp-content/uploads/2021/01/WhatsApp-Image-2021-01-13-at-11.42.50.jpeg",
        "https://media-cdn.tripadvisor.com/media/photo-m/1280/1a/58/03/a6/img-20191220-092308-largejpg.jpg",
      ],
      favoriteLevel: 5,
      isFavorite: true,
      user: UserEntity(
        id: 1,
        name: "Júnior Lima",
      ),
      comments: [],
    ),
    PointEntity(
      id: 2,
      title: "Hotel Val Paraíso",
      description: "",
      address: "Rua São Lucas, 124, Centro",
      images: [
        "https://val-paraiso.ceara-hotels.com/data/Images/OriginalPhoto/5965/596586/596586204/image-caninde-hotel-val-paraiso-3.JPEG"
      ],
      favoriteLevel: 4,
      isFavorite: true,
      user: UserEntity(
        id: 1,
        name: "Júnior Lima",
      ),
      comments: [],
    )
  ];

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
            ...listPoints(),
          ],
        ),
      ),
      bottomNavigationBar: const CustomBottomNavigationBar(
        currentIndex: 0,
      ),
    );
  }

  List<Widget> listPoints() {
    List<Widget> list = [];

    for (int i = 0; i < points.length; i++) {
      list.add(Padding(
        padding: const EdgeInsets.only(top: 12),
        child: InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => PointDetailPage(point: points[i]),
              ),
            );
          },
          child: PointItem(point: points[i]),
        ),
      ));
    }

    return list;
  }
}
