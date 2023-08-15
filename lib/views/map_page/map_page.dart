// import 'package:flutter/material.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:provider/provider.dart';
// import 'package:traveling_app_flutter/utils/app_colors.dart';
// import 'package:traveling_app_flutter/utils/media_query.dart';
// import 'package:traveling_app_flutter/views/map_page/customcard_widget.dart';
// import 'package:traveling_app_flutter/widgets/custom_icon_button.dart';
// import 'package:traveling_app_flutter/widgets/custom_sized_box.dart';
// import 'package:traveling_app_flutter/widgets/custom_text.dart';

// import '../../providers/locations_provider.dart';
// import '../front_page/front_page_widgets/searchbar_icon.dart';
// import '../front_page/front_page_widgets/searchbar_widget.dart';

// class MapScreen extends StatefulWidget {
//   @override
//   _MapScreenState createState() => _MapScreenState();
// }

// class _MapScreenState extends State<MapScreen> {
//   GoogleMapController? _controller;
//   late LatLng _initialCameraPosition = const LatLng(37.7749, -122.4194);

//   @override
//   void initState() {
//     super.initState();
//     // Use a short delay to ensure the initial build is complete
//     Future.delayed(const Duration(milliseconds: 10), () {
//       final locationsProvider =
//           Provider.of<LocationsProvider>(context, listen: false);
//       locationsProvider.createArray();
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     LocationsProvider provider = context.watch<LocationsProvider>();

//     return Scaffold(
//       body: GestureDetector(
//         onTap: () {
//           FocusScope.of(context).unfocus();
//         },
//         child: Stack(
//           children: [
//             GoogleMap(
//               initialCameraPosition: CameraPosition(
//                 target: _initialCameraPosition,
//                 zoom: 14,
//               ),
//               onMapCreated: (controller) {
//                 _controller = controller;
//               },
//             ),
//             Positioned(
//               top: GetScreenSize.getScreenWidth(context) * 0.07,
//               child: Row(
//                 children: [
//                   CustomSizedBox(
//                     width: GetScreenSize.getScreenWidth(context) * 0.05,
//                   ),
//                   CircleAvatar(
//                     radius: GetScreenSize.getScreenWidth(context) * 0.059,
//                     backgroundColor: AppColors.talhawhite,
//                     child: CustomIconButton(
//                       iconData: Icons.arrow_back,
//                       onTab: () {
//                         Navigator.pop(context);
//                       },
//                       size: GetScreenSize.getScreenWidth(context) * 0.075,
//                       color: AppColors.abubakarBlack,
//                     ),
//                   ),
//                   CustomSizedBox(
//                     width: GetScreenSize.getScreenWidth(context) * 0.05,
//                   ),
//                   MySearchBar(
//                     height: GetScreenSize.getScreenWidth(context) * 0.14,
//                     width1: GetScreenSize.getScreenWidth(context) * 0.55,
//                     fieldTextFont:
//                         GetScreenSize.getScreenWidth(context) * 0.045,
//                     searchIconSize:
//                         GetScreenSize.getScreenWidth(context) * 0.08,
//                     searchTextFont:
//                         GetScreenSize.getScreenWidth(context) * 0.045,
//                   ),
//                   CustomSizedBox(
//                     width: GetScreenSize.getScreenWidth(context) * 0.05,
//                   ),
//                   SearchBarBlueIcon(
//                     height: GetScreenSize.getScreenWidth(context) * 0.12,
//                     width: GetScreenSize.getScreenWidth(context) * 0.12,
//                     radius: GetScreenSize.getScreenHeight(context) * 0.5,
//                   ),
//                 ],
//               ),
//             ),
//             Positioned(
//               bottom: GetScreenSize.getScreenWidth(context) * 0.60,
//               left: GetScreenSize.getScreenWidth(context) * 0.09,
//               child: CustomText(
//                 text: 'Location targeting',
//                 color: AppColors.abubakarBlack,
//                 size: GetScreenSize.getScreenWidth(context) * 0.05,
//                 maxline: 5,
//                 fontWeight: FontWeight.w600,
//               ),
//             ),
//             Positioned(
//               bottom: GetScreenSize.getScreenWidth(context) * 0.05,
//               left: GetScreenSize.getScreenWidth(context) * 0.0,
//               child: SizedBox(
//                 height: GetScreenSize.getScreenWidth(context) * 0.5,
//                 width: MediaQuery.of(context).size.width,
//                 child: NotificationListener<OverscrollIndicatorNotification>(
//                   onNotification: (OverscrollIndicatorNotification overscroll) {
//                     overscroll.disallowIndicator();
//                     return true;
//                   },
//                   child: ListView.builder(
//                     scrollDirection: Axis.horizontal,
//                     physics: const ClampingScrollPhysics(),
//                     itemCount: provider.getLocations.length,
//                     itemBuilder: (BuildContext context, int index) {
//                       return CustomCard(user: provider.getLocations[index]);
//                     },
//                   ),
//                 ),
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'package:traveling_app_flutter/utils/app_colors.dart';
import 'package:traveling_app_flutter/utils/media_query.dart';

import 'package:traveling_app_flutter/widgets/custom_icon_button.dart';
import 'package:traveling_app_flutter/widgets/custom_sized_box.dart';
import 'package:traveling_app_flutter/widgets/custom_text.dart';

import '../../providers/locations_provider.dart';
import '../front_page/front_page_widgets/searchbar_icon.dart';
import '../front_page/front_page_widgets/searchbar_widget.dart';
import 'customcard_widget.dart';

class MapScreen extends StatefulWidget {
  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  //GoogleMapController? _controller;
  //late LatLng _initialCameraPosition = const LatLng(37.7749, -122.4194);

  @override
  void initState() {
    super.initState();
    // Use a short delay to ensure the initial build is complete
    Future.delayed(const Duration(milliseconds: 10), () {
      final locationsProvider =
          Provider.of<LocationsProvider>(context, listen: false);
      locationsProvider.createArray();
    });
    _marker.addAll(_list);
  }

  Completer<GoogleMapController> _controller = Completer();
  // ignore: prefer_const_declarations
  static final CameraPosition _kGoogleFlex =
      const CameraPosition(target: LatLng(37.42, -122.08), zoom: 14);

  List<Marker> _marker = [];
  final List<Marker> _list = [
    Marker(
      markerId: const MarkerId('1'),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueAzure),
      position: const LatLng(37.42, -122.08),
      infoWindow: const InfoWindow(title: 'My Current Location'),
    ),
    const Marker(
      markerId: MarkerId('2'),
      position: LatLng(37.42, -121.08),
      infoWindow: InfoWindow(title: 'My Home Location'),
    ),
  ];
  @override
  Widget build(BuildContext context) {
    LocationsProvider provider = context.watch<LocationsProvider>();

    return Scaffold(
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Stack(
          children: [
            GoogleMap(
              initialCameraPosition: _kGoogleFlex,
              mapType: MapType.normal,
              myLocationEnabled: true,
              markers: Set<Marker>.of(_marker),
              onMapCreated: (GoogleMapController controller) {
                _controller.complete(controller);
              },
            ),
            // GoogleMap(
            //   initialCameraPosition: CameraPosition(
            //     target: _initialCameraPosition,
            //     zoom: 14,
            //   ),
            //   onMapCreated: (controller) {
            //     _controller = controller;
            //   },
            // ),
            Positioned(
              top: GetScreenSize.getScreenWidth(context) * 0.07,
              child: Row(
                children: [
                  CustomSizedBox(
                    width: GetScreenSize.getScreenWidth(context) * 0.05,
                  ),
                  CircleAvatar(
                    radius: GetScreenSize.getScreenWidth(context) * 0.059,
                    backgroundColor: AppColors.talhawhite,
                    child: CustomIconButton(
                      iconData: Icons.arrow_back,
                      onTab: () {
                        Navigator.pop(context);
                      },
                      size: GetScreenSize.getScreenWidth(context) * 0.075,
                      color: AppColors.abubakarBlack,
                    ),
                  ),
                  CustomSizedBox(
                    width: GetScreenSize.getScreenWidth(context) * 0.05,
                  ),
                  MySearchBar(
                    height: GetScreenSize.getScreenWidth(context) * 0.14,
                    width1: GetScreenSize.getScreenWidth(context) * 0.55,
                    fieldTextFont:
                        GetScreenSize.getScreenWidth(context) * 0.045,
                    searchIconSize:
                        GetScreenSize.getScreenWidth(context) * 0.08,
                    searchTextFont:
                        GetScreenSize.getScreenWidth(context) * 0.045,
                  ),
                  CustomSizedBox(
                    width: GetScreenSize.getScreenWidth(context) * 0.05,
                  ),
                  SearchBarBlueIcon(
                    height: GetScreenSize.getScreenWidth(context) * 0.12,
                    width: GetScreenSize.getScreenWidth(context) * 0.12,
                    radius: GetScreenSize.getScreenHeight(context) * 0.5,
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: GetScreenSize.getScreenWidth(context) * 0.60,
              left: GetScreenSize.getScreenWidth(context) * 0.09,
              child: CustomText(
                text: 'Location targeting',
                color: AppColors.abubakarBlack,
                size: GetScreenSize.getScreenWidth(context) * 0.05,
                maxline: 5,
                fontWeight: FontWeight.w600,
              ),
            ),
            Positioned(
              bottom: GetScreenSize.getScreenWidth(context) * 0.05,
              left: GetScreenSize.getScreenWidth(context) * 0.0,
              child: SizedBox(
                height: GetScreenSize.getScreenWidth(context) * 0.5,
                width: MediaQuery.of(context).size.width,
                child: NotificationListener<OverscrollIndicatorNotification>(
                  onNotification: (OverscrollIndicatorNotification overscroll) {
                    overscroll.disallowIndicator();
                    return true;
                  },
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    physics: const ClampingScrollPhysics(),
                    itemCount: provider.getLocations.length,
                    itemBuilder: (BuildContext context, int index) {
                      return CustomCard(user: provider.getLocations[index]);
                    },
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
