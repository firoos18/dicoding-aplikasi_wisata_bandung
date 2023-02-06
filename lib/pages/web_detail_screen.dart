import 'package:flutter/material.dart';
import 'package:wisata_bandung/components/favourite_button.dart';

class WebDetailScreen extends StatefulWidget {
  final dynamic place;
  const WebDetailScreen({super.key, this.place});

  @override
  State<WebDetailScreen> createState() => _WebDetailScreenState();
}

class _WebDetailScreenState extends State<WebDetailScreen> {
  final _scrollController = ScrollController();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var informationText = const TextStyle(fontFamily: 'Oxygen');

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 64),
        child: Center(
          child: SizedBox(
            width: 1200,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Wisata Bandung',
                  style: TextStyle(
                    fontFamily: 'Staatliches',
                    fontSize: 32,
                  ),
                ),
                const SizedBox(
                  height: 32,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.asset(widget.place.imageAsset),
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          Container(
                            height: 150,
                            padding: const EdgeInsets.only(bottom: 16),
                            child: Scrollbar(
                              controller: _scrollController,
                              child: Container(
                                height: 150,
                                padding: const EdgeInsets.only(bottom: 16),
                                child: ListView(
                                  controller: _scrollController,
                                  scrollDirection: Axis.horizontal,
                                  children:
                                      widget.place.imageUrls.map<Widget>((url) {
                                    return Padding(
                                      padding: const EdgeInsets.all(4),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(10),
                                        child: Image.network(url),
                                      ),
                                    );
                                  }).toList(),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      width: 32,
                    ),
                    Expanded(
                        child: Card(
                      child: Container(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Container(
                              child: Text(
                                widget.place.name,
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  fontSize: 30,
                                  fontFamily: 'Staatliches',
                                ),
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    const Icon(Icons.calendar_today),
                                    const SizedBox(
                                      width: 8,
                                    ),
                                    Text(
                                      widget.place.openDays,
                                      style: informationText,
                                    ),
                                  ],
                                ),
                                const FavouriteButton(),
                              ],
                            ),
                            Row(
                              children: [
                                const Icon(Icons.access_time),
                                const SizedBox(
                                  width: 8,
                                ),
                                Text(
                                  widget.place.openTime,
                                  style: informationText,
                                )
                              ],
                            ),
                            Row(
                              children: [
                                const Icon(Icons.monetization_on),
                                const SizedBox(
                                  width: 8,
                                ),
                                Text(
                                  widget.place.ticketPrice,
                                  style: informationText,
                                )
                              ],
                            ),
                            Container(
                              padding: const EdgeInsets.symmetric(vertical: 16),
                              child: Text(
                                widget.place.description,
                                textAlign: TextAlign.justify,
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontFamily: 'Oxygen',
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ))
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
