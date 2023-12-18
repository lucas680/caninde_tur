import 'package:caninde_tur/entities/userEntity.dart';

class CommentEntity {
  final int id;
  final UserEntity user;
  final String description;
  final int favoriteLevel;
  final String date;

  CommentEntity({
    required this.id,
    required this.user,
    required this.description,
    required this.favoriteLevel,
    required this.date,
  });
}
