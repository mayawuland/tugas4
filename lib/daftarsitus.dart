import 'package:flutter/material.dart';
import 'package:tugas4/datasitus.dart';
import 'package:tugas4/detailpagesitus.dart';

class HomePageSitus extends StatefulWidget {
  @override
  HomePageSitusState createState() => HomePageSitusState();
}

class HomePageSitusState extends State<HomePageSitus> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Rekomendasi Situs Bacaan'),
      ),
      body: ListView.builder(
        itemCount: listSitus.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              leading: Image.network(
                  listSitus[index].imageLink,
                  width: 50,
                  height: 50,
                  fit: BoxFit.cover
              ),
              title: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          listSitus[index].name,
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                        ),
                        Text(
                          listSitus[index].countFavorite.toString() + ' Favorite',
                          style: TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                  IconButton(
                    icon: Icon(
                      listSitus[index].isFavorite ? Icons.favorite : Icons.favorite_border,
                      color: listSitus[index].isFavorite ? Colors.red : null,
                    ),
                    onPressed: () {
                      setState(() {
                        listSitus[index].isFavorite = !listSitus[index].isFavorite;
                        if(listSitus[index].isFavorite)
                          listSitus[index].countFavorite++;
                        else
                          listSitus[index].countFavorite--;
                      });
                      _handleFavorite(context, listSitus[index]);
                    },
                  ),
                ],
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailPageSitus(situs: listSitus[index]),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }

  void _handleFavorite(BuildContext context, DataSitus situs) {
    String message = situs.isFavorite ? 'Berhasil menambahkan ' + situs.name + ' ke favorit' : 'Berhasil menghapus ' + situs.name + ' dari favorit';

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: situs.isFavorite ? Colors.green : Colors.red,
      ),
    );
  }
}