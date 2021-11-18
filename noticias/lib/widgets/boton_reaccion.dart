import 'package:flutter/material.dart';
import 'package:flutter_reaction_button/flutter_reaction_button.dart';

class BotonReaccion extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return Container(
      padding: EdgeInsets.only(left: 5, right: 5),
      // width: 80,
      decoration: BoxDecoration(
         borderRadius: BorderRadius.circular(10),
         gradient: LinearGradient(
           colors: [

             Colors.white,
             Colors.grey.shade200

           ]
           )
      ),
      child: Builder(
               builder: (contex) => FlutterReactionButton(
                onReactionChanged: (reaction, index) {

                  Text('Seleccionada: $index');
                },
                boxColor: Colors.white.withOpacity(0.9),
                boxPadding: EdgeInsets.all(5),
                boxRadius: 10,
                boxAlignment: AlignmentDirectional.bottomCenter,
                
                reactions: <Reaction>[

                  Reaction(
                    previewIcon: buildWidgetPreview(
                    'Me gusta', 
                     'assets/like.gif',
                    ),
                    icon: Padding(
                      padding: const EdgeInsets.all(4),
                      child: Row(
                        children: [
                          Image(image: AssetImage('assets/like.gif'), height: 30,),
                          SizedBox(width: 5),
                          Text('Me agrada', style: TextStyle(color: Color.fromRGBO(45, 222, 167, 1), fontWeight: FontWeight.w300),)
                        ],
                      ),
                    ),

                  ),
                   Reaction(
                    previewIcon: buildWidgetPreview(
                      'Me encanta',
                      'assets/meEncanta.gif',
                    ),
                    icon: Padding(
                      padding: const EdgeInsets.all(4),
                      child: Row(
                        children: [
                          Image(
                            image: AssetImage('assets/meEncanta.gif'),
                            height: 30,
                          ),
                          SizedBox(width: 5),
                          Text(
                            'Maravilloso!!', style: TextStyle(color:  Color.fromRGBO(239, 82, 103, 1), fontWeight: FontWeight.w300),
                          )
                        ],
                      ),
                    ),

                  ),
                  
                   Reaction(
                    previewIcon: buildWidgetPreview(
                      'Me enoja',
                      'assets/enoja.gif',
                    ),
                    icon: Padding(
                      padding: const EdgeInsets.all(4),
                      child: Row(
                        children: [
                          Image(
                            image: AssetImage('assets/enoja.gif'),
                            height: 30,
                          ),
                          SizedBox(width: 5),
                          Text(
                            'Me enoja', style: TextStyle(color:  Color.fromRGBO(239, 112, 82, 1), fontWeight: FontWeight.w300),
                          )
                        ],
                      ),
                    ),


                  ),
                  
                   Reaction(
                    previewIcon: buildWidgetPreview(
                      'Me sorprende',
                      'assets/sorprendido.gif',
                    ),
                    icon: Padding(
                      padding: const EdgeInsets.all(4),
                      child: Row(
                        children: [
                          Image(image: AssetImage('assets/sorprendido.gif'), height: 30,),
                          SizedBox(width: 5),
                          Text('OMG!!', style: TextStyle(color:  Color.fromRGBO(252, 214, 111, 1), fontWeight: FontWeight.w300),)
                        ],
                      ),
                    ),

                  ),
                  
                ],
                initialReaction: Reaction(
                  previewIcon: buildWidgetPreview(
                    'English',
                     'assets/like.gif'
                  ),
                 icon: Padding(
                      padding: const EdgeInsets.all(4),
                      child: Row(
                        children: [
                          Image(image: AssetImage('assets/like.gif'), height: 30,),
                          SizedBox(width: 5),
                          Text('Me agrada', style: TextStyle(color:  Color.fromRGBO(45, 222, 167, 1), fontWeight: FontWeight.w300),)
                        ],
                      ),
                    ),

                ),
              )
                ),
    );
  }

   Widget buildWidgetPreview(String title, String imagen){

     return Container(
       margin: EdgeInsets.only(left: 5, right: 5),
       child: Column(
         children: [
           Image(image: AssetImage(imagen), height: 45, fit: BoxFit.cover,),
         ],
       ),
     );

  }


}
