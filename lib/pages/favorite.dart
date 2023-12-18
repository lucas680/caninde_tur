import 'package:caninde_tur/components/customBottomNavigatorBar.dart';
import 'package:flutter/material.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({Key? key}) : super(key: key);

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color.fromRGBO(245, 245, 245, 1),
      body: Center(
        child: Text("Página em contrução!"),
      ),
      bottomNavigationBar:
          CustomBottomNavigationBar(currentIndex: 2),
    );
  }
}
