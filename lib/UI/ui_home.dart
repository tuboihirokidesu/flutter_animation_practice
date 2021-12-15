import 'package:flutter/material.dart';

import 'package:flutter_animation/UI/carousel/carousel.dart';
import 'package:flutter_animation/components/card_button.dart';

class UiFlutter extends StatefulWidget {
  UiFlutter({Key? key}) : super(key: key);

  @override
  _UiFlutterState createState() => _UiFlutterState();
}

class _UiFlutterState extends State<UiFlutter> {
  onCardTap(Widget page) {
    Navigator.push(context, MaterialPageRoute(builder: (_) => page));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('UI in flutter')),
        body: ListView(
          padding: const EdgeInsets.all(15),
          children: [
            CardButton(
              title: 'Carousel',
              actionTap: () {
                onCardTap(const Carousel());
              },
              url: 'assets/person_search/machu_picchu.png',
            ),
            CardButton(
              title: 'Carousel',
              description: 'Search for records in reniec',
              actionTap: () {
                onCardTap(const Carousel());
              },
              url: 'assets/person_search/machu_picchu.png',
            ),
          ],
        ));
  }
}
