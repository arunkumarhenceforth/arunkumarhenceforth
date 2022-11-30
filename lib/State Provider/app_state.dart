import 'dart:convert';

import 'package:flutter/cupertino.dart';
import '../Constant/Api handler.dart';
import '../Constant/constantfile.dart';

class AppState with ChangeNotifier{
  List<Album> _album=[];
  List<Album> get album {
    return _album;
  }
 // Future<void>
  // Future<void>
  getAlbum({searchString,date,order})async{
    final response1 = await httpRequest(REQUEST_TYPE.GET, ('${baseUrl}posts?limit=100&start=1${
        searchString==null?"":"&keyword=$searchString"}${date==null?"":"&date=$date"}&orderby=${order==null?"1":'$order'}'), { });
          print("Search---${response1.body}");
       if (response1.statusCode == 200) {
          List a = jsonDecode(response1.body);
            _album.clear();
            a.forEach((element) {
            _album.add(Album.fromJson(element));
             print('print -${a.toString()}');
          });
        } else {
          throw Exception('Failed to load album');
        }
       // notifyListeners();
   }
}