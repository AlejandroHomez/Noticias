import 'package:flutter/material.dart';
import 'package:noticias/models/catecory_model.dart';
import 'package:noticias/services/news_service.dart';
import 'package:noticias/widgets/lista_noticias.dart';
import 'package:provider/provider.dart';

class Tab3Screen extends StatefulWidget {

  @override
  _Tab3ScreenState createState() => _Tab3ScreenState();
}

class _Tab3ScreenState extends State<Tab3Screen> with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {

  final newsService = Provider.of<NewsService>(context); 
  super.build(context);

    return Scaffold(
      // backgroundColor: Colors.red,
      body: Column(
        children: [
          _ListaCategorias(),
          Expanded( child: ListaNoticias(newsService.getCategoriaSeleccionada!))
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

    final categories = Provider.of<NewsService>(context).categoriasInternacional;
    
    final List<String> categoriaRead = [
      'General',
      'VideoJuegos',
    ];

    return SafeArea(
      child: Container(
        width: double.infinity,
        // color: Colors.red,
        height: 80,

        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          Expanded(child: _Categoria(categories[0], categoriaRead[0])),
          Expanded(child: _Categoria(categories[1], categoriaRead[1])),
          ],
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
      newsService.selectedCategoryInternational = category.name;

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
            color: (newsService.getSelectCategoryInternational == this.category.name )
            ? Color.fromRGBO(95, 255, 221, 1)
            : null 
            ),
            SizedBox(height: 5),
            Text(categoryRead, style: TextStyle(
              color: (newsService.getSelectCategoryInternational == this.category.name)
                  ? Color.fromRGBO(95, 255, 221, 1)
                  : null
            ),),
          ],
        )),
    );
  }
}