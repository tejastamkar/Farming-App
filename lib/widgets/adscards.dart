// ignore_for_file: prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:kisaanhal/Screen/item_info.dart';

class AdsCards extends StatefulWidget {
  const AdsCards({Key? key}) : super(key: key);

  @override
  State<AdsCards> createState() => _AdsCardsState();
}

class _AdsCardsState extends State<AdsCards> {
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
    final Stream<QuerySnapshot> collection =
        FirebaseFirestore.instance.collection('Ads').snapshots();

    return StreamBuilder<QuerySnapshot>(
      stream: collection,
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        final data = snapshot.data;
        if (snapshot.hasError) {
          return Text("Something went Wrong");
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Text('loading data');
        }
        if (snapshot.hasData) {
          return GridView.builder(
            shrinkWrap: true,
            itemCount: data.size,
            itemBuilder: (context, index) {
              return GridTile(
                child: AdsCard(
                    name: '${data.docs[index]['Name']}',
                    title: '${data.docs[index]['Title']}',
                    price: '${data.docs[index]['Price']}',
                    image: '${data.docs[index]['Picture']}'),
              );
            },
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2),
          );
        }
        return Text("Loading...");
      },
    );
  }
}

class AdsCard extends StatelessWidget {
  const AdsCard(
      {Key? key,
      required this.title,
      required this.price,
      required this.image,
      required this.name})
      : super(key: key);
  final String title, price, image, name;

  @override
  Widget build(BuildContext context) {
    return Card(
      // elevation: 3,
      margin: const EdgeInsets.all(10.0),
      child: ElevatedButton(
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.white)),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ItemInfoScreen(
                    title: title, price: price, imageUrl: image, name: name)),
          );
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.network(
              image,
              // width: 200,
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
