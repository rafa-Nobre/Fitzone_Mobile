import 'package:fitzone_app/common/widgets/notification_button.dart';
import 'package:fitzone_app/common/widgets/profile_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';

class MapPage extends StatefulWidget {
  const MapPage({super.key});

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  late GoogleMapController _mapController;
  LatLng? _currentLocation;

  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
  }

  Future<void> _getCurrentLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      await Geolocator.openLocationSettings();
      return;
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return;
    }

    Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.medium,
    );

    setState(() {
      _currentLocation = LatLng(position.latitude, position.longitude);
    });
  }

  @override
  Widget build(BuildContext context) {
    var _color = Theme.of(context).colorScheme;

    

void _showBottomSheet(String title, LatLng gymLocation, String endereco) async {
     
      double distanceInMeters = await Geolocator.distanceBetween(
        _currentLocation!.latitude,
        _currentLocation!.longitude,
        gymLocation.latitude,
        gymLocation.longitude,
      );

      double distanceInKm = distanceInMeters / 1000;

      showModalBottomSheet(
        context: context,
        backgroundColor: _color.tertiary, 
        builder: (BuildContext context) {
          return Container(
            height: 300,
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment:
                  CrossAxisAlignment.center, 
              children: [
                Text(
                  title,
                  style: Theme.of(context).textTheme.headlineSmall,
                  textAlign: TextAlign.center, 
                ),
                const SizedBox(height: 10),
                Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(10),
                      width: double.infinity,
                      decoration: ShapeDecoration(
                        color: _color.surfaceContainer,
                        shape: RoundedRectangleBorder(
                          side: BorderSide(color: _color.surfaceContainerLow),
                          borderRadius: BorderRadius.circular(18),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment
                            .center, 
                        children: [
                          Icon(
                             Icons.location_on, 
                            color: _color.primary,
                          ),
                          const SizedBox(width: 10),
                          Text(endereco),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment:
                          MainAxisAlignment.spaceAround, 
                      children: [
                        Container(
                          height: 100,
                          width: 170,
                          decoration: ShapeDecoration(
                            color: _color.surfaceContainer,
                            shape: RoundedRectangleBorder(
                              side:
                                  BorderSide(color: _color.surfaceContainerLow),
                              borderRadius: BorderRadius.circular(18),
                            ),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.access_time, // Ícone de horário
                                color: _color.primary,
                              ),
                              const SizedBox(height: 10),
                              Text('Seg-Sex: 6h - 22h'),
                            ],
                          ),
                        ),
                        const SizedBox(width: 10),
                        Container(
                          height: 100,
                          width: 170,
                          decoration: ShapeDecoration(
                            color: _color.surfaceContainer,
                            shape: RoundedRectangleBorder(
                              side:
                                  BorderSide(color: _color.surfaceContainerLow),
                              borderRadius: BorderRadius.circular(18),
                            ),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.location_on, // Ícone de localização
                                color: _color.primary,
                              ),
                              const SizedBox(height: 10),
                              Text('Há ${distanceInKm.toStringAsFixed(2)}km de você'),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      );
    }



    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: _color.tertiary,
        backgroundColor: _color.tertiary,
        actions: const [
          NotificationButton(),
          SizedBox(width: 10),
          ProfileWidget(),
          SizedBox(width: 10),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Container(
              decoration: ShapeDecoration(
                color: _color.surfaceContainer,
                shape: RoundedRectangleBorder(
                  side: BorderSide(color: _color.surfaceContainerLow),
                  borderRadius: BorderRadius.circular(18),
                ),
              ),
              child: _currentLocation == null
                  ? const Center(child: CircularProgressIndicator())
                  : GoogleMap(
                      initialCameraPosition: CameraPosition(
                        target: _currentLocation!,
                        zoom: 9,
                      ),
                      mapType: MapType.normal,
                      onMapCreated: (GoogleMapController controller) {
                        _mapController = controller;
                      },
                      markers: {
                        Marker(
                          markerId: const MarkerId("currentLocation"),
                          position: _currentLocation!,
                        
                          infoWindow: const InfoWindow(title: "Você está aqui"),
                        ),
                         Marker(
                          markerId: MarkerId("FitZone 0"),
                          position: LatLng(-5.7405492,-35.3199127),
                            icon: BitmapDescriptor.defaultMarkerWithHue(
                              BitmapDescriptor.hueGreen),
                          infoWindow: InfoWindow(title: "Você está aqui"),
                          
                        ),
                         Marker(
                          markerId: MarkerId("FitZone 01"),
                          position: LatLng(-5.7538597, -35.2588014),
                            icon: BitmapDescriptor.defaultMarkerWithHue(
                              BitmapDescriptor.hueGreen),
                          infoWindow: InfoWindow(title: "FitZone 01"),
                           onTap: () => _showBottomSheet("FitZone 01",  LatLng(-5.7538597, -35.2588014),"Av. Florianópolis, 744-770 - Potengi, Natal - RN, 59110-000"),
                        ),
                         Marker(
                          markerId: MarkerId("FitZone 02"),
                          position: LatLng(-5.7405374, -35.3199129),
                            icon: BitmapDescriptor.defaultMarkerWithHue(
                              BitmapDescriptor.hueGreen),
                          infoWindow: InfoWindow(title: "FitZone 02"),
                           onTap: () => _showBottomSheet("FitZone 02", LatLng(-5.7405374, -35.3199129), "São Gonçalo do Amarante, Rio Grande do Norte"),
                        ),
                         Marker(
                          markerId: MarkerId("FitZone 03"),
                          position: LatLng(-5.92136, -35.3329628),
                            icon: BitmapDescriptor.defaultMarkerWithHue(
                              BitmapDescriptor.hueGreen),
                          infoWindow: InfoWindow(title: "FitZone 03"),
                           onTap: () => _showBottomSheet("FitZone 03", LatLng(-5.92136, -35.3329628),  "Macaíba, Rio Grande do Norte"),
                        ),
                         Marker(
                          markerId: MarkerId("FitZone 04"),
                          position: LatLng(37.289094, -121.917447),
                            icon: BitmapDescriptor.defaultMarkerWithHue(
                              BitmapDescriptor.hueGreen),
                          infoWindow: InfoWindow(title: "FitZone 04"),
                          onTap: () => _showBottomSheet("FitZone 04", LatLng(37.289094, -121.917447), "San José, Califórnia, EUA"),
                        ),
                         Marker(
                          markerId: MarkerId("FitZone 05"),
                          position: LatLng(37.343837, -121.821099),
                            icon: BitmapDescriptor.defaultMarkerWithHue(
                              BitmapDescriptor.hueGreen),
                          infoWindow: InfoWindow(title: "FitZone 05"),
                          onTap: () => _showBottomSheet("FitZone 05", LatLng(37.343837, -121.821099),"San José, Califórnia, EUA"),
                        ),
                         Marker(
                          markerId: MarkerId("FitZone 06"),
                          position: LatLng(37.275335, -121.849247),
                            icon: BitmapDescriptor.defaultMarkerWithHue(
                              BitmapDescriptor.hueGreen),
                          infoWindow: InfoWindow(title: "FitZone 06"),
                          onTap: () => _showBottomSheet("FitZone 06",  LatLng(37.275335, -121.849247),"San José, Califórnia, EUA"),
                        ),
                         Marker(
                          markerId: MarkerId("FitZone 07"),
                          position: LatLng(37.283836, -121.854950),
                            icon: BitmapDescriptor.defaultMarkerWithHue(
                              BitmapDescriptor.hueGreen),
                          infoWindow: InfoWindow(title: "FitZone 07"),
                          onTap: () => _showBottomSheet("FitZone 07",  LatLng(37.283836, -121.854950),
                              "San José, Califórnia, EUA"),
                        ),
                      },
                    ),
            ),
          ),
        ],
      ),
    );
  }
}
