import 'package:flutter/material.dart';
import 'package:layout_basic/models/tourism_model.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({Key? key, required this.place}) : super(key: key);

  final TourismPlace place;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Image.asset(place.imageAssets),
          Container(
            margin: const EdgeInsets.only(top: 16.0),
            child: Text(
              place.name,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 35, fontFamily: "Lobster"),
            ),
          ),
          Container(
            margin: const EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    const Icon(Icons.calendar_today_outlined),
                    Text(
                      place.hariBuka,
                      style: const TextStyle(fontSize: 8),
                    )
                  ],
                ),
                Column(
                  children: <Widget>[
                    const Icon(Icons.access_time_outlined),
                    Text(
                      place.jamBuka,
                      style: const TextStyle(fontSize: 8),
                    )
                  ],
                ),
                Column(
                  children: <Widget>[
                    const Icon(Icons.attach_money),
                    Text(
                      place.hargaTiket,
                      style: const TextStyle(fontSize: 8),
                    )
                  ],
                )
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(16),
            child: Text(
              place.Deskripsi,
              style: const TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.normal,
                  color: Colors.grey,
                  fontFamily: "Oxygen"),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(
            height: 150,
            child: ListView.builder(
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(4),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15.0),
                    child: Image.asset(place.galleryAssets[index]),
                  ),
                );
              },
              scrollDirection: Axis.horizontal,
              itemCount: place.galleryAssets.length,
            ),
          )
        ],
      )),
    );
  }
}
