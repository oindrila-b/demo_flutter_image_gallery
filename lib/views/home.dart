import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:imagegallery/Data/data.dart';
import 'package:imagegallery/model/wallpaper_model.dart';
import 'package:imagegallery/views/categorie.dart';
import 'package:imagegallery/views/image_view.dart';
import 'package:imagegallery/views/search.dart';
import 'package:imagegallery/widget/widget.dart';
import 'package:http/http.dart' as http;
import '../model/categories_model.dart';

class Home extends StatefulWidget {
  @override
  _HomeState  createState() => _HomeState();
}

class _HomeState extends State<Home> {

  List<CategoriesModel> categories  = [];
  List<WallpaperModel> wallpapers  =[];
  TextEditingController searchController =  new TextEditingController();

getTrendingPhotos() async{
  var response = await http.get(Uri.parse("https://api.pexels.com/v1/curated?per_page=30"),
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
      getTrendingPhotos();
    categories = getCategories();
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
              child: Row(children: <Widget>[
                Expanded(
                  child: TextField(
                    controller: searchController,
                    decoration: InputDecoration(
                      hintText: "Search Images",
                      border: InputBorder.none
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => Search(
                    searchQuery: searchController.text,
                    )
                    ));
                  },
                  child: Container(
                      child: Icon( Icons.search )),
                )
              ],),
            ),
            SizedBox(height: 16,),
            Container(
              height: 80,
              child: ListView.builder(
                padding: EdgeInsets.symmetric(horizontal: 24),
                  itemCount : categories.length,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                return CategorieTile(
                  title: categories[index].categoriesName,
                  imageUrl: categories[index].imageUrl,
                );
    }),
            ),
            wallpapersList(wallpapers : wallpapers, context : context)
          ],
        ),),
      ),
    );
}
}

class CategorieTile extends StatelessWidget {
  final String imageUrl, title;
CategorieTile({required this.title, required this.imageUrl});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) =>
          Categorie(categoryName: title.toLowerCase(),
                    )
        ));
      },
      child: Container(
        margin: EdgeInsets.only(right: 8),
        child: Stack( children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(imageUrl, height: 50, width: 100,fit: BoxFit.cover,),
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.black26,
                borderRadius: BorderRadius.circular(10),
              ),
              height: 50, width: 100,
              alignment: Alignment.center,
              child: Text(title, style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500, fontSize: 16),),
            ),
          ],
        ),
      ),
    );
  }


}

