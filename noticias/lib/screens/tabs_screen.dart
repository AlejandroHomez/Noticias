import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:noticias/screens/screens.dart';
import 'package:noticias/services/news_service.dart';
import 'package:provider/provider.dart';

class TabsScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => new _NavigationModel(),
      child: Scaffold(
        body: _Paginas(),
        bottomNavigationBar: _Navegacion(),
       ),
    );
  }
}

class _Navegacion extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

  final navigationModel = Provider.of<_NavigationModel>(context);
  // final size = MediaQuery.of(context).size;

    return BottomNavigationBar(
      onTap: (i) { 

        final newsService = Provider.of<NewsService>(context, listen: false);
  
          newsService.selectedCategory = 'business';
         newsService.selectedCategoryInternational = 'general';
        
        navigationModel.paginaActual = i;},
      currentIndex: navigationModel.paginaActual,
      items: [
        
        BottomNavigationBarItem(
        
          icon: Icon(FontAwesomeIcons.newspaper),
          label: 'General'
        ),

        BottomNavigationBarItem(
          icon: Icon(FontAwesomeIcons.accusoft), 
          label: 'Encabezados' 
          ),

           BottomNavigationBarItem(
          icon: Icon(FontAwesomeIcons.paperPlane), 
          label: 'Internacional' 
          ),
      ]
      
      );
  }
}

class _Paginas extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

  final navigationModel = Provider.of<_NavigationModel>(context); 

    return PageView(
      controller: navigationModel.pageController,
      physics: NeverScrollableScrollPhysics(),
      children: [
        Tab1Screen(),
        Tab2Screen(),
        Tab3Screen(),
      ],
    );
  }
}

class _NavigationModel extends ChangeNotifier{

  int _paginaActual = 0;

  PageController _pageController =  new PageController();

  int get paginaActual => this._paginaActual;

  set paginaActual(int valor) {
    this._paginaActual = valor;

    _pageController.animateToPage(
      valor, 
      duration: Duration(milliseconds: 500), 
      curve: Curves.easeOut);

    notifyListeners();
  }

  PageController get pageController => this._pageController;

}