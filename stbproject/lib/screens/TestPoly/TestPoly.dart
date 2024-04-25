/*import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'package:flutter_polyline_points/flutter_polyline_points.dart';

import '../../models/Agence.dart';

class MapScreen extends StatefulWidget {
  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  late GoogleMapController mapController;
  //36.846677, 10.207745
  //36.819837, 10.181969
  double _originLatitude = 36.846677, _originLongitude = 10.207745;
  double _destLatitude = 36.819837, _destLongitude = 10.181969;
  // double _originLatitude = 26.48424, _originLongitude = 50.04551;
  // double _destLatitude = 26.46423, _destLongitude = 50.06358;
  Map<MarkerId, Marker> markers = {};
  Map<PolylineId, Polyline> polylines = {};
  List<LatLng> polylineCoordinates = [];
  PolylinePoints polylinePoints = PolylinePoints();
  String googleAPiKey = "AIzaSyBn9NQtMUKL6_iYfLiAW6l8Y1AFtpSxb0Q";
  List<Agence> agences = [];


  @override
  void initState() {
    super.initState();

    /// origin marker
    _addMarker(LatLng(_originLatitude, _originLongitude), "origin",
        BitmapDescriptor.defaultMarker);

    /// destination marker
    _addMarker(LatLng(_destLatitude, _destLongitude), "destination",
        BitmapDescriptor.defaultMarkerWithHue(90));
    _getPolyline();
    //readJson();
    //_fillmarkers();

  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: GoogleMap(
            initialCameraPosition: CameraPosition(
                target: LatLng(_originLatitude, _originLongitude), zoom: 15),
            myLocationEnabled: true,
            tiltGesturesEnabled: true,
            compassEnabled: true,
            scrollGesturesEnabled: true,
            zoomGesturesEnabled: true,
            onMapCreated: _onMapCreated,
            markers: Set<Marker>.of(markers.values),
            polylines: Set<Polyline>.of(polylines.values),
          )),
    );
  }

  void _onMapCreated(GoogleMapController controller) async {
    mapController = controller;
  }

  _addMarker(LatLng position, String id, BitmapDescriptor descriptor) {
    MarkerId markerId = MarkerId(id);
    Marker marker =
    Marker(markerId: markerId, icon: descriptor, position: position);
    markers[markerId] = marker;
  }

  _addPolyLine() {
    PolylineId id = PolylineId("poly");
    Polyline polyline = Polyline(
        polylineId: id, color: Colors.red, points: polylineCoordinates);
    polylines[id] = polyline;
    setState(() {});
  }

  _getPolyline() async {
    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
        googleAPiKey,
        PointLatLng(_originLatitude, _originLongitude),
        PointLatLng(_destLatitude, _destLongitude),
        travelMode: TravelMode.driving,);
        //wayPoints: [PolylineWayPoint(location: "Sabo, Yaba Lagos Nigeria")]);
    if (result.points.isNotEmpty) {
      result.points.forEach((PointLatLng point) {
        polylineCoordinates.add(LatLng(point.latitude, point.longitude));
      });
    }
    _addPolyLine();
  }

  /*_fillmarkers(){
    agences.map((e) => {
      _addMarker(LatLng(e.locationBranch.latitude, e.locationBranch.longitude), e.bank_id,
          BitmapDescriptor.defaultMarkerWithHue(90))
    });
  }
  Future<void> readJson() async {
    final String response = await rootBundle.loadString('assets/agence.json');
    final data = await json.decode(response);
    setState(() {
      agences = (data["items"] as List<dynamic>)
          .map((e) => Agence.fromJson(e))
          .toList();
    });
  }*/
}
*/