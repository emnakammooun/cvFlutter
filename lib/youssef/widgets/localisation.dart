import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class Localisation extends StatefulWidget {
  const Localisation({Key? key}) : super(key: key);

  @override
  _LocalisationState createState() => _LocalisationState();
}

class _LocalisationState extends State<Localisation> {
  late GoogleMapController mapController;
  final LatLng _center = const LatLng(45.521563, -122.677433); // Initial map center
  final Set<Marker> _markers = {}; // Set to hold markers on the map

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
    // Add marker on map creation
    setState(() {
      _markers.add(
        Marker(
          markerId: MarkerId('home'),
          position: _center,
          infoWindow: InfoWindow(
            title: 'Home',
            snippet: 'Your Location',
          ),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Location'),
      ),
      body: Column(
        children: [
          Expanded(
            child: GoogleMap(
              onMapCreated: _onMapCreated,
              initialCameraPosition: CameraPosition(
                target: _center,
                zoom: 11.0,
              ),
              markers: _markers,
            ),
          ),
          InfoCard(
            text: 'Location',
            value: 'Example Address',
            address: 'Sakiet Eddaier',
          ),
        ],
      ),
    );
  }
}

class InfoCard extends StatelessWidget {
  final String text;
  final String value;
  final String address; // Added address field

  const InfoCard({
    required this.text,
    required this.value,
    required this.address,
    Key? key,
  }) : super(key: key); 

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _launchMapsURL(address), // Call _launchMapsURL with address when tapped
      child: Card(
        child: ListTile(
          title: Text(text),
          subtitle: Text(value),
        ),
      ),
    );
  }
}

void _launchMapsURL(String address) async {
  final url = 'https://www.google.com/maps/search/?api=1&query=${Uri.encodeFull(address)}';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

