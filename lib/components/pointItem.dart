import 'package:caninde_tur/entities/pointEntity.dart';
import 'package:flutter/material.dart';

class PointItem extends StatelessWidget {
  final PointEntity point;

  const PointItem({
    super.key,
    required this.point,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
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
              point.images[0],
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
                    point.title,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      color: Color.fromRGBO(128, 122, 122, 1),
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                const SizedBox(height: 5),
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
                        point.address,
                        style: const TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w400,
                            color: Color.fromRGBO(151, 151, 151, 1)),
                      overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 2),
                Row(
                  children: List.generate(5, (index) {
                    return Icon(
                      index < point.favoriteLevel ? Icons.star : Icons.star_border,
                      color: index < point.favoriteLevel ? Colors.yellow : Colors.grey,
                      size: 15,
                    );
                  }),
                ),
                const SizedBox(height: 5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Row(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(50.0),
                            child: point.user.image.isNotEmpty
                                ? Image.network(point.user.image,
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
                    ),
                    IconButton(
                      icon: Icon(
                        point.isFavorite ? Icons.favorite : Icons.favorite_border,
                        color: point.isFavorite
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
    );
  }
}
