import 'package:flutter/material.dart';

class NavigationSecond extends StatefulWidget {
  const NavigationSecond({super.key});

  @override
  State<NavigationSecond> createState() => _NavigationSecondState();
}

class _NavigationSecondState extends State<NavigationSecond> {
  @override
  Widget build(BuildContext context) {
    Color color;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Navigation Second Screen [Naufal]'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
                onPressed: () {
                  color = const Color(0xff15F5BA);
                  Navigator.pop(context, color);
                },
                child: const Text('Mint')),
            ElevatedButton(
                onPressed: () {
                  color = const Color(0xff836FFF);
                  Navigator.pop(context, color);
                },
                child: const Text('Purple')),
            ElevatedButton(
                onPressed: () {
                  color = const Color(0xff211951);
                  Navigator.pop(context, color);
                },
                child: const Text('Navy')),
          ],
        ),
      ),
    );
  }
}
