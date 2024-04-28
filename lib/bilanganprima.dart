import 'package:flutter/material.dart';
import 'dart:math';

class BilanganPrima extends StatefulWidget {
  @override
  State<BilanganPrima> createState() => _BilanganPrimaState();
}

class _BilanganPrimaState extends State<BilanganPrima> {
  TextEditingController _controller = TextEditingController();
  int? inputNumber;
  List<int> primeNumbers = [];
  String? errorText;

  void checkPrime() {
    String? inputText = _controller.text;
    if (inputText != null && inputText.isNotEmpty) {
      if (inputText.startsWith('0')) {
        setState(() {
          errorText = 'Bilangan tidak boleh diawali dengan 0!';
          inputNumber = null;
          primeNumbers.clear();
        });
      } else {
        int? number = int.tryParse(inputText);
        if (number != null && number > 1) {
          setState(() {
            inputNumber = number;
            primeNumbers = generatePrimesUpTo(number);
            errorText = null;
          });
        } else {
          setState(() {
            errorText = 'Input yang Anda masukkan tidak valid!';
            inputNumber = null;
            primeNumbers.clear();
          });
        }
      }
    } else {
      setState(() {
        errorText = 'Input tidak boleh kosong!';
        inputNumber = null;
        primeNumbers.clear();
      });
    }
  }

  List<int> generatePrimesUpTo(int n) {
    List<int> primes = [];
    for (int i = 2; i <= n; i++) {
      bool isPrime = true;
      for (int j = 2; j <= sqrt(i); j++) {
        if (i % j == 0) {
          isPrime = false;
          break;
        }
      }
      if (isPrime) {
        primes.add(i);
      }
    }
    return primes;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bilangan Prima'),
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Center(
                child: TextField(
                  controller: _controller,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'Masukkan range bilangan',
                    errorText: errorText,
                  ),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  checkPrime();
                },
                child: Text('Tampilkan Bilangan Prima'),
              ),
              SizedBox(height: 20),
              if (inputNumber != null)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Bilangan prima hingga $inputNumber:',
                      style: TextStyle(fontSize: 20),
                    ),
                    SizedBox(height: 10),
                    Text(
                      primeNumbers.join(', '),
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
