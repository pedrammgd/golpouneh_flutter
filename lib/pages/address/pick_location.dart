import 'package:android_intent_plus/android_intent.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:gol_pouneh/shared/appbar.dart';
import 'package:gol_pouneh/shared/data_memory.dart';
import 'package:gol_pouneh/shared/loading.dart';
import 'package:latlong2/latlong.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map/plugin_api.dart';
import 'package:location/location.dart';

import '../../shared/toast.dart';

class PickLocation extends StatefulWidget {
  const PickLocation({Key? key}) : super(key: key);

  @override
  State<PickLocation> createState() => _PickLocationState();
}

class _PickLocationState extends State<PickLocation> {
  late MapController mapController;
  double lat = 0.0;
  double long = 0.0;
  LatLng? latLng;
  bool loadLoc = false;
  @override
  void initState() {
    super.initState();
    WidgetsFlutterBinding.ensureInitialized();
    mapController = MapController();
    getLocation();
  }

  @override
  void dispose() {
    mapController.dispose();
    super.dispose();
  }

  Future<void> getLocation() async {
    Location location = Location();

    bool serviceEnabled;
    PermissionStatus permissionGranted;

    serviceEnabled = await location.serviceEnabled();
    if (serviceEnabled == false) {
      //serviceEnabled = await location.requestService();
      const AndroidIntent intent = AndroidIntent(
        action: 'android.settings.LOCATION_SOURCE_SETTINGS',
      );
      await intent.launch();

      if (serviceEnabled == false) {
        toastMessage("سرویس مکان", "سرویس مکان غیر فعال است");
      }
    }

    permissionGranted = await location.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await location.requestPermission();
      if (permissionGranted != PermissionStatus.granted) {
        toastMessage("دسترسی مکان", "دسترسی مکان داده نشد");
      }
    }
    Position position = await Geolocator.getCurrentPosition();
    //locationData = await location.getLocation();
    if (position.latitude.toString() != "") {
      setState(() {
        lat = position.latitude;
        long = position.longitude;

        latLng = LatLng(lat, long);
        loadLoc = true;
      });
    }
  }

  void toastMessage(String title, String message) =>
      toastFail(title, message, context);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar("گرفتن موقعیت مکانی", Colors.green, [
        IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.close)),
        IconButton(
            onPressed: () {
              DataMemory.geoLocation = "$lat,$long";
              DataMemory.latitude = lat.toString();
              DataMemory.longitude = long.toString();

              Navigator.pop(context,
                  [latLng?.latitude ?? lat, latLng?.longitude ?? long]);
              toastSuccess("موقعیت مکانی",
                  "موقعیت مکانی شما با موفقیت گرفته شد", context);
            },
            icon: const Icon(Icons.verified_outlined)),
      ]),
      body: loadLoc
          ? FlutterMap(
              mapController: mapController,
              options: MapOptions(
                interactiveFlags: InteractiveFlag.all,
                center: latLng,
                zoom: 15,
                onMapReady: () {
                  setState(() {
                    latLng = mapController.center;
                  });
                },
                onPositionChanged: (MapPosition mapPosition, bool isTrue) {
                  // var _distanceInMeters = Geolocator.distanceBetween(
                  //   mapPosition.center!.latitude,
                  //   mapPosition.center!.longitude,
                  //   lat,
                  //   long,
                  // );
                  // print(lat);
                  // print(long);
                  // print(_distanceInMeters);
                  setState(() {
                    latLng = mapPosition.center!;
                  });
                },
              ),
              nonRotatedChildren: [
                AttributionWidget.defaultWidget(
                  source: 'OpenStreetMap contributors',
                  onSourceTapped: null,
                ),
              ],
              children: [
                TileLayer(
                  urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                  userAgentPackageName: 'ir.ably.gol_pouneh',
                ),
                MarkerLayer(
                  markers: [
                    Marker(
                      point: latLng!,
                      width: 95,
                      height: 95,
                      builder: (context) => const Icon(
                        Icons.place,
                        color: Colors.red,
                        size: 30,
                      ),
                    ),
                  ],
                ),
              ],
            )
          : Loading.circular(),
    );
  }
}
