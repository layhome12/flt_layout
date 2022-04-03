import 'package:flutter/material.dart';
import 'package:layout_basic/models/tourism_model.dart';
import 'package:layout_basic/provider/done_tourism_provider.dart';
import 'package:provider/provider.dart';

import 'api/api_service.dart';
import 'detail_screen.dart';
import 'list_item.dart';

class TourismList extends StatefulWidget {
  const TourismList({Key? key}) : super(key: key);

  @override
  _TourismList createState() => _TourismList();
}

class _TourismList extends State<TourismList> {
  late Future<TourismResult> _tourismresult;

  @override
  void initState() {
    super.initState();
    _tourismresult = ApiService().getTourismList();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _tourismresult,
      builder: (context, AsyncSnapshot<TourismResult> snapshot) {
        var state = snapshot.connectionState;
        if (state != ConnectionState.done) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else {
          if (snapshot.hasData) {
            return ListView.builder(
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  var place = snapshot.data?.listData[index];

                  final List<TourismDetail> doneTourismPlaceList =
                      Provider.of<DoneTourismProvider>(context, listen: false)
                          .doneTourismPlaceList;

                  return InkWell(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return DetailScreen(
                          place: place!,
                        );
                      }));
                    },
                    child: Consumer<DoneTourismProvider>(
                      builder: (context, DoneTourismProvider data, widget) {
                        return ListItem(
                          place: place!,
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
                itemCount: snapshot.data?.listData.length);
          } else if (snapshot.hasError) {
            return Center(
              child: Text(snapshot.error.toString()),
            );
          } else {
            return const Center(
              child: Text('Data Masih Kosong !'),
            );
          }
        }
      },
    );
  }
}
