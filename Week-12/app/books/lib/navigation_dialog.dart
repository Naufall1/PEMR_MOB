import 'package:flutter/material.dart';

class NavigationDialogScreen extends StatefulWidget {
  const NavigationDialogScreen({super.key});

  @override
  State<NavigationDialogScreen> createState() => _NavigationDialogScreenState();
}

class _NavigationDialogScreenState extends State<NavigationDialogScreen> {
  Color color = const Color(0xffF0F3FF);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color,
      appBar: AppBar(
        title: const Text('Navigation Dialog Screen [Naufal]'),
      ),
      body: Center(
        child: ElevatedButton(
            onPressed: () {
              _showColorDialog(context);
            },
            child: const Text('Change Color')),
      ),
    );
  }

  _showColorDialog(BuildContext context) async {
    await showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) {
        return AlertDialog(
          title: const Text('Very important question'),
          content: const Text('Please choose a color'),
          actions: <Widget>[
            TextButton(
                onPressed: () {
                  color = const Color(0xff15F5BA);
                  Navigator.pop(context, color);
                },
                child: const Text('Mint')),
            TextButton(
                onPressed: () {
                  color = const Color(0xff836FFF);
                  Navigator.pop(context, color);
                },
                child: const Text('Purple')),
            TextButton(
                onPressed: () {
                  color = const Color(0xff211951);
                  Navigator.pop(context, color);
                },
                child: const Text('Navy')),
          ],
        );
      },
    );
    setState(() {

    });
  }
}
