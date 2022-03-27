import "package:flutter/material.dart";
import 'package:layout_basic/done_place_list.dart';
import 'package:layout_basic/models/tourism_model.dart';
import 'package:layout_basic/tourism_list.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Wisata Surabaya"),
        actions: <Widget>[
          IconButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const DonePlaceList();
                }));
              },
              icon: const Icon(Icons.done_outline))
        ],
      ),
      body: TourismList(),
    );
  }
}
