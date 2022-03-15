// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class AdsCards extends StatelessWidget {
  AdsCards({Key? key}) : super(key: key);
  List<dynamic> cardData = [
    {
      'title': 'Vehicle',
      'price': '₹ 5,000',
      'image': 'AdsCardsImage/adsImages (1).png'
    },
    {
      'title': 'HandTools',
      'price': '₹ 2,000',
      'image': 'AdsCardsImage/adsImages (2).png'
    },
    {
      'title': 'Vehicle',
      'price': '₹ 7,000',
      'image': 'AdsCardsImage/adsImages (3).png'
    },
    {
      'title': 'Bull',
      'price': '₹ 1,500',
      'image': 'AdsCardsImage/adsImages (4).png'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      itemCount: cardData.length,
      itemBuilder: (context, index) {
        return GridTile(
          child: AdsCard(
              title: '${cardData[index]['title']}',
              price: '${cardData[index]['price']}',
              image: '${cardData[index]['image']}'),
        );
      },
      gridDelegate:
          const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
    );
  }
}

class AdsCard extends StatelessWidget {
  const AdsCard(
      {Key? key, required this.title, required this.price, required this.image})
      : super(key: key);
  final String title, price, image;

  @override
  Widget build(BuildContext context) {
    return Card(
      // elevation: 3,
      margin: const EdgeInsets.all(10.0),
      child: ElevatedButton(
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.white)),
        onPressed: () {},
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.asset(
              image,
              height: 130,
              fit: BoxFit.fill,
            ),
            SizedBox(
              height: 10.0,
            ),
            Row(
              children: [
                Text(
                  title,
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.w800),
                ),
                const Spacer(),
                Text(
                  price,
                  style: TextStyle(color: Colors.black.withOpacity(0.6)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
