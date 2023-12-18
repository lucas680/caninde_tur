import 'package:caninde_tur/components/button.dart';
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
    return Scaffold(
      backgroundColor: const Color.fromRGBO(245, 245, 245, 1),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Transform.rotate(
              angle: 3.141592653589793,
              child: const Icon(
                Icons.info,
                color: Color.fromRGBO(200, 200, 200, 1),
                size: 80,
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              "Faça login para poder cadastrar",
              style: TextStyle(
                color: Color.fromRGBO(151, 151, 151, 1),
                fontSize: 15,
                fontWeight: FontWeight.w400,
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: 250,
              child: Button(text: "Fazer login", onClick: (){
                Navigator.pushNamed(context, 'login');
              }),
            ),
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomNavigationBar(currentIndex: 1),
    );
  }
}
