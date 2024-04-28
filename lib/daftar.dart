import 'package:flutter/material.dart';

class DaftarAnggota extends StatelessWidget {
  // Contoh daftar anggota
  final List<Member> members = [
    Member(
      name: 'Maya Wulandari',
      imageUrl: 'assets/images/maya.jpg',
      info: 'NIM 123210050',
    ),
    Member(
      name: 'Restiana Anggraeni',
      imageUrl: 'assets/images/restiana.jpg',
      info: 'NIM 123210059',
    ),
    Member(
      name: 'Berlyandhica Alam F.',
      imageUrl: 'assets/images/berlyandhica.jpg',
      info: 'NIM 123210060',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Daftar Anggota'), // Ubah judul sesuai kebutuhan
      ),
      body: ListView.builder(
        itemCount: members.length,
        itemBuilder: (BuildContext context, int index) {
          return MemberCard(
            member: members[index],
          );
        },
      ),
    );
  }
}

class Member {
  final String name;
  final String imageUrl;
  final String info;

  Member({
    required this.name,
    required this.imageUrl,
    required this.info,
  });
}

class MemberCard extends StatelessWidget {
  final Member member;

  const MemberCard({
    required this.member,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3, // Tambahkan bayangan pada card
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20), // Atur margin card
      child: Container(
        padding: EdgeInsets.all(10), // Atur padding untuk konten card
        child: Row(
          children: [
            ClipOval(
              child: Image.asset(
                member.imageUrl,
                width: 100,
                height: 100,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(width: 20), // Beri jarak antara gambar dan teks
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  member.name,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 5), // Beri jarak antara teks nama dan info
                Text(
                  member.info,
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
