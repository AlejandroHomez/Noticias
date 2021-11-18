import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:noticias/models/catecory_model.dart';
import 'package:noticias/models/news_models.dart';
import 'package:http/http.dart' as http;

final _Url_News = 'https://newsapi.org/v2';
final _Api_Key = '6972d28208634f5886deaf57426b4b41';

class NewsService with ChangeNotifier {

List<Article> headLines = [];

String _selectedCategory = 'business';
String _selectedCategoryInternational = 'general';

List<Category> categories = [
  Category(FontAwesomeIcons.building, 'business'),
  Category(FontAwesomeIcons.cubes, 'entertainment'),
  Category(FontAwesomeIcons.bars, 'general'),
  Category(FontAwesomeIcons.heartbeat, 'health'),
  Category(FontAwesomeIcons.battleNet, 'science'),
  Category(FontAwesomeIcons.biking, 'sports'),
  Category(FontAwesomeIcons.galacticSenate, 'technology'),
];

List<Category> categoriasInternacional = [
    Category(FontAwesomeIcons.paperPlane, 'general'),
    Category(FontAwesomeIcons.headset, 'game'),
  ];


Map<String, List<Article>> categoryArticles = {};
Map<String, List<Article>> categoryInternational = {};


NewsService(){
  this.getTopHealines();

  categoriasInternacional.forEach((element) {
    this.categoryInternational[element.name] = [];
   });

  categories.forEach((item) { 
    this.categoryArticles[item.name] = [];

  });
}

get getSelectCategoryInternational => this._selectedCategoryInternational;


set selectedCategoryInternational(String valor){
  this._selectedCategoryInternational = valor;

  this.getEverythings(valor);
  notifyListeners();
}

get getSelectedCategory => this._selectedCategory;

set selectedCategory(String valor){
  this._selectedCategory = valor;

  this.getArticlesCategoria(valor);
  notifyListeners();
}

List<Article>? get getArticulosCategoriaSelecccionada => this.categoryArticles[this.getSelectedCategory];

List<Article>? get getCategoriaSeleccionada => this.categoryInternational[this.getSelectCategoryInternational];

getTopHealines() async {

  final url = Uri.parse('$_Url_News/top-headlines?apiKey=$_Api_Key&country=co');
  final resp = await http.get(url);

  final newsResponse = newsResponseFromJson( resp.body );

  this.headLines.addAll(newsResponse.articles!);
  notifyListeners();

}


getEverythings(String categoryInter) async {

    if (this.categoryInternational[categoryInter]!.length > 0) {
      return this.categoryInternational[categoryInter];
    }
    //https://newsapi.org/v2/everything?apiKey=6972d28208634f5886deaf57426b4b41&q=general&language=es
    final url = Uri.parse('$_Url_News/everything?apiKey=$_Api_Key&q=$categoryInter&language=es');
    final resp = await http.get(url);

    final newsResponse = newsResponseFromJson(resp.body);

    this.categoryInternational[categoryInter]!.addAll(newsResponse.articles!);
    notifyListeners();
  }


getArticlesCategoria(String category) async {

  if (this.categoryArticles[category]!.length > 0 ) {
    return this.categoryArticles[category];
  }

  final url = Uri.parse('$_Url_News/top-headlines?apiKey=$_Api_Key&country=co&category=$category');
  final resp = await http.get(url);

  final newsResponse = newsResponseFromJson( resp.body );

  this.categoryArticles[category]!.addAll(newsResponse.articles!);
  notifyListeners();

}


}

