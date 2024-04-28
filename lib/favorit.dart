import 'package:flutter/material.dart';
import 'package:tugas4/datasitus.dart';
import 'package:tugas4/detailpagesitus.dart';

class HomePageSitusFavorite extends StatefulWidget {
  @override
  HomePageSitusFavoriteState createState() => HomePageSitusFavoriteState();
}

class HomePageSitusFavoriteState extends State<HomePageSitusFavorite> {
  List<DataSitus> favoriteSitus = [];

  @override
  void initState() {
    super.initState();
    _getFavoriteSitus();
  }

  void _getFavoriteSitus() {
    setState(() {
      favoriteSitus = listSitus.where((situs) => situs.isFavorite).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Situs Bacaan Favoritku'),
      ),
      body: ListView.builder(
        itemCount: favoriteSitus.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              leading: Image.network(
                  favoriteSitus[index].imageLink,
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
                          favoriteSitus[index].name,
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                        ),
                        Text(
                          favoriteSitus[index].countFavorite.toString() + ' Favorite',
                          style: TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                  IconButton(
                    icon: Icon(
                      favoriteSitus[index].isFavorite ? Icons.favorite : Icons.favorite_border,
                      color: favoriteSitus[index].isFavorite ? Colors.red : null,
                    ),
                    onPressed: () {
                      setState(() {
                        favoriteSitus[index].isFavorite = !favoriteSitus[index].isFavorite;
                        if(favoriteSitus[index].isFavorite)
                          favoriteSitus[index].countFavorite++;
                        else
                          favoriteSitus[index].countFavorite--;
                      });
                      _handleFavorite(context, favoriteSitus[index]);
                      _getFavoriteSitus();
                    },
                  ),
                ],
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailPageSitus(situs: favoriteSitus[index]),
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