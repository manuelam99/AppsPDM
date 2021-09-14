import 'package:flutter/material.dart';

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
                Tab(icon: Icon(Icons.music_note)),
                Tab(icon: Icon(Icons.email)),
                Tab(icon: Icon(Icons.gamepad)),
                Tab(icon: Icon(Icons.sailing)),
                Tab(icon: Icon(Icons.exit_to_app))
              ],
            ),
            title: Text("Ejemplo Tabs"),
            backgroundColor: Colors.blue,
          ),
          body: TabBarView(children: [
            Icon(Icons.music_note),
            Icon(Icons.email),
            Icon(Icons.gamepad),
            Icon(Icons.sailing),
            Icon(Icons.exit_to_app),
          ]),
        ),
      ),
    );
  }
}
