import 'package:caninde_tur/components/imageSlider.dart';
import 'package:caninde_tur/entities/pointEntity.dart';
import 'package:flutter/material.dart';

class PointDetailPage extends StatelessWidget {
  final PointEntity point;

  const PointDetailPage({
    Key? key,
    required this.point,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Column(
              children: [
                ImageSlider(
                  images: point.images,
                ),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      //Usuário
                      Row(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(50.0),
                            child: point.user.image.isNotEmpty
                                ? Image.network(point.user.image,
                                    height: 20.0,
                                    width: 20.0,
                                    fit: BoxFit.cover)
                                : Container(
                                    height: 20.0,
                                    width: 20.0,
                                    decoration: BoxDecoration(
                                      color:
                                          const Color.fromRGBO(61, 80, 223, 1),
                                      borderRadius: BorderRadius.circular(50.0),
                                    ),
                                    child: Center(
                                      child: Text(
                                        point.user.name.isNotEmpty
                                            ? point.user.name
                                                    .split(" ")[0][0]
                                                    .toUpperCase() +
                                                point.user.name
                                                    .split(" ")[1][0]
                                                    .toUpperCase()
                                            : '',
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ),
                                  ),
                          ),
                          const SizedBox(width: 5),
                          Flexible(
                            child: Text(
                              point.user.name,
                              style: const TextStyle(
                                color: Color.fromRGBO(181, 178, 178, 1),
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      //Título e estrelas
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Flexible(
                            child: Text(
                              point.title,
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w700,
                                color: Color.fromRGBO(128, 122, 122, 1),
                              ),
                              overflow: TextOverflow.fade,
                            ),
                          ),
                          Row(
                            children: List.generate(5, (index) {
                              return Icon(
                                index < point.favoriteLevel
                                    ? Icons.star
                                    : Icons.star_border,
                                color: index < point.favoriteLevel
                                    ? Colors.yellow
                                    : Colors.grey,
                                size: 20,
                              );
                            }),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      //Descrição
                      Row(
                        children: [
                          Flexible(
                            child: Text(
                              point.description,
                              style: const TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                color: Color.fromRGBO(121, 151, 151, 1),
                              ),
                              overflow: TextOverflow.fade,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      //Endereço
                      Row(
                        children: [
                          const Icon(
                            Icons.location_on_outlined,
                            size: 18,
                            color: Color.fromRGBO(128, 122, 122, 1),
                          ),
                          const SizedBox(width: 5),
                          Flexible(
                            child: Text(
                              point.address,
                              style: const TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                color: Color.fromRGBO(121, 151, 151, 1),
                              ),
                              overflow: TextOverflow.fade,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 30),
                      //Comentários
                      Column(
                        children: listComments(),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: AppBar(
                backgroundColor: Colors.transparent,
                leading: InkResponse(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  highlightShape: BoxShape.circle,
                  child: Container(
                    padding: const EdgeInsets.all(10.0),
                    child: const Icon(
                      Icons.arrow_back_ios,
                      color: Colors.white,
                    ),
                  ),
                ),
                elevation: 0,
              ),
            )
          ],
        ),
      ),
    );
  }

  List<Widget> listComments() {
    List<Widget> comments = [];

    for (int i = 0; i < point.comments.length; i++) {
      comments.add(
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              Row(
                children: [
                  //Usuário e data do commentário
                  Expanded(
                    child: Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(50.0),
                          child: point.comments[i].user.image.isNotEmpty
                              ? Image.network(point.comments[i].user.image,
                                  height: 15, width: 15, fit: BoxFit.cover)
                              : Container(
                                  height: 15,
                                  width: 15,
                                  decoration: BoxDecoration(
                                    color: const Color.fromRGBO(61, 80, 223, 1),
                                    borderRadius: BorderRadius.circular(50.0),
                                  ),
                                  child: Center(
                                    child: Text(
                                      point.comments[i].user.name.isNotEmpty
                                          ? point.comments[i].user.name
                                                  .split(" ")[0][0]
                                                  .toUpperCase() +
                                              point.comments[i].user.name
                                                  .split(" ")[1][0]
                                                  .toUpperCase()
                                          : '',
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 10,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ),
                                ),
                        ),
                        const SizedBox(width: 5),
                        Flexible(
                          child: Text(
                            point.comments[i].user.name,
                            style: const TextStyle(
                              color: Color.fromRGBO(181, 178, 178, 1),
                              fontSize: 10,
                              fontWeight: FontWeight.w400,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        const SizedBox(width: 10),
                        Flexible(
                          child: Text(
                            point.comments[i].date,
                            style: const TextStyle(
                              color: Color.fromRGBO(181, 178, 178, 1),
                              fontSize: 10,
                              fontWeight: FontWeight.w400,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    children: List.generate(5, (index) {
                      return Icon(
                        index < point.comments[i].favoriteLevel
                            ? Icons.star
                            : Icons.star_border,
                        color: index < point.comments[i].favoriteLevel
                            ? Colors.yellow
                            : Colors.grey,
                        size: 12,
                      );
                    }),
                  )
                ],
              ),
              const SizedBox(height: 5),
              Text(
                point.comments[i].description,
                style: const TextStyle(
                  color: Color.fromRGBO(181, 178, 178, 1),
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                ),
                overflow: TextOverflow.fade,
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      );
    }

    return comments;
  }
}
