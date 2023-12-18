class UserEntity{
  final int id;
  final String name;
  final String image;

  UserEntity({
    required this.id,
    required this.name,
    this.image = '',
});
}