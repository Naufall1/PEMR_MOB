import 'package:flutter/material.dart';
import 'pizza.dart';
import 'httphelper.dart';

class PizzaDetailScreen extends StatefulWidget {
  final Pizza pizza;
  final bool isNew;

  const PizzaDetailScreen(
      {super.key, required this.pizza, required this.isNew});

  @override
  State<PizzaDetailScreen> createState() => _PizzaDetailScreenState();
}

class _PizzaDetailScreenState extends State<PizzaDetailScreen> {
  TextEditingController txtId = TextEditingController();
  TextEditingController txtName = TextEditingController();
  TextEditingController txtDescription = TextEditingController();
  TextEditingController txtPrice = TextEditingController();
  TextEditingController txtImageUrl = TextEditingController();

  String operationalResult = '';

  @override
  void initState() {
    if (!widget.isNew) {
      txtId.text = widget.pizza.id.toString();
      txtName.text = widget.pizza.pizzaName;
      txtDescription.text = widget.pizza.description;
      txtPrice.text = widget.pizza.price.toString();
      txtImageUrl.text = widget.pizza.imageUrl;
    }
    super.initState();
  }

  @override
  void dispose() {
    txtId.dispose();
    txtName.dispose();
    txtDescription.dispose();
    txtPrice.dispose();
    txtImageUrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pizza Detail'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text(
                operationalResult,
                style: TextStyle(
                    backgroundColor: Colors.green[200], color: Colors.black),
              ),
              const SizedBox(
                height: 24,
              ),
              TextField(
                controller: txtId,
                decoration: const InputDecoration(hintText: 'Insert ID'),
              ),
              const SizedBox(
                height: 24,
              ),
              TextField(
                controller: txtName,
                decoration:
                    const InputDecoration(hintText: 'Insert Pizza Name'),
              ),
              const SizedBox(
                height: 24,
              ),
              TextField(
                controller: txtDescription,
                decoration:
                    const InputDecoration(hintText: 'Insert Description'),
              ),
              const SizedBox(
                height: 24,
              ),
              TextField(
                controller: txtPrice,
                decoration: const InputDecoration(hintText: 'Insert Price'),
              ),
              const SizedBox(
                height: 24,
              ),
              TextField(
                controller: txtImageUrl,
                decoration: const InputDecoration(hintText: 'Insert Image Url'),
              ),
              ElevatedButton(
                  onPressed: () => savePizza(), child: const Text('Save Post'))
            ],
          ),
        ),
      ),
    );
  }

  Future savePizza() async {
    HttpHelper helper = HttpHelper();
    Pizza pizza = Pizza();
    pizza.id = int.tryParse(txtId.text) ?? 0;
    pizza.pizzaName = txtName.text;
    pizza.description = txtDescription.text;
    pizza.price = double.tryParse(txtPrice.text) ?? 0;
    pizza.imageUrl = txtImageUrl.text;

    String result = await (widget.isNew ? helper.postPizza(pizza) : helper.putPizza(pizza));
    setState(() {
      operationalResult = result;
    });
  }
}
