import 'package:android_intent_plus/android_intent.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:gol_pouneh/shared/data_memory.dart';
import 'package:gol_pouneh/shared/toast.dart';
import 'package:location/location.dart';
import 'package:webview_flutter/webview_flutter.dart';

class LocationOnMAp extends StatefulWidget {
  const LocationOnMAp({Key? key}) : super(key: key);

  @override
  State<LocationOnMAp> createState() => _LocationOnMApState();
}

class _LocationOnMApState extends State<LocationOnMAp> with WidgetsBindingObserver {
  bool _isSuccess = false;
  List<String> loc = [];
  int progress = 0;
  bool pageStarted = false;

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      _getLocation();
    }
  }

  WebViewController? controller;

  @override
  void initState() {
    if (DataMemory.geoLocation == null) {
      _getLocation();
    } else {
      _isSuccess = true;
    }
    super.initState();
    //if (Platform.isAndroid) WebView.platform = AndroidWebView();
    WidgetsBinding.instance.addObserver(this);
  }

  Future<void> _getLocation() async {
    Location location = Location();

    bool serviceEnabled;
    PermissionStatus permissionGranted;
    //LocationData locationData;

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
        _isSuccess = true;
        loc.addAll([position.latitude.toString(), position.longitude.toString()]);
      });
    }
  }

  void toastMessage(String title, String message) => toastFail(title, message, context);

  @override
  Widget build(BuildContext context) {
    String geoLoc = "";
    if (_isSuccess && DataMemory.geoLocation == null) {
      geoLoc = "${loc[0]},${loc[1]}&z=12";
    } else if (DataMemory.geoLocation != null) {
      geoLoc = "${DataMemory.geoLocation!}&z=15";
    }


    return Scaffold(
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: _isSuccess
            ? Stack(
                children: [
                  WebViewWidget(
                    controller: WebViewController()
                      ..setJavaScriptMode(JavaScriptMode.unrestricted)
                      ..setBackgroundColor(const Color(0x00000000))
                      ..setNavigationDelegate(
                        NavigationDelegate(
                          onProgress: (int prog) {
                            // if(!pageStarted){
                            // setState(() {
                            //   progress = prog;
                            // });
                            // }
                          },
                          onPageStarted: (String url) {},
                          onPageFinished: (String url) {
                            if(!pageStarted){
                              pageStarted = true;
                              setState(() {
                            });
                            }
                          },
                          onWebResourceError: (WebResourceError error) {
                            Navigator.pop(context);
                          },
                          onNavigationRequest: (NavigationRequest request) {
                            if (request.url.startsWith('https://google.com/')) {
                              return NavigationDecision.prevent;
                            }
                            return NavigationDecision.navigate;
                          },
                        ),
                      )
                      ..loadRequest(
                        Uri.parse(
                            "https://www.google.com/maps/d/u/0/viewer?mid=1BS3he1yu-HJ_7dRP4FuT_MuxIBr62Cg&ll=$geoLoc"),
                      ),
                  ),
                  pageStarted
                      ? Container()
                      : Center(
                          child: Container(
                            padding: const EdgeInsets.all(20.0),
                            margin: const EdgeInsets.all(20.0),
                            height: 100,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(30.0),
                              boxShadow: const [
                                BoxShadow(
                                    color: Colors.grey,
                                    spreadRadius: 2.0,
                                    blurRadius: 5.0),
                              ],
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text("در حال بارگیری..."),
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(30.0),
                                  child: LinearProgressIndicator(
                                      backgroundColor: Colors.white,
                                      value: progress / 100,
                                      valueColor: const AlwaysStoppedAnimation<Color>(
                                        Colors.blue,
                                      ),
                                      minHeight: 10.0),
                                ),
                              ],
                            ),
                          ),
                        ),
                ],
              )
            : const Center(child: CircularProgressIndicator()),
      ),
    );
  }
}
