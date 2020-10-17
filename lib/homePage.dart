import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:isetechclub/widgets/carousel.dart';

// ignore: must_be_immutable
class HomePage extends StatelessWidget {
  List images = ['images/events.png', 'images/notes.png', 'images/results.png'];
  List detailImage = [
    'Know about the latest events!',
    'Get online notes!',
    'Get updates of VTU Results.'
  ];
  @override
  Widget build(BuildContext context) {
    final List<Widget> imageSliders = images.map((item) =>
        CarouselMaker(item: item, detailImage: detailImage, images: images))
        .toList();
    return Column(
      children: [
        Expanded(flex: 2, child: Image.asset('images/iseLogo.gif')),
        Expanded(
          flex: 1,
          child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
              ),
              child: CarouselSlider(
                options: CarouselOptions(
                  aspectRatio: 2.0,
                  enlargeCenterPage: true,
                  enableInfiniteScroll: false,
                  initialPage: 2,
                  autoPlay: true,
                ),
                items: imageSliders,
              )
          ),
        ),
      ],
    );
  }
}
