import 'package:flutter/material.dart';
import 'package:tugas4/datasitus.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailPageSitus extends StatelessWidget {
  final DataSitus situs;

  DetailPageSitus({required this.situs});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(situs.name),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.network(
                situs.imageLink,
                width: 200,
                height: 200,
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Favorite',
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    Text(
                      situs.countFavorite.toString(),
                      style: TextStyle(fontSize: 16),
                    ),
                    Text(
                      'Deskripsi',
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    Text(
                      situs.description,
                      textAlign: TextAlign.justify,
                      style: TextStyle(fontSize: 16),
                    ),
                    Padding(padding: EdgeInsets.all(16.0)),
                    ElevatedButton(
                      onPressed: () {
                        _launchURL(situs.link);
                      },
                      child: Text('Kunjungi Situs'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _launchURL(String url) async {
    final Uri _url = Uri.parse(url);
    if(!await launchUrl(_url)){
      throw 'Could not launch $url';
    }
  }
}