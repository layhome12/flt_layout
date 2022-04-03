import 'package:flutter/cupertino.dart';
import 'package:layout_basic/models/tourism_model.dart';

class DoneTourismProvider extends ChangeNotifier {
  final List<TourismDetail> _doneTourismPlaceList = [];

  List<TourismDetail> get doneTourismPlaceList => _doneTourismPlaceList;

  void complete(TourismDetail place, bool isDone) {
    isDone
        ? _doneTourismPlaceList.add(place)
        : _doneTourismPlaceList.remove(place);
    notifyListeners();
  }
}
