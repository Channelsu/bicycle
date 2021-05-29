import 'package:bicycle/data/favorite_data.dart';
import 'package:flutter/material.dart';

class Favorite extends StatefulWidget {
  @override
  _FavoriteState createState() => _FavoriteState();
}

class _FavoriteState extends State<Favorite> {

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      child: ListView.builder(
        itemCount: favorites.length,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            margin: EdgeInsets.all(6),
            child: Padding(
              padding: const EdgeInsets.all(6),
              child: ListTile(
                title: Text(favorites[index]['name']),
                trailing: Wrap(
                  children: [
                    IconButton(
                      icon: Icon(Icons.location_on,color: Colors.redAccent,),
                      splashRadius: 24,
                      onPressed: _jumpToSpot,
                    ),
                    IconButton(
                      icon: Icon(Icons.delete),
                      splashRadius: 24,
                      onPressed: _deleteFavorite,
                    ),
                  ],
                ),
              ),
            ),
          );
        }
      ),
    );
  }

  void _jumpToSpot() {
    print('スポットへ移動！');
  }

  void _deleteFavorite() {
    print('このお気に入りを削除しますか？');
  }
}