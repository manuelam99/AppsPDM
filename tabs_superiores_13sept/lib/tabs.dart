import 'package:flutter/material.dart';
import 'webviewejem.dart';

class MyTabBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 5,
        child: Scaffold(
          appBar: AppBar(
            bottom: TabBar(
              tabs: [
                Tab(
                  icon: Icon(Icons.music_note),
                  text: "Amazon",
                ),
                Tab(
                  icon: Icon(Icons.email),
                  text: "Bungie",
                ),
                Tab(
                  icon: Icon(Icons.gamepad),
                  text: "Craigslist",
                ),
                Tab(
                  icon: Icon(Icons.sailing),
                  text: "Guacamole",
                ),
                Tab(
                  icon: Icon(Icons.exit_to_app),
                  text: "Salir",
                )
              ],
            ),
            title: Text("Ejemplo Tabs"),
            backgroundColor: Colors.blue,
          ),
          body: TabBarView(children: [
            WebViewEjemplo("https://www.amazon.com.mx/"),
            WebViewEjemplo("https://www.bungie.net/"),
            WebViewEjemplo("https://mexicocity.craigslist.org/"),
            WebViewEjemplo("https://lab.anahuac.mx/guacamole"),
            Icon(Icons.exit_to_app),
          ]),
        ),
      ),
    );
  }
}
