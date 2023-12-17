import 'package:flutter/material.dart';

class PointItem extends StatelessWidget {
  final String image;
  final String title;
  final String description;
  final String address;
  final String userName;
  final String userImage;
  final bool isFavorite;
  final int favoriteLevel;

  const PointItem({
    super.key,
    required this.image,
    required this.title,
    required this.description,
    required this.address,
    required this.userName,
    required this.isFavorite,
    required this.favoriteLevel,
    this.userImage = '',
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){},
      child: Container(
        height: 120,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.0),
          border: Border.all(
            color: const Color.fromRGBO(0, 146, 63, 1),
            width: 0.3,
          ),
        ),
        padding: const EdgeInsets.all(5),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.network(
                image,
                height: 110,
                width: 100,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Flexible(
                    child: Text(
                      title,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        color: Color.fromRGBO(128, 122, 122, 1),
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.location_on_outlined,
                        size: 14,
                        color: Color.fromRGBO(128, 122, 122, 1),
                      ),
                      const SizedBox(width: 5),
                      Flexible(
                        child: Text(
                          address,
                          style: const TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w400,
                              color: Color.fromRGBO(151, 151, 151, 1)),
                        overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8.0),
                  Row(
                    children: List.generate(5, (index) {
                      return Icon(
                        index < favoriteLevel ? Icons.star : Icons.star_border,
                        color: index < favoriteLevel ? Colors.yellow : Colors.grey,
                        size: 15,
                      );
                    }),
                  ),
                  const SizedBox(height: 8.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Row(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(50.0),
                              child: userImage.isNotEmpty
                                  ? Image.network(userImage,
                                      height: 20.0, width: 20.0, fit: BoxFit.cover)
                                  : Container(
                                      height: 20.0,
                                      width: 20.0,
                                      decoration: BoxDecoration(
                                        color: const Color.fromRGBO(61, 80, 223, 1),
                                        borderRadius: BorderRadius.circular(50.0),
                                      ),
                                      child: Center(
                                        child: Text(
                                          userName.isNotEmpty
                                              ? userName
                                                      .split(" ")[0][0]
                                                      .toUpperCase() +
                                                  userName
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
                                userName,
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
                      ),
                      IconButton(
                        icon: Icon(
                          isFavorite ? Icons.favorite : Icons.favorite_border,
                          color: isFavorite
                              ? const Color.fromRGBO(0, 146, 63, 1)
                              : const Color.fromRGBO(151, 151, 151, 1),
                          size: 20,
                        ),
                        onPressed: () {
                          // Lógica para manipular o estado de favorito aqui
                        },
                      ),
                    ],
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
