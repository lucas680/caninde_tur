import 'package:caninde_tur/components/customBottomNavigatorBar.dart';
import 'package:flutter/material.dart';

class AddPage extends StatefulWidget {
  const AddPage({Key? key}) : super(key: key);

  @override
  State<AddPage> createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("Página em contrução!"),
      ),
      bottomNavigationBar:
          CustomBottomNavigationBar(currentIndex: 1),
    );
  }
}
