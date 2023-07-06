import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'ApiConfig/ApiConfig.dart';

class MapScreen extends StatefulWidget {
  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  GoogleMapController? mapController;
  List<Marker> markers = [];

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  void initState() {
    super.initState();

    getMarker();


    setState(() {});

    }

  getMarker() async
  {
    var data = await ApiConfig.getMarkers();

    BitmapDescriptor.fromAssetImage(
      ImageConfiguration(size: Size(48, 48)),  // Adjust the size to match your marker image
      'assets/images/tailoring.png',  // Replace with the actual path and filename of your marker image
    ).then((BitmapDescriptor descriptor) {
      // Create a marker using the custom image

      for(var d in data)
      {
        print(d['lat']+" : "+d['lang']);
        Marker marker = Marker(
          markerId: MarkerId(d['id']),
          position: LatLng(double.parse(d['lat']), double.parse(d['lang'])),
          icon: descriptor,
          infoWindow: InfoWindow(title: d['name']),
        );

        // Add the marker to the set of markers
        markers.add(marker);


      }

      setState(() {});


    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: Text('Nearest Tailors'),
      ),
      body: GoogleMap(
        onMapCreated: _onMapCreated,
        initialCameraPosition: CameraPosition(
          target: LatLng(34.035901830162324, 71.52909636285224), // Initial map center
          zoom: 10.0, // Initial zoom level
        ),
        markers: Set<Marker>.of(markers),
      ),
    );
  }
}