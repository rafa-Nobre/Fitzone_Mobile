import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapPage extends StatefulWidget {
  const MapPage({super.key});

  @override
  State<MapPage> createState() => _MapPageState();

}

class _MapPageState extends State<MapPage> { 
static const LatLng _pGooglePlex = LatLng(37.32, -122.03);
  @override
  Widget build(BuildContext context) {
    var _color = Theme.of(context).colorScheme;
    return Container(
       decoration: ShapeDecoration(
        color: _color.surfaceContainer,
        shape: RoundedRectangleBorder(
          side: BorderSide(color: _color.surfaceContainerLow),
          borderRadius: BorderRadius.circular(18),
        ),
      ),
      child: GoogleMap(
        initialCameraPosition: CameraPosition(target: _pGooglePlex, zoom: 14),
        mapType: MapType.normal,
        onMapCreated: (GoogleMapController controller) {},
      ),
    );
  }
  
}