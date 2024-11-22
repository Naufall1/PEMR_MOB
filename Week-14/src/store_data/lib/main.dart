import 'dart:convert';

import 'package:flutter/material.dart';
import './pizza.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter JSON Demo',
      theme: ThemeData(primaryColor: Colors.blue),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String pizzaString = '';
  List<Pizza> myPizzas = [];
  int appCounter = 0;
  String documentsPath = '';
  String tempPath = '';
  late File myFile;
  String fileText = '';

  @override
  void initState() {
    getPaths().then(
      (_) {
        myFile = File('$documentsPath/pizzas.txt');
        writeFile();
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('JSON'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text('Doc path: $documentsPath'),
              Text('Temp path: $tempPath'),
              ElevatedButton(
                onPressed: () => readFile(),
                child: const Text('Read File')
              ),
              Text(fileText)
            ],
          ),
        ));
  }

  Future<List<Pizza>> readJsonFile() async {
    String myString = await DefaultAssetBundle.of(context)
        .loadString('assets/pizzalist.json');
    List pizzaMapList = jsonDecode(myString);
    List<Pizza> myPizzas = [];
    for (var pizza in pizzaMapList) {
      Pizza myPizza = Pizza.fromJson(pizza);
      myPizzas.add(myPizza);
    }
    // setState(() {
    //   pizzaString = myString;
    // });
    String json = convertToJSON(myPizzas);
    print(json);
    return myPizzas;
  }

  String convertToJSON(List<Pizza> pizzas) {
    return jsonEncode(pizzas
        .map(
          (pizza) => jsonEncode(pizza),
        )
        .toList());
  }

  Future readAndWritePreference() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    appCounter = prefs.getInt('appCounter') ?? 0;
    appCounter++;
    await prefs.setInt('appCounter', appCounter);
    setState(() {
      appCounter = appCounter;
    });
  }

  Future deletePreference() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear();
    setState(() {
      appCounter = 0;
    });
  }

  Future getPaths() async {
    final docDir = await getApplicationDocumentsDirectory();
    final tempDir = await getTemporaryDirectory();
    setState(() {
      documentsPath = docDir.path;
      tempPath = tempDir.path;
    });
  }

  Future<bool> writeFile() async {
    try {
      await myFile.writeAsString('Margherita, Capricciosa, Napoli');
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<bool> readFile() async {
    try {
      String fileContent = await myFile.readAsString();
      setState(() {
        fileText = fileContent;
      });
      return true;
    } catch (e) {
      return false;
    }
  }
}
