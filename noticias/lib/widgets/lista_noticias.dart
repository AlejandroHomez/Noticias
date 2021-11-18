
import 'package:flutter/material.dart';
import 'package:noticias/models/news_models.dart';
import 'package:noticias/theme/myTheme.dart';
import 'package:noticias/widgets/boton_reaccion.dart';

import 'package:url_launcher/url_launcher.dart';

class ListaNoticias extends StatelessWidget {

  final List<Article> noticias;

  const ListaNoticias( this.noticias );

  @override
  Widget build(BuildContext context) {

    return ListView.builder(
      physics: BouncingScrollPhysics(),
      itemCount: noticias.length,
      itemBuilder: (BuildContext context, int index) {
      return _Noticia(noticias[index], index);
     },
    );
  }
}

class _Noticia extends StatelessWidget {

  final Article noticia;
  final int index;

  const _Noticia( this.noticia, this.index) ;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5, vertical: 3),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          _NumeroNoticia(noticia, index),
          Text('${noticia.publishedAt!}', style: TextStyle(color: Colors.white60),),

          SizedBox(height: 5),

          _TituloNoticia(noticia, index),
          _ImagenNoticia(noticia, index),

          SizedBox(height:10),

          _BotonesNoticias(noticia),

          SizedBox(height: 10),


          Divider()
          

        ],
      ),
    );
  }
}

class _NumeroNoticia extends StatelessWidget {

  final Article noticia;
  final int index;

  const _NumeroNoticia( this.noticia, this.index,);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Text('Fuente: ', style: TextStyle(color: myTheme.accentColor ),),
          Text('${noticia.source!.name}', style: TextStyle(color: Colors.white60 ),),
          Expanded(child: Container()),
        ],
      ),
    );
  }
}

class _TituloNoticia extends StatelessWidget {
  
  final Article noticia;
  final int index;

  const _TituloNoticia( this.noticia, this.index,);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 2),
        Text(noticia.title ?? '', style: TextStyle(fontWeight: FontWeight.bold),),
        SizedBox(height: 2),
        Text(noticia.description ?? '')
      ],
    );
  }
}

class _ImagenNoticia extends StatelessWidget {
  final Article noticia;
  final int index;

  const _ImagenNoticia(
    this.noticia,
    this.index,
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5),
      child: Column(
        children: [

       (noticia.urlToImage != null)
      ? FadeInImage(
        placeholder: AssetImage('assets/loading.gif' ), 
        image: NetworkImage('${noticia.urlToImage}'),
        height: 210,
        width: double.infinity,
        fit: BoxFit.cover,
        )
      : Image(image: AssetImage('assets/noImage.jpg'), width: double.infinity, fit: BoxFit.cover,),

      SizedBox(height: 10),

      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Autor@ de la notícia: ', style: TextStyle(color: myTheme.accentColor),),
          Text('${noticia.author}'),
        ],
      )

        ],
      )
    );
  }
}

class _BotonesNoticias extends StatelessWidget {

  final Article noticias;

  const _BotonesNoticias( this.noticias);


  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,

      children: [
          BotonReaccion(),
        _BotonNavegacion(noticias: noticias),
        _BotonCompartir()
      ],
    );
  }

}

class _BotonNavegacion extends StatelessWidget {
  const _BotonNavegacion({
    Key? key,
    required this.noticias,
  }) : super(key: key);

  final Article noticias;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ()  async {

        String? url = noticias.url;

          if ( await canLaunch(url!)) {
            await launch(url);
          } else {
            throw 'Could not launch $url';
          }
        
      },
      child: Container(
        padding: EdgeInsets.all(5.5),
        height: 40,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          gradient: LinearGradient(
            colors: [
              Colors.redAccent,
              Colors.orangeAccent
            ])
          ),
        child: Row(
          children: [
            Text('${noticias.source!.name}',
            maxLines: 2,
            overflow: TextOverflow.ellipsis),

          ],
        ),
      ),
    );
  }
}

class _BotonCompartir extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      onTap: () {},
      child: Container(
        padding: EdgeInsets.all(5.5),
        // width: 80,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            gradient: LinearGradient(
                colors: [
                  Colors.blue, 
                  Colors.cyanAccent])),
        child: Icon(
          Icons.share,
          color: Colors.white,
          size: 28,
        ),
      ),
    );
  }
}