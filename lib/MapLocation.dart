import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'ApiConfig/ApiConfig.dart';
import 'model/Tailor.dart';

class MapLocation extends StatefulWidget {
  Tailor t;
  MapLocation(this.t);
  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapLocation> {
  GoogleMapController? mapController;
  List<Marker> markers = [];

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  void initState() {
    super.initState();

    BitmapDescriptor.fromAssetImage(
      ImageConfiguration(size: Size(48, 48)),  // Adjust the size to match your marker image
      'assets/images/tailoring.png',  // Replace with the actual path and filename of your marker image
    ).then((BitmapDescriptor descriptor) {
      // Create a marker using the custom image


      Marker marker = Marker(
        markerId: MarkerId(widget.t.id),
        position: LatLng(double.parse(widget.t.lat), double.parse(widget.t.lang)),
        icon: descriptor,
        infoWindow: InfoWindow(title: widget.t.name),
      );

      // Add the marker to the set of markers
      markers.add(marker);



      setState(() {});


    });


    setState(() {});

  }

  getMarker() async
  {
   
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: Text(widget.t.name),
      ),
      body: GoogleMap(
        onMapCreated: _onMapCreated,
        initialCameraPosition: CameraPosition(
          target: LatLng(double.parse(widget.t.lat), double.parse(widget.t.lang)), // Initial map center
          zoom: 10.0, // Initial zoom level
        ),
        markers: Set<Marker>.of(markers),
      ),
    );
  }
}