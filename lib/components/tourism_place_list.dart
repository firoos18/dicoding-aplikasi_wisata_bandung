import 'package:flutter/material.dart';
import 'package:wisata_bandung/Models/tourism_place.dart';
import 'package:wisata_bandung/models/tourism_place.dart' as tourismPlace;
import 'package:wisata_bandung/pages/detail_screen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TourismPlaceList extends StatelessWidget {
  const TourismPlaceList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 32, right: 4, left: 4),
          child: Container(
            width: MediaQuery.of(context).size.width,
            margin: const EdgeInsets.symmetric(vertical: 24),
            height: 150,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.grey.shade400, width: 1),
                color: const Color(0xff2F4858)),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 12,
                horizontal: 8,
              ),
              child: Row(
                children: [
                  Expanded(
                      flex: 3,
                      child: SvgPicture.asset(
                        'lib/assets/illustration/trip.svg',
                      )),
                  Expanded(
                    flex: 2,
                    child: Text(
                      'Ayo cari tempat liburanmu selanjutnya!',
                      style: GoogleFonts.oxygen(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 4),
          child: Row(
            children: [
              const Icon(
                Icons.star,
                size: 28,
                color: Colors.redAccent,
              ),
              Text(
                'Wisata Populer',
                style: GoogleFonts.oxygen(
                  fontSize: 24,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
        Expanded(
            flex: 1,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: popularTourismPlaceList.length,
                itemBuilder: (context, index) {
                  final TourismPlace place = popularTourismPlaceList[index];
                  return GestureDetector(
                    onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DetailScreen(
                                  place: place,
                                ))),
                    child: Stack(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child: Image.asset(place.imageAsset),
                          ),
                        ),
                        Positioned(
                          bottom: 20,
                          left: 12,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                place.name,
                                style: GoogleFonts.oxygen(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  const Icon(
                                    Icons.location_on,
                                    size: 12,
                                    color: Colors.redAccent,
                                  ),
                                  Text(
                                    place.location,
                                    style: GoogleFonts.oxygen(
                                      fontSize: 12,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                })),
        Padding(
          padding: const EdgeInsets.only(left: 4),
          child: Row(
            children: [
              const Icon(
                Icons.location_on,
                color: Colors.redAccent,
                size: 28,
              ),
              Text(
                'Wisata di Sekitar Kamu',
                style: GoogleFonts.oxygen(
                  fontSize: 24,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
        Expanded(
          flex: 3,
          child: ListView.builder(
            itemCount: tourismPlaceList.length,
            itemBuilder: (context, index) {
              final TourismPlace place = tourismPlaceList[index];
              return InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return DetailScreen(place: place);
                  }));
                },
                child: Card(
                  color: Colors.grey.shade200,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        flex: 1,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.asset(place.imageAsset),
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Padding(
                          padding: const EdgeInsets.all(8),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                place.name,
                                style: GoogleFonts.oxygen(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: const Color(0xff000100),
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Row(
                                children: [
                                  const Icon(
                                    Icons.location_on,
                                    size: 12,
                                    color: Colors.redAccent,
                                  ),
                                  Text(
                                    place.location,
                                    style: GoogleFonts.oxygen(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                      color: const Color(0xff000100),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(
                          right: 8,
                        ),
                        child: Icon(
                          Icons.chevron_right,
                          color: Color(0xff000100),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
