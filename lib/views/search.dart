import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../Data/data.dart';
import '../model/wallpaper_model.dart';
import '../widget/widget.dart';

class Search extends StatefulWidget {
  final String searchQuery;
  Search({required this.searchQuery});

  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  List<WallpaperModel> wallpapers  =[];
  TextEditingController searchController =  new TextEditingController();

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
    getSearchedPhotos(widget.searchQuery);
    super.initState();

    searchController.text = widget.searchQuery;
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
        child: Container(
          child: Column(
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                  // color: Color(0xfff5f8fd)
                    color: Color(0xffF5F5F5),
                    borderRadius: BorderRadius.circular(24)
                ),
                padding: EdgeInsets.symmetric(horizontal: 20),
                margin: EdgeInsets.symmetric(horizontal: 24),
              ),
              SizedBox(height: 16,),
              wallpapersList(wallpapers : wallpapers, context : context)
            ],
          ),
        ),
      ),
    );
  }
}
