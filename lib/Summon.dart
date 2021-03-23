import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';


class Summon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      home: new SummonPage(),
    );
  }
}

class SummonPage extends StatefulWidget {
  @override
  SummonState createState() => SummonState();
}

class SummonState extends State<SummonPage> {
  Completer<GoogleMapController> _controller = Completer();

  static const LatLng _center = const LatLng(20.3548, 85.8153);

  void _onMapCreated(GoogleMapController controller) {
  _controller.complete(controller);
  }

  final Set<Marker> _markers = {};

  LatLng _lastMapPosition = _center;

  void _onCameraMove(CameraPosition position) {
    _lastMapPosition = position.target;
  }
  void _onAddMarkerButtonPressed() {
    setState(() {
      _markers.add(Marker(
        // This marker id can be anything that uniquely identifies each marker.
        markerId: MarkerId(_lastMapPosition.toString()),
        position: _lastMapPosition,
        infoWindow: InfoWindow(
          title: 'Swag Robot',
          snippet: 'Medical',
        ),
        icon: BitmapDescriptor.defaultMarker,
      ));
    });
  }
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        GoogleMap(
          onMapCreated: _onMapCreated,
          initialCameraPosition: CameraPosition(
            target: _center,
            zoom: 16.0,
          ),
          markers: _markers,
          onCameraMove: _onCameraMove,
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Align(
            alignment: Alignment.topRight,
            child: Column(
              children: <Widget> [
                SizedBox(height: 16.0),
                FloatingActionButton(
                  onPressed: _onAddMarkerButtonPressed,
                  materialTapTargetSize: MaterialTapTargetSize.padded,
                  backgroundColor: Colors.green,
                  child: const Icon(Icons.add_location, size: 36.0),
                ),
                SizedBox(height: 10.0,),
                FloatingActionButton(
                  onPressed: (){
                    final snackBar = SnackBar(content: Text('Summon!'));
                    Scaffold.of(context).showSnackBar(snackBar);
                  },
                  materialTapTargetSize: MaterialTapTargetSize.padded,
                  backgroundColor: Colors.lightBlueAccent,
                  child: const Icon(Icons.star_border, size: 36.0),
                ),
              ],
            ),
          ),
        ),
      ],
    );

  }
}
