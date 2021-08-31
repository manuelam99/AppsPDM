import 'package:flutter/material.dart';

class ImagenMonke extends StatelessWidget{

  Widget build(BuildContext context){
    return Image.network('https://i1.sndcdn.com/artworks-Ui1bfLGkw53VwO9T-QpgzmA-t500x500.jpg',
    height: 300,);
  }
}