import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MaterialApp(
    title: 'Multiplication App',
    home: MultiplicationScreen(),
    debugShowCheckedModeBanner: false,
  ));
}

class MultiplicationScreen extends StatefulWidget {
  @override
  _MultiplicationScreenState createState() => _MultiplicationScreenState();
}

class _MultiplicationScreenState extends State<MultiplicationScreen> {
  TextEditingController firstNumberController = TextEditingController();
  TextEditingController secondNumberController = TextEditingController();
  int resultado = 0;

  void multiplyNumbers() {
    int firstNumber = int.tryParse(firstNumberController.text) ?? 0;
    int secondNumber = int.tryParse(secondNumberController.text) ?? 0;
    int multiplicationResultado = firstNumber * secondNumber;
    setState(() {
      resultado = multiplicationResultado;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: Text('Multiplicador sencillo '),
      ),
      backgroundColor: Color.fromARGB(255, 196, 226, 241),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextField(
              controller: firstNumberController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'primer numero',
              ),
            ),
            TextField(
              controller: secondNumberController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Segundo numero',
              ),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: multiplyNumbers,
              style: ElevatedButton.styleFrom(
                  primary: Color.fromARGB(255, 44, 73, 153)),
              child: Text('Multiplicar'),
            ),
            SizedBox(height: 16.0),
            Text(
              'Resultado: $resultado',
              style: TextStyle(
                fontSize: 24.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
