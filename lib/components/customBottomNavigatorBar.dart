import 'package:flutter/material.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final int currentIndex;

  const CustomBottomNavigationBar({super.key, required this.currentIndex});

  onTap(context, index) {
    if (currentIndex != index) {
      if (index == 0) {
        Navigator.pushNamed(context, 'home');
      }else if(index == 1){
        Navigator.pushNamed(context, 'add');
      }else if(index == 2){
        Navigator.pushNamed(context, 'favorite');
      }else if(index == 3){
        Navigator.pushNamed(context, 'profile');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: (index) {
        onTap(context, index);
      },
      type: BottomNavigationBarType.shifting,
      selectedItemColor: const Color.fromRGBO(0, 146, 63, 1),
      unselectedItemColor: const Color.fromRGBO(164, 164, 164, 1),
      selectedLabelStyle: const TextStyle(fontSize: 0),
      iconSize: 30.0,
      // Isso permite que todos os ícones sejam exibidos mesmo com 4 ou mais itens.
      items: [
        _buildBottomNavigationBarItem(icon: Icons.home, index: 0),
        _buildBottomNavigationBarItem(icon: Icons.add_circle, index: 1),
        _buildBottomNavigationBarItem(icon: Icons.favorite, index: 2),
        _buildBottomNavigationBarItem(icon: Icons.person, index: 3),
      ],
    );
  }

  BottomNavigationBarItem _buildBottomNavigationBarItem({
    required IconData icon,
    required int index,
  }) {
    return BottomNavigationBarItem(
      icon: Icon(icon),
      label: '',
    );
  }
}
