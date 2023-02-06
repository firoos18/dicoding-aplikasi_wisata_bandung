import 'package:flutter/material.dart';
import 'package:wisata_bandung/components/favourite_button.dart';
import 'package:wisata_bandung/pages/mobile_detail_screen.dart';
import 'package:wisata_bandung/pages/web_detail_screen.dart';

class DetailScreen extends StatelessWidget {
  final dynamic place;
  const DetailScreen({Key? key, required this.place}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        if (constraints.maxWidth > 800) {
          return WebDetailScreen(
            place: place,
          );
        } else {
          return MobileDetailScreen(
            place: place,
          );
        }
      },
    );
  }
}
