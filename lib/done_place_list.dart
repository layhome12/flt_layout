import 'package:flutter/material.dart';
import 'package:layout_basic/models/tourism_model.dart';
import 'package:layout_basic/provider/done_tourism_provider.dart';
import 'package:provider/provider.dart';

class DonePlaceList extends StatelessWidget {
  const DonePlaceList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<TourismDetail> doneTourismPlaceList =
        Provider.of<DoneTourismProvider>(context, listen: false)
            .doneTourismPlaceList;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Wisata Dikunjungi'),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          final TourismDetail place = doneTourismPlaceList[index];
          return Card(
            color: Colors.white54,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Image.asset(place.wisataImg),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        SizedBox(
                          width: double.infinity,
                          child: Text(
                            place.wisataNama,
                            style: const TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                            textAlign: TextAlign.left,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 0, top: 4),
                          child: SizedBox(
                            width: double.infinity,
                            child: Text(
                              place.wisataLokasi,
                              textAlign: TextAlign.left,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                const Icon(Icons.done_outline)
              ],
            ),
          );
        },
        itemCount: doneTourismPlaceList.length,
      ),
    );
  }
}
