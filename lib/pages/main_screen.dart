import 'package:flutter/material.dart';
import 'package:wisata_bandung/components/tourism_place_grid.dart';
import 'package:wisata_bandung/components/tourism_place_list.dart';
import 'package:wisata_bandung/pages/detail_screen.dart';
import 'package:wisata_bandung/models/tourism_place.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
          if (constraints.maxWidth <= 600) {
            return const TourismPlaceList();
          } else if (constraints.maxWidth <= 1200) {
            return const TourismPlaceGrid(gridCount: 4);
          } else {
            return const TourismPlaceGrid(gridCount: 6);
          }
        }));
  }
}
