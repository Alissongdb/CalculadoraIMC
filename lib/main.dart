import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: calculatorIMC(),
      debugShowCheckedModeBanner: false,
    );
  }
}

// ignore: camel_case_types
class calculatorIMC extends StatefulWidget {
  const calculatorIMC({Key? key}) : super(key: key);

  @override
  State<calculatorIMC> createState() => _calculatorIMCState();
}

TextEditingController controllerPeso = TextEditingController();
TextEditingController controllerAltura = TextEditingController();

// ignore: non_constant_identifier_names
double? IMC;

// ignore: camel_case_types
class _calculatorIMCState extends State<calculatorIMC> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calculadora de IMC'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: controllerPeso,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(15),
                    ),
                  ),
                  hintText: 'Digite seu Peso',
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: controllerAltura,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(15),
                    ),
                  ),
                  hintText: 'Digite sua altura',
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(IMC.toString()),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                width: 120,
                child: ElevatedButton(
                  onPressed: () {
                    double auxiliarIMC = (double.parse(controllerPeso.text) /
                        (double.parse(controllerAltura.text) *
                            double.parse(controllerAltura.text)));
                    setState(() {
                      IMC = auxiliarIMC;
                    });
                  },
                  style: ButtonStyle(
                    minimumSize: MaterialStateProperty.all(
                      const Size(0, 40),
                    ),
                  ),
                  child: const Text('Calcular'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
