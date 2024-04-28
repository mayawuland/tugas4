import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tugas4/home.dart';
import 'package:tugas4/login.dart';
import 'package:tugas4/stopwatch.dart';

class PanduanAplikasiPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Panduan Aplikasi'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildMenuSection(
              title: 'Menu Daftar Anggota',
              description:
              'Menu ini memungkinkan Anda untuk melihat daftar anggota kelompok.',
            ),
            _buildMenuSection(
              title: 'Menu Menampilkan Bilangan Prima',
              description:
              'Menu ini akan menampilkan bilangan prima dari suatu rentang yang ditentukan.',
            ),
            _buildMenuSection(
              title: 'Menu Menghitung Luas dan Keliling Segitiga',
              description:
              'Menu ini terbagi menjadi dua menu lainnya yaitu menu hitung keliling dan hitung luas segitiga yang memungkinkan Anda untuk menghitung luas dan keliling segitiga berdasarkan input yang Anda berikan.',
            ),
            _buildMenuSection(
              title: 'Daftar Situs Rekomendasi untuk Membaca',
              description:
              'Menu ini menyajikan daftar situs yang direkomendasikan untuk membaca. Selain itu Anda juga dapat menambahkan situs ke dalam menu favorite.',
            ),
            _buildMenuSection(
              title: 'Menu Favorite',
              description:
              'Menu ini memungkinkan Anda untuk menambahkan dan mengelola daftar favorit Anda.',
            ),
            _buildMenuSection(
              title: 'Bottom Navigation',
              description:
              'Bottom Navigation terdiri dari empat menu yaitu: home, info, stopwatch, dan logout.',
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home, color: Colors.grey),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.info, color: Colors.blue),
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
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => HomePage(),
              ),
            );
          } else if (index == 1) {
            //
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

  Widget _buildMenuSection({required String title, required String description}) {
    return Container(
      margin: EdgeInsets.only(bottom: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 8.0),
          Text(
            description,
            style: TextStyle(fontSize: 16.0),
          ),
        ],
      ),
    );
  }
}
