// import 'package:clientapp/controllers/profile-controller.dart';
//import 'package:church_app/src/model/rel-dizimisas-model.dart';
import 'package:church_app/src/util/launchApp.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
//import 'package:provider/provider.dart';

class ConfirmMapsPage extends StatefulWidget {
  ConfirmMapsPage({Key? key, @required this.longitude, @required this.latitude})
      : super(key: key);
  final String? longitude;
  final String? latitude;

  @override
  _MapsImovelState createState() => _MapsImovelState();
}

class _MapsImovelState extends State<ConfirmMapsPage> {
  GoogleMapController? mapController;
  Set<Marker> markers = new Set<Marker>();
  double _zoom = 17.2;
  // String cidadeSelected;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return _googlemap(context);
  }

  Widget _googlemap(BuildContext context) {
    return Container(
      height: 400,
      child: GoogleMap(
          zoomControlsEnabled: false,
          mapType: MapType.normal,
          onMapCreated: _onMapCreated,
          onTap: (value) {
            launchGoogleMaps(double.parse(widget.latitude!),
                double.parse(widget.longitude!));
          },
          initialCameraPosition: CameraPosition(
              target: LatLng(double.parse(widget.latitude!),
                  double.parse(widget.longitude!)),
              zoom: _zoom),
          markers: markers),
    );
  }

  //*********************************************************************\\
  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
    _addMaker(LatLng(
        double.parse(widget.latitude!), double.parse(widget.longitude!)));
  }

  void _addMaker(LatLng latLng) async {
    //List latLong = latLng.toJson();
    int countId = 0;
    countId++;
    markers.clear();

    final Marker marker = Marker(
      markerId: new MarkerId('store$countId'),
      position: latLng,
    );
    setState(() {
      markers.add(marker);
    });
  }
}
