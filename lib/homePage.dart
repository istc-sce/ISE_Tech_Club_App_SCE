import 'dart:math';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:isetechclub/topic_model/quotes.dart';
import 'package:isetechclub/widgets/carousel.dart';

// ignore: must_be_immutable
class HomePage extends StatelessWidget {
  List images = ['images/events.png', 'images/notes.png', 'images/programming.png'];
  List detailImage = [
    'Know about the latest events!',
    'Get online notes!',
    'Practice Competitive Programming!'
  ];
  List routes = ['/events','/notes','/programming'];
  @override
  Widget build(BuildContext context) {
    final List<Widget> imageSliders = images.map((item) =>
        CarouselMaker(item: item, detailImage: detailImage, images: images,routes: routes,))
        .toList();
    final _random = new Random();
    var element = quotes[_random.nextInt(quotes.length)];
    return ListView(
      children: [
        Image.asset('images/iseLogo.png',height: MediaQuery.of(context).size.height/2.5,),
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal:28.0),
              child: Divider(color: Colors.white,),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40.0,vertical: 8),
              child: Text(element,style: TextStyle(color: Colors.white, fontSize: 30,fontFamily: 'Kaushan'),textAlign: TextAlign.center,),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40.0),
              child: Align(alignment:Alignment.centerRight,child: Text(authors[quotes.indexOf(element)],style: TextStyle(color: Colors.white, fontSize: 30,fontFamily: 'Kaushan'),textAlign: TextAlign.center,)),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal:28.0,vertical: 8),
              child: Divider(color: Colors.white,),
            ),
          ],
        ),
        Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
            ),
            child: CarouselSlider(
              options: CarouselOptions(
                aspectRatio: 2.0,
                enlargeCenterPage: true,
                enableInfiniteScroll: false,
                initialPage: 1,
                autoPlay: true,
              ),
              items: imageSliders,
            )
        ),
      ],
    );
  }
}
