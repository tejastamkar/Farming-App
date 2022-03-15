import 'package:flutter/material.dart';
import 'package:kisaanhal/widgets/adscards.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 100),
            child: Column(children: [Text('This is Dashboard')]),
          ),
        ),
        AdsCards(),
      ],
    );
  }
}
