import 'package:flutter/material.dart';
import 'package:noticias/services/news_service.dart';
import 'package:noticias/widgets/lista_noticias.dart';
import 'package:provider/provider.dart';

class Tab1Screen extends StatefulWidget {

  @override
  _Tab1ScreenState createState() => _Tab1ScreenState();
}

class _Tab1ScreenState extends State<Tab1Screen> with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {

  final headLines = Provider.of<NewsService>(context).headLines; 
  super.build(context);
    return SafeArea(
      child: Scaffold(
        // backgroundColor: Colors.red,
        body: (headLines.length == 0 )
        ? Center( child: CircularProgressIndicator(color: Colors.redAccent), )
        : ListaNoticias(headLines)
       ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}