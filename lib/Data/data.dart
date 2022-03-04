import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import '../model/categories_model.dart';


var apiKey = dotenv.env['API_KEY'];
List<CategoriesModel> getCategories()   {
  List<CategoriesModel> categories  = new List.empty(growable: true);
    CategoriesModel categoriesModel = new CategoriesModel();


  categoriesModel.imageUrl="https://images.pexels.com/photos/66877/butterfly-exotic-south-america-amazon-66877.jpeg?auto=compress&cs=tinysrgb&h=650&w=940";
  categoriesModel.categoriesName = "Butterfly";
  categories.add(categoriesModel);
  categoriesModel = new CategoriesModel();

  categoriesModel.imageUrl = "https://images.pexels.com/photos/11284549/pexels-photo-11284549.jpeg?auto=compress&cs=tinysrgb&h=650&w=940";
  categoriesModel.categoriesName = "Street Art";
  categories.add(categoriesModel);
  categoriesModel = new CategoriesModel();

  categoriesModel.imageUrl = "https://images.pexels.com/photos/120049/pexels-photo-120049.jpeg?auto=compress&cs=tinysrgb&h=650&w=940";
  categoriesModel.categoriesName = "Cars";
  categories.add(categoriesModel);
  categoriesModel = new CategoriesModel();

  categoriesModel.imageUrl = "https://images.pexels.com/photos/1095550/pexels-photo-1095550.jpeg?auto=compress&cs=tinysrgb&h=650&w=940";
  categoriesModel.categoriesName = "Food";
  categories.add(categoriesModel);
  categoriesModel = new CategoriesModel();

  categoriesModel.imageUrl = "https://images.pexels.com/photos/844297/pexels-photo-844297.jpeg?auto=compress&cs=tinysrgb&h=650&w=940";
  categoriesModel.categoriesName = "Sky";
  categories.add(categoriesModel);
  categoriesModel = new CategoriesModel();

  categoriesModel.imageUrl="https://images.pexels.com/photos/15286/pexels-photo.jpg?auto=compress&cs=tinysrgb&h=650&w=940";
  categoriesModel.categoriesName = "Nature";
  categories.add(categoriesModel);
  categoriesModel = new CategoriesModel();

  categoriesModel.imageUrl="https://images.pexels.com/photos/189349/pexels-photo-189349.jpeg?auto=compress&cs=tinysrgb&h=650&w=940";
  categoriesModel.categoriesName = "Sea";
  categories.add(categoriesModel);
  categoriesModel = new CategoriesModel();

  categoriesModel.imageUrl="https://images.pexels.com/photos/1654698/pexels-photo-1654698.jpeg?auto=compress&cs=tinysrgb&h=650&w=940";
  categoriesModel.categoriesName = "Sunlight";
  categories.add(categoriesModel);
  categoriesModel = new CategoriesModel();


  return categories;
}



