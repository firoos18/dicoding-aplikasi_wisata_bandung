import 'package:flutter/material.dart';
import 'package:wisata_bandung/components/favourite_button.dart';

class MobileDetailScreen extends StatelessWidget {
  final dynamic place;
  const MobileDetailScreen({super.key, this.place});

  @override
  Widget build(BuildContext context) {
    var informationText = const TextStyle(fontFamily: 'Oxygen');
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Stack(
                children: [
                  Image.asset(place.imageAsset),
                  SafeArea(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CircleAvatar(
                            backgroundColor: Colors.grey,
                            child: IconButton(
                              onPressed: () => Navigator.pop(context),
                              icon: const Icon(
                                Icons.arrow_back,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          const FavouriteButton(),
                        ],
                      ),
                    ),
                  )
                ],
              ),
              Container(
                margin: const EdgeInsets.only(top: 16),
                child: Text(
                  place.name,
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
                          place.openDays,
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
                          place.openTime,
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
                          place.ticketPrice,
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
                  place.description,
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 16),
                ),
              ),
              SizedBox(
                height: 150,
                child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: place.imageUrls.map<Widget>((url) {
                      return Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.network(url),
                        ),
                      );
                    }).toList()),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
