import 'package:flutter/material.dart';

class Hitung extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Segitiga Calculator'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => KelilingPage()),
                );
              },
              child: Text('Hitung Keliling Segitiga'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LuasPage()),
                );
              },
              child: Text('Hitung Luas Segitiga'),
            ),
          ],
        ),
      ),
    );
  }
}

class KelilingPage extends StatefulWidget {
  @override
  _KelilingPageState createState() => _KelilingPageState();
}

class _KelilingPageState extends State<KelilingPage> {
  TextEditingController _sisiAController = TextEditingController();
  TextEditingController _sisiBController = TextEditingController();
  TextEditingController _sisiCController = TextEditingController();
  double sisiA = 0.0;
  double sisiB = 0.0;
  double sisiC = 0.0;
  double keliling = 0.0;
  String? errorText;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hitung Keliling Segitiga'),
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: _sisiAController,
              keyboardType: TextInputType.number,
              onChanged: (value) {
                setState(() {
                  sisiA = double.parse(value);
                });
              },
              decoration: InputDecoration(labelText: 'Masukkan sisi A'),
            ),
            TextField(
              controller: _sisiBController,
              keyboardType: TextInputType.number,
              onChanged: (value) {
                setState(() {
                  sisiB = double.parse(value);
                });
              },
              decoration: InputDecoration(labelText: 'Masukkan sisi B'),
            ),
            TextField(
              controller: _sisiCController,
              keyboardType: TextInputType.number,
              onChanged: (value) {
                setState(() {
                  sisiC = double.parse(value);
                });
              },
              decoration: InputDecoration(labelText: 'Masukkan sisi C'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                if (sisiA != null && sisiB != null && sisiC != null &&
                    _sisiAController.text.isNotEmpty &&
                    _sisiBController.text.isNotEmpty &&
                    _sisiCController.text.isNotEmpty) {
                  double? sisiADouble = double.tryParse(_sisiAController.text);
                  double? sisiBDouble = double.tryParse(_sisiBController.text);
                  double? sisiCDouble = double.tryParse(_sisiCController.text);

                  if (sisiADouble != null && sisiBDouble != null && sisiCDouble != null) {
                    // Memastikan tidak ada sisi yang negatif
                    if (sisiADouble >= 0 && sisiBDouble >= 0 && sisiCDouble >= 0) {
                      setState(() {
                        sisiA = sisiADouble;
                        sisiB = sisiBDouble;
                        sisiC = sisiCDouble;
                        keliling = sisiA + sisiB + sisiC;
                        errorText = null;
                      });
                    } else {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text('Error'),
                            content: Text('Sisi-sisi segitiga harus bernilai positif!'),
                            actions: <Widget>[
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: Text('OK'),
                              ),
                            ],
                          );
                        },
                      );
                      setState(() {
                        keliling = 0.0;
                      });
                    }
                  } else {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text('Error'),
                          content: Text('Sisi-sisi segitiga harus berupa angka!'),
                          actions: <Widget>[
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: Text('OK'),
                            ),
                          ],
                        );
                      },
                    );
                    setState(() {
                      keliling = 0.0;
                    });
                  }
                } else {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text('Error'),
                        content: Text('Sisi-sisi segitiga tidak boleh kosong!'),
                        actions: <Widget>[
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: Text('OK'),
                          ),
                        ],
                      );
                    },
                  );
                  setState(() {
                    keliling = 0.0;
                  });
                }
              },
              child: Text('Hitung Keliling'),
            ),
            SizedBox(height: 20),
            //if (sisiA != 0 && sisiB != 0 && sisiC != 0)
              Text(
                'Keliling Segitiga: $keliling',
                style: TextStyle(fontSize: 20),
              ),
          ],
        ),
      ),
    );
  }
}

class LuasPage extends StatefulWidget {
  @override
  _LuasPageState createState() => _LuasPageState();
}

class _LuasPageState extends State<LuasPage> {
  TextEditingController _alasController = TextEditingController();
  TextEditingController _tinggiController = TextEditingController();
  double alas = 0.0;
  double tinggi = 0.0;
  double luas = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hitung Luas Segitiga'),
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: _alasController,
              keyboardType: TextInputType.number,
              onChanged: (value) {
                setState(() {
                  alas = double.parse(value);
                });
              },
              decoration: InputDecoration(labelText: 'Masukkan alas'),
            ),
            TextField(
              controller: _tinggiController,
              keyboardType: TextInputType.number,
              onChanged: (value) {
                setState(() {
                  tinggi = double.parse(value);
                });
              },
              decoration: InputDecoration(labelText: 'Masukkan tinggi'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                if (alas != null && tinggi != null &&
                    _alasController.text.isNotEmpty &&
                    _tinggiController.text.isNotEmpty) {
                  double? alasDouble = double.tryParse(_alasController.text);
                  double? tinggiDouble = double.tryParse(_tinggiController.text);

                  if (alasDouble != null && tinggiDouble != null) {
                    // Memastikan tidak ada alas atau tinggi yang negatif
                    if (alasDouble >= 0 && tinggiDouble >= 0) {
                      setState(() {
                        alas = alasDouble;
                        tinggi = tinggiDouble;
                        luas = 0.5 * alas * tinggi;
                      });
                    } else {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text('Error'),
                            content: Text('Alas dan tinggi harus bernilai positif!'),
                            actions: <Widget>[
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: Text('OK'),
                              ),
                            ],
                          );
                        },
                      );
                      setState(() {
                        luas = 0.0;
                      });
                    }
                  } else {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text('Error'),
                          content: Text('Alas dan tinggi harus berupa angka!'),
                          actions: <Widget>[
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: Text('OK'),
                            ),
                          ],
                        );
                      },
                    );
                    setState(() {
                      luas = 0.0;
                    });
                  }
                } else {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text('Error'),
                        content: Text('Alas dan tinggi tidak boleh kosong!'),
                        actions: <Widget>[
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: Text('OK'),
                          ),
                        ],
                      );
                    },
                  );
                  setState(() {
                    luas = 0.0;
                  });
                }
              },
              child: Text('Hitung Luas'),
            ),
            SizedBox(height: 20),
            //if (alas != 0 && tinggi != 0)
              Text(
                'Luas Segitiga: $luas',
                style: TextStyle(fontSize: 20),
              ),
          ],
        ),
      ),
    );
  }
}