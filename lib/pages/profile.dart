import 'package:caninde_tur/components/customBottomNavigatorBar.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color.fromRGBO(245, 245, 245, 1),
      body: Center(
        child: Text("Página em contrução!"),
      ),
      bottomNavigationBar:
          CustomBottomNavigationBar(currentIndex: 3),
    );
  }
}
