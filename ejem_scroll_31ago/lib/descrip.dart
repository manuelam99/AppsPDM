import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Descripcion extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Container(
      margin: EdgeInsets.all(5),
      child: Text('Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla vel pulvinar nisi, viverra finibus magna. Nunc velit enim, lobortis vel diam in, tempus cursus justo. Nam consequat lorem commodo, porta urna id, dapibus nisl. Sed sed justo sit amet odio vulputate ultricies. Aliquam rhoncus facilisis tincidunt. Fusce lobortis nisi at posuere ullamcorper. Proin auctor orci et augue porttitor euismod. Nulla dapibus turpis a erat rhoncus semper quis at nunc.',
        style: GoogleFonts.montserrat(),
      ),
    );
  }
}