import 'package:firebase_auth/firebase_auth.dart';
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
    User? user = FirebaseAuth.instance.currentUser;
    String? userName = user!.displayName;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        title: const Text('Kisaan Hal'),
        elevation: 0,
        titleTextStyle: const TextStyle(color: Colors.black, fontSize: 26.0),
        centerTitle: true,
        actions: <Widget>[
          Padding(
              padding: const EdgeInsets.only(right: 20.0),
              child: GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, '/itemaddinfo');
                },
                child: const Icon(
                  Icons.add,
                  size: 26.0,
                ),
              )),
        ],
      ),
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Card(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 20, horizontal: 100),
              child: Column(children: [Text(userName!)]),
            ),
          ),
          const AdsCards(),
        ],
      ),
    );
  }
}
