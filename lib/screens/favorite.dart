import 'package:bicycle/data/favorite_data.dart';
import 'package:bicycle/provider/favorite_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Favorite extends StatefulWidget {
  @override
  _FavoriteState createState() => _FavoriteState();
}

class _FavoriteState extends State<Favorite> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      child: Consumer<FavoriteProvider>(
        builder: (context, model, child) {
          final favoriteList = model.favoriteList;
          return ListView.builder(
            itemCount: favoriteList.length,
            itemBuilder: (BuildContext context, int index) {
              final favorite = favoriteList[index];
              return Card(
                margin: EdgeInsets.all(6),
                child: Padding(
                  padding: const EdgeInsets.all(6),
                  child: ListTile(
                    title: Text(favorite.spotName),
                    trailing: Wrap(
                      children: [
                        IconButton(
                          icon: Icon(Icons.location_on, color: Colors.redAccent,),
                          splashRadius: 24,
                          onPressed: _jumpToSpot,
                        ),
                        IconButton(
                          icon: Icon(Icons.delete),
                          splashRadius: 24,
                          onPressed: () {
                            // TODO: 削除確認ダイアログ出す
                            model.deleteFavoriteSpot(favorite.id);
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }
          );
        }
      ),
    );
  }

  void _jumpToSpot() {
    print('スポットへ移動！');
  }

}