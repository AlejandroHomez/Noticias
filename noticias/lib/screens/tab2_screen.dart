import 'package:flutter/material.dart';
import 'package:noticias/models/catecory_model.dart';
import 'package:noticias/services/news_service.dart';
import 'package:noticias/widgets/lista_noticias.dart';
import 'package:provider/provider.dart';

class Tab2Screen extends StatefulWidget {

  @override
  _Tab2ScreenState createState() => _Tab2ScreenState();
}

class _Tab2ScreenState extends State<Tab2Screen> with AutomaticKeepAliveClientMixin {

  @override
  Widget build(BuildContext context) {

  final newsService = Provider.of<NewsService>(context); 
  super.build(context);
    return Scaffold(
      // backgroundColor: Colors.red,
      body: Column(
        children: [
          _ListaCategorias(),
          Expanded( child: ListaNoticias(newsService.getArticulosCategoriaSelecccionada!))
        ],
      )
   );
  }

  @override
  bool get wantKeepAlive => true;
}

class _ListaCategorias extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final categories = Provider.of<NewsService>(context).categories;
    final load = Provider.of<NewsService>(context);


    final List<String> categoriasRead = [
      'Negocios',
      'Entretenimiento',
      'General',
      'Salud',
      'Ciencia',
      'Deportes',
      'Tecnología',
    ];
    

    return SafeArea(
      child: Container(
        width: double.infinity,
        // color: Colors.red,
        height: 75,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          physics: BouncingScrollPhysics(),
          itemCount: categories.length,
          itemBuilder: (BuildContext context, int index) {
          return Column(
            children: [
              _Categoria(categories[index], categoriasRead[index]),
            ],
          ) ;
         },
        ),
      ),
    );
  }
}

class _Categoria extends StatelessWidget {
 final  Category category;
 final String categoryRead;

const _Categoria(this.category, this.categoryRead);  

  @override
  Widget build(BuildContext context) {

  final newsService = Provider.of<NewsService>(context);

    return GestureDetector(
      onTap:(){
      
      final newsService = Provider.of<NewsService>(context, listen: false);
      newsService.selectedCategory = category.name;

      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white.withOpacity(0.1)
        ),
        child: Column(
          children: [
            Icon(category.icon, 
            color: (newsService.getSelectedCategory == this.category.name )
            ? Color.fromRGBO(95, 255, 221, 1)
            : null 
            ),
            SizedBox(height: 5),
            Text(categoryRead, style: TextStyle(
              color: (newsService.getSelectedCategory == this.category.name)
                  ? Color.fromRGBO(95, 255, 221, 1)
                  : null
            ),),
          ],
        )),
    );
  }
}