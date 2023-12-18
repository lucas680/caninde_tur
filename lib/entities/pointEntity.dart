import 'package:caninde_tur/entities/commentEntity.dart';
import 'package:caninde_tur/entities/userEntity.dart';

class PointEntity{
  final int id;
  final String title;
  final String description;
  final String address;
  final List<String> images;
  final int favoriteLevel;
  final bool isFavorite;
  final UserEntity user;
  final List<CommentEntity> comments;

  PointEntity({
    required this.id,
    required this.title,
    required this.description,
    required this.address,
    required this.images,
    required this.favoriteLevel,
    required this.isFavorite,
    required this.user,
    required this.comments,
});
}