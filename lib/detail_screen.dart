import 'package:flutter/material.dart';
import 'package:layout_basic/models/tourism_model.dart';

class DetailScreen extends StatelessWidget {
  final TourismDetail place;

  const DetailScreen({Key? key, required this.place}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Image.network(place.wisataImg),
          Container(
            margin: const EdgeInsets.only(top: 16.0),
            child: Text(
              place.wisataNama,
              textAlign: TextAlign.center,
              style: const TextStyle(
                  fontSize: 35, fontFamily: "Lobster", color: Colors.black87),
            ),
          ),
          Container(
            margin: const EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    const Icon(
                      Icons.calendar_today_outlined,
                      color: Colors.grey,
                    ),
                    Text(
                      place.wisataHariBuka,
                      style: const TextStyle(fontSize: 10),
                    )
                  ],
                ),
                Column(
                  children: <Widget>[
                    const Icon(
                      Icons.access_time_outlined,
                      color: Colors.grey,
                    ),
                    Text(
                      place.wisataJamKerja,
                      style: const TextStyle(fontSize: 10),
                    )
                  ],
                ),
                Column(
                  children: <Widget>[
                    const Icon(
                      Icons.attach_money,
                      color: Colors.grey,
                    ),
                    Text(
                      'Rp. ' + place.wisataHargaHtm.toString(),
                      style: const TextStyle(fontSize: 10),
                    )
                  ],
                )
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(16),
            child: Text(
              place.wisataDeskripsi,
              style: const TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.normal,
                  color: Colors.black87,
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
                    child: Image.network(place.wisataListImg[index]),
                  ),
                );
              },
              scrollDirection: Axis.horizontal,
              itemCount: place.wisataListImg.length,
            ),
          )
        ],
      )),
    );
  }
}
