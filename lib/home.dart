import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tugas4/bilanganprima.dart';
import 'package:tugas4/daftar.dart';
import 'package:tugas4/daftarsitus.dart';
import 'package:tugas4/favorit.dart';
import 'package:tugas4/hitungsegitiga.dart';
import 'package:tugas4/login.dart';
import 'package:tugas4/panduan.dart';
import 'package:tugas4/stopwatch.dart';

class HomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DaftarAnggota(),
                  ),
                );
              },
              child: MenuCard(title: 'Anggota Kelompok', color: Colors.red),
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => BilanganPrima(),
                  ),
                );
              },
              child: MenuCard(title: 'Bilangan Prima', color: Colors.green),
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Hitung(),
                  ),
                );
              },
              child: MenuCard(title: 'Hitung Segitiga', color: Colors.blue),
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HomePageSitus(),
                  ),
                );
              },
              child: MenuCard(title: 'Rekomendasi Situs Membaca', color: Colors.orange),
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HomePageSitusFavorite(),
                  ),
                );
              },
              child: MenuCard(title: 'Favorite', color: Colors.purple),
            ),
          ],
        ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home, color: Colors.blue),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.info, color: Colors.grey),
            label: 'Info',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.timer, color: Colors.grey),
            label: 'Stopwatch',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.logout, color: Colors.grey),
            label: 'Logout',
          ),
        ],
        onTap: (int index) async {
          if (index == 0) {
            //
          } else if (index == 1) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => PanduanAplikasiPage(),
              ),
            );
          } else if (index == 2) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => StopwatchPage(),
              ),
            );
          } else if (index == 3){
            SharedPreferences prefs = await SharedPreferences.getInstance();
            await prefs.setBool('isLoggedIn', false);
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => LoginPage(),
              ),
            );
          }
        },
      ),
    );
  }
}

class MenuCard extends StatelessWidget {
  final String title;
  final Color color;

  MenuCard({required this.title, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      child: Card(
        color: color,
        child: Center(
          child: Text(
            title,
            style: TextStyle(
              fontSize: 24.0,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
