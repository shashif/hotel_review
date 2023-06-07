import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';



class LocationScreen extends StatefulWidget {
  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  GoogleMapController? _mapController;
  Marker? _selectedMarker;

  void _onMapCreated(GoogleMapController controller) {
    _mapController = controller;
  }

  void _selectLocation(LatLng position) {
    setState(() {
      _selectedMarker = Marker(
        markerId: MarkerId('user_location'),
        position: position,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    Set<Marker> markers = _selectedMarker != null
        ? Set<Marker>.from([_selectedMarker!])
        : Set<Marker>(); // Provide an empty set when _selectedMarker is null

    return Scaffold(
      appBar: AppBar(
        title: Text('Select Location'),
      ),
      body: GoogleMap(
        onMapCreated: _onMapCreated,
        initialCameraPosition: CameraPosition(
          target: LatLng(37.7749, -122.4194), // Initial map position (San Francisco, CA)
          zoom: 12.0,
        ),
        markers: markers,
        onTap: _selectLocation,
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: LocationScreen(),
  ));
}








