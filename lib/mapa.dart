import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:phpandroid/puntocovid.dart';

final Set<Marker> _markers = Set();
class MapSample extends StatefulWidget {
  double lat,alt;
  String id;
  MapSample(this.lat,this.alt,this.id);
  @override
  State<MapSample> createState() => MapSampleState();
}

class MapSampleState extends State<MapSample> {
  Completer<GoogleMapController> _controller = Completer();

  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(-11.9416543,-77.0720156),
    zoom: 11,
  );




  @override
  Widget build(BuildContext context) {
    _markers.add(
      Marker(
        markerId: MarkerId('Marcador'),
        position: LatLng(widget.lat, widget.alt),

      ),
    );
    return new Scaffold(
      appBar: AppBar(
      actions: <Widget>[
        IconButton(icon: Icon(Icons.arrow_back),
            onPressed: (){
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (BuildContext context) => ListarPC(widget.id)));
            })
      ],
      title: Text('Estadistica'),

    ),
      body: GoogleMap(

        myLocationEnabled: true,
        initialCameraPosition: _kGooglePlex,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
        markers: {Marker(
          markerId: MarkerId('GAAAA'),
          position: LatLng(widget.lat, widget.alt),
        ),},

      ),

    );
  }


}