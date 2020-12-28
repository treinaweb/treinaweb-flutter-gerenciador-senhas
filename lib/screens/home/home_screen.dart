import 'package:flutter/material.dart';
import 'package:treinapass/screens/home/components/body.dart';
import 'package:treinapass/screens/home/components/float_action_button.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
      floatingActionButton: buildFloatActionButton(context),
      appBar: AppBar(
        title: Text("treinapass"),
      ),
    );
  }
}
