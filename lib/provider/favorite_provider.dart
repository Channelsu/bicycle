import 'package:bicycle/model/favorite.dart';
import 'package:flutter/material.dart';

class FavoriteProvider extends ChangeNotifier {

  List<Favorite> _favoriteList = [
    Favorite(id: 1, spotName: '府中駐輪場'),
    Favorite(id: 2, spotName: '狛江第二駐輪場'),
    Favorite(id: 3, spotName: '新宿中央駐輪場'),
  ];

  List<Favorite> get favoriteList => _favoriteList;
}