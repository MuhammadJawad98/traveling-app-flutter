// ignore_for_file: prefer_const_declarations, prefer_final_fields, library_private_types_in_public_api, use_key_in_widget_constructors

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'package:traveling_app_flutter/providers/day_task_providers/map_page_provider.dart';
import 'package:traveling_app_flutter/utils/app_colors.dart';
import 'package:traveling_app_flutter/utils/media_query.dart';
import 'package:traveling_app_flutter/views/itinerary_page/itinerary_screen_widget.dart';
import 'package:traveling_app_flutter/views/map_page/customcard_widget.dart';
import 'package:traveling_app_flutter/widgets/custom_icon_button.dart';
import 'package:traveling_app_flutter/widgets/custom_sized_box.dart';
import 'package:traveling_app_flutter/widgets/custom_text.dart';

import '../../providers/locations_provider.dart';
import '../front_page/front_page_widgets/searchbar_icon.dart';
import '../front_page/front_page_widgets/searchbar_widget.dart';

class MapScreen extends StatefulWidget {
  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 10), () {
      final locationsProvider =
          Provider.of<LocationsProvider>(context, listen: false);
      locationsProvider.createArray();
    });
    final markersProvider =
        Provider.of<MapPageProvider>(context, listen: false);
    markersProvider.addMarkers();
  }

  Completer<GoogleMapController> _controller = Completer();

  static final CameraPosition _kGoogleFlex =
      const CameraPosition(target: LatLng(37.42, -122.08), zoom: 14);

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
              markers:
                  Set<Marker>.of(context.watch<MapPageProvider>().markersList),
              onMapCreated: (GoogleMapController controller) {
                _controller.complete(controller);
              },
            ),
            Positioned(
              top: GetScreenSize.getScreenWidth(context) * 0.13,
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
                  GestureDetector(
                    onTap: () async {
                      context.read<MapPageProvider>().addMarkers1(_controller);
                    },
                    child: SearchBarBlueIcon(
                      height: GetScreenSize.getScreenWidth(context) * 0.12,
                      width: GetScreenSize.getScreenWidth(context) * 0.12,
                      radius: GetScreenSize.getScreenHeight(context) * 0.5,
                    ),
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
              bottom: GetScreenSize.getScreenWidth(context) * 0.08,
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
                      return GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        ItineraryScreenWidget()));
                          },
                          child:
                              CustomCard(user: provider.getLocations[index]));
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
