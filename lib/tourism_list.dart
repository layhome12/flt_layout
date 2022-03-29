import 'package:flutter/material.dart';
import 'package:layout_basic/models/tourism_model.dart';
import 'package:layout_basic/provider/done_tourism_provider.dart';
import 'package:provider/provider.dart';

import 'detail_screen.dart';
import 'list_item.dart';

class TourismList extends StatefulWidget {
  const TourismList({Key? key}) : super(key: key);

  @override
  _TourismList createState() => _TourismList();
}

class _TourismList extends State<TourismList> {
  final List<TourismPlace> tourismPlaceList = [
    TourismPlace(
        name: 'Submarine Surabaya',
        location: 'Jln. Jalan A N0 351, Surabaya',
        imageAssets: 'assets/images/submarine-surabaya.jpg',
        hariBuka: 'Open Everyday',
        jamBuka: '08:00-16:00',
        hargaTiket: 'Rp. 5.000',
        Deskripsi:
            "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged",
        galleryAssets: [
          'assets/images/submarine-surabaya.jpg',
          'assets/images/submarine-surabaya.jpg',
          'assets/images/submarine-surabaya.jpg',
          'assets/images/submarine-surabaya.jpg'
        ]),
    TourismPlace(
        name: 'Kelenteng Sanggar Agung',
        location: 'Jln. Jalan B N0 352, Surabaya',
        imageAssets: 'assets/images/klenteng-sanggar.jpg',
        hariBuka: 'Open Everyday',
        jamBuka: '08:00-19:00',
        hargaTiket: 'Rp. 10.000',
        Deskripsi:
            "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged",
        galleryAssets: [
          'assets/images/klenteng-sanggar.jpg',
          'assets/images/klenteng-sanggar.jpg',
          'assets/images/klenteng-sanggar.jpg'
        ]),
    TourismPlace(
        name: 'House of Sampoerna',
        location: 'Jln. Jalan C N0 353, Surabaya',
        imageAssets: 'assets/images/house-of-sampoerna.jpg',
        hariBuka: 'Open Everyday',
        jamBuka: '08:00-15:00',
        hargaTiket: 'Rp. 15.000',
        Deskripsi:
            "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged",
        galleryAssets: [
          'assets/images/house-of-sampoerna.jpg',
          'assets/images/house-of-sampoerna.jpg',
          'assets/images/house-of-sampoerna.jpg'
        ]),
    TourismPlace(
        name: 'Tugu Pahlawan',
        location: 'Jln. Jalan D N0 354, Surabaya',
        imageAssets: 'assets/images/tugu-pahlawan.jpg',
        hariBuka: 'Open Everyday',
        jamBuka: '08:00-17:00',
        hargaTiket: 'Rp. 2.000',
        Deskripsi:
            "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged",
        galleryAssets: [
          'assets/images/tugu-pahlawan.jpg',
          'assets/images/tugu-pahlawan.jpg',
          'assets/images/tugu-pahlawan.jpg'
        ]),
    TourismPlace(
        name: 'Patung Suro Boyo',
        location: 'Jln. Jalan E N0 355, Surabaya',
        imageAssets: 'assets/images/patung-surabaya.jpg',
        hariBuka: 'Open Everyday',
        jamBuka: '08:00-14:00',
        hargaTiket: 'Rp. 2.000',
        Deskripsi:
            "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged",
        galleryAssets: [
          'assets/images/patung-surabaya.jpg',
          'assets/images/patung-surabaya.jpg',
          'assets/images/patung-surabaya.jpg'
        ])
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        final TourismPlace place = tourismPlaceList[index];

        final List<TourismPlace> doneTourismPlaceList =
            Provider.of<DoneTourismProvider>(context, listen: false)
                .doneTourismPlaceList;

        return InkWell(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return DetailScreen(place: place);
            }));
          },
          child: Consumer<DoneTourismProvider>(
            builder: (context, DoneTourismProvider data, widget) {
              return ListItem(
                place: place,
                isDone: doneTourismPlaceList.contains(place),
                onCheckBoxClick: (bool? value) {
                  setState(() {
                    if (value != null) {
                      value
                          ? doneTourismPlaceList.add(place)
                          : doneTourismPlaceList.remove(place);
                    }
                  });
                },
              );
            },
          ),
        );
      },
      itemCount: tourismPlaceList.length,
    );
  }
}
