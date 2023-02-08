import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wisata_bandung/components/favourite_button.dart';

class MobileDetailScreen extends StatefulWidget {
  final dynamic place;
  const MobileDetailScreen({super.key, this.place});

  @override
  State<MobileDetailScreen> createState() => _MobileDetailScreenState();
}

class _MobileDetailScreenState extends State<MobileDetailScreen> {
  @override
  Widget build(BuildContext context) {
    var informationText = GoogleFonts.oxygen();

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.all(8),
                child: Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.asset(widget.place.imageAsset),
                    ),
                    SafeArea(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              onTap: () => Navigator.pop(context),
                              child: Container(
                                width: 50,
                                height: 50,
                                decoration: BoxDecoration(
                                  color: Colors.white.withOpacity(0.4),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: const Icon(
                                  Icons.arrow_back,
                                  color: Colors.black87,
                                ),
                              ),
                            ),
                            Container(
                              width: 50,
                              height: 50,
                              decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.4),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: const FavouriteButton(),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 15,
                      left: 15,
                      child: Row(
                        children: [
                          const Icon(
                            Icons.location_on,
                            color: Colors.redAccent,
                          ),
                          Text(
                            widget.place.location,
                            style: GoogleFonts.staatliches(
                              fontSize: 24,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      bottom: 15,
                      right: 15,
                      child: Row(
                        children: [
                          const Icon(
                            Icons.star_rate_sharp,
                            color: Colors.yellowAccent,
                          ),
                          Text(
                            widget.place.ratings,
                            style: GoogleFonts.staatliches(
                              fontSize: 24,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 16),
                child: Text(
                  widget.place.name,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Staatliches',
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        const Icon(Icons.calendar_today),
                        const SizedBox(
                          height: 8,
                        ),
                        Text(
                          widget.place.openDays,
                          style: informationText,
                        )
                      ],
                    ),
                    Column(
                      children: [
                        const Icon(Icons.access_time),
                        const SizedBox(
                          height: 8,
                        ),
                        Text(
                          widget.place.openTime,
                          style: informationText,
                        )
                      ],
                    ),
                    Column(
                      children: [
                        const Icon(Icons.monetization_on),
                        const SizedBox(
                          height: 8,
                        ),
                        Text(
                          widget.place.ticketPrice,
                          style: informationText,
                        )
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.all(16),
                child: Text(
                  widget.place.description,
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 16),
                ),
              ),
              SizedBox(
                height: 150,
                child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: widget.place.imageUrls.map<Widget>((url) {
                      return Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.network(url),
                        ),
                      );
                    }).toList()),
              ),
              const SizedBox(
                height: 32,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 8,
                ),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      fixedSize: Size(MediaQuery.of(context).size.width, 50),
                      backgroundColor: const Color(0xff33658A)),
                  onPressed: () => showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Center(
                            child: Text(
                              'Pesan Tiket',
                              style: GoogleFonts.oxygen(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          content: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Row(
                                children: [
                                  const Expanded(
                                      flex: 4,
                                      child: SizedBox(
                                        height: 50,
                                        child: TextField(
                                          keyboardType: TextInputType.number,
                                          decoration: InputDecoration(
                                            border: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                width: 1,
                                              ),
                                            ),
                                          ),
                                        ),
                                      )),
                                  Expanded(
                                    flex: 1,
                                    child: MaterialButton(
                                      onPressed: () {},
                                      child: const Icon(
                                        Icons.add,
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 1,
                                    child: MaterialButton(
                                      onPressed: () {},
                                      child: const Icon(Icons.remove),
                                    ),
                                  )
                                ],
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              Row(
                                children: [
                                  Text(
                                    'Total',
                                    style: GoogleFonts.oxygen(fontSize: 18),
                                  ),
                                  Text(
                                    '',
                                    style: GoogleFonts.oxygen(fontSize: 18),
                                  ),
                                ],
                              )
                            ],
                          ),
                          actions: [
                            MaterialButton(
                              onPressed: () => Navigator.pop(context),
                              child: Text(
                                'Setuju',
                                style: GoogleFonts.oxygen(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            MaterialButton(
                              onPressed: () => Navigator.pop(context),
                              child: Text(
                                'Batal',
                                style: GoogleFonts.oxygen(
                                  color: Colors.redAccent,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        );
                      }),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.book,
                        color: Colors.white,
                      ),
                      Text(
                        'Pesan Tiket',
                        style: GoogleFonts.oxygen(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
