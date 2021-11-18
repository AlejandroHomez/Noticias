import 'package:flutter/material.dart';
import 'package:noticias/screens/screens.dart';
import 'package:noticias/services/news_service.dart';
import 'package:noticias/theme/myTheme.dart';
import 'package:provider/provider.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: ( _ ) => new NewsService(),)
      ],
      
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Noticias',
        initialRoute: 'tabHome',
        theme: myTheme,
    
        routes: {
          'tabHome' : ( _ ) => TabsScreen(),
          'tag1'    : ( _ ) => Tab1Screen(),
          'tag2'    : ( _ ) => Tab1Screen(),
        },
        
      ),
    );
  }
}