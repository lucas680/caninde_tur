import 'package:flutter/material.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final int currentIndex;

  const CustomBottomNavigationBar({super.key, required this.currentIndex});

  onTap(context, index) {
    if (currentIndex != index) {
      if (index == 0) {
        Navigator.pushNamedAndRemoveUntil(context, 'home', (route) => false);
      }else if(index == 1){
        Navigator.pushNamedAndRemoveUntil(context, 'add', (route) => false);
      }else if(index == 2){
        Navigator.pushNamedAndRemoveUntil(context, 'favorite', (route) => false);
      }else if(index == 3){
        Navigator.pushNamedAndRemoveUntil(context, 'profile', (route) => false);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(16.0),
        topRight: Radius.circular(16.0),
      ),
      child: SizedBox(
        height: 60,
        child: BottomNavigationBar(
          currentIndex: currentIndex,
          onTap: (index) {
            onTap(context, index);
          },
          type: BottomNavigationBarType.fixed,
          selectedItemColor: const Color.fromRGBO(0, 146, 63, 1),
          unselectedItemColor: const Color.fromRGBO(164, 164, 164, 1),
          selectedLabelStyle: const TextStyle(fontSize: 0),
          showSelectedLabels: false,
          showUnselectedLabels: false,
          iconSize: 35,
          // Isso permite que todos os ícones sejam exibidos mesmo com 4 ou mais itens.
          items: [
            _buildBottomNavigationBarItem(icon: Icons.home, index: 0),
            _buildBottomNavigationBarItem(icon: Icons.add_circle, index: 1),
            _buildBottomNavigationBarItem(icon: Icons.favorite, index: 2),
            _buildBottomNavigationBarItem(icon: Icons.account_circle, index: 3),
          ],
        ),
      ),
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
