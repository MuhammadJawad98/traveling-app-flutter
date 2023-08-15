import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapPageProvider extends ChangeNotifier {
  List<Marker> _markersList = [];

  List<Marker> get markersList => _markersList;

  void addMarkers() {
    _markersList.add(
      Marker(
        markerId: const MarkerId('1'),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueAzure),
        position: const LatLng(37.42, -122.08),
        infoWindow: const InfoWindow(title: 'My Home Location'),
      ),
    );
    notifyListeners();
  }

  void addMarkers1(Completer<GoogleMapController> _controller) async {
    _markersList.add(
      Marker(
        markerId: const MarkerId('2'),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
        position: const LatLng(37.42, -121.08745847),
        infoWindow: const InfoWindow(title: 'My sjhfsd Location'),
      ),
    );
    GoogleMapController controller = await _controller.future;
    controller.animateCamera(
      CameraUpdate.newCameraPosition(
        const CameraPosition(target: LatLng(37.42, -121.08745847), zoom: 14),
      ),
    );

    notifyListeners();
  }
}
