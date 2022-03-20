import 'package:flutter/material.dart';

class ItemInfoScreen extends StatefulWidget {
  final String title, price, imageUrl, name;
  const ItemInfoScreen(
      {Key? key,
      required this.title,
      required this.price,
      required this.name,
      required this.imageUrl})
      : super(key: key);

  @override
  State<ItemInfoScreen> createState() => ItemInfoScreenState();
}

class ItemInfoScreenState extends State<ItemInfoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          title: Text(
            widget.name,
          ),
          elevation: 0,
          titleTextStyle: const TextStyle(color: Colors.black, fontSize: 26.0),
          centerTitle: true,
        ),
        backgroundColor: Colors.white,
        body: Column(children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(20),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child: Image.network(widget.imageUrl),
            ),
          ),
          Container(
            alignment: Alignment.topLeft,
            padding: const EdgeInsets.fromLTRB(20.0, 20.0, 0, 0),
            child: Text(
              widget.title,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          Container(
              alignment: Alignment.topLeft,
              padding: const EdgeInsets.fromLTRB(20.0, 20.0, 0, 0),
              child: const Text(
                "Items:  Tractor",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              )),
          Container(
              alignment: Alignment.topLeft,
              padding: const EdgeInsets.fromLTRB(20.0, 20.0, 0, 0),
              child: const Text(
                "Description: \nTata Red Tractor \n 30km per liter",
                style: TextStyle(fontSize: 16),
              )),
          Container(
            alignment: Alignment.topLeft,
            padding: const EdgeInsets.fromLTRB(20.0, 20.0, 0, 0),
            child: const Text(
              "Owner Name: UserName \n Location: Kolhapur",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            alignment: Alignment.bottomCenter,
            margin: const EdgeInsets.all(25),
            padding: const EdgeInsets.fromLTRB(0, 90, 0, 0),
            child: ElevatedButton(
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.green),
                  foregroundColor: MaterialStateProperty.all(Colors.white),
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                  )),
              onPressed: () {},
              child: const Text(
                'Start Chating',
                style: TextStyle(fontSize: 20.0),
              ),
            ),
          ),
        ]));
  }
}
