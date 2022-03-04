import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../Data/data.dart';
import '../model/wallpaper_model.dart';
import '../widget/widget.dart';


class Categorie extends StatefulWidget {
  final String categoryName;
  Categorie({required this.categoryName});

  @override
  _CategorieState createState() => _CategorieState();
}

class _CategorieState extends State<Categorie> {

  List<WallpaperModel> wallpapers  =[];

  getSearchedPhotos(String query) async{
    var response = await http.get(Uri.parse("https://api.pexels.com/v1/search?query=$query&per_page=30&page=1"),
        headers: { "Authorization" : apiKey.toString() });
    print("Here");
    print(response.body);
    Map<String,dynamic> jsonData = jsonDecode(response.body);
    jsonData["photos"].forEach((element){
      WallpaperModel wallpaperModel = WallpaperModel.fromMap(element);
      wallpapers.add(wallpaperModel);
    });

    setState(() { });
  }

  @override
  void initState() {
    getSearchedPhotos(widget.categoryName);
super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white ,
        title: brandName(),
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
       child:     wallpapersList(wallpapers : wallpapers, context : context),
      ),
    );
  }

}
