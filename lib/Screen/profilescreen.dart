import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:kisaanhal/provider/google_sign_in.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    User? user = FirebaseAuth.instance.currentUser;
    String? userName = user!.displayName;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          'Profile',
        ),
        elevation: 0,
        titleTextStyle: const TextStyle(color: Colors.black, fontSize: 26.0),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: ListView(
          children: <Widget>[
            Card(
              elevation: 8,
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.fromLTRB(20, 20, 0, 20),
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(5.0),
                        child: Align(
                          heightFactor: 0.5,
                          widthFactor: 0.5,
                          child: Image.asset('assets/blank.png'),
                        )),
                  ),
                  Container(
                    padding: const EdgeInsets.all(20.0),
                    height: 120.0,
                    width: 120.0,
                    child: Text('$userName\nLocation\n+9579256322',
                        style: const TextStyle(fontSize: 12)),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Column(
              children: [
                Material(
                  elevation: 8,
                  child: Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.fromLTRB(20, 20, 0, 20),
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(5.0),
                            child: Align(
                              heightFactor: 0.3,
                              widthFactor: 0.3,
                              child: Image.asset('assets/blank.png'),
                            )),
                      ),
                      Container(
                        padding: const EdgeInsets.all(20.0),
                        height: 80.0,
                        width: 80.0,
                        child: const Text('Vehicle\nUser_name',
                            style: TextStyle(fontSize: 8)),
                      ),
                    ],
                  ),
                ),
                Material(
                  elevation: 8,
                  child: Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.fromLTRB(20, 20, 0, 20),
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(5.0),
                            child: Align(
                              heightFactor: 0.3,
                              widthFactor: 0.3,
                              child: Image.asset('assets/blank.png'),
                            )),
                      ),
                      Container(
                        padding: const EdgeInsets.all(20.0),
                        height: 80.0,
                        width: 80.0,
                        child: const Text('HandTools\nUser_name',
                            style: TextStyle(fontSize: 8)),
                      ),
                    ],
                  ),
                ),
                Material(
                  elevation: 8,
                  child: Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.fromLTRB(20, 20, 0, 20),
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(5.0),
                            child: Align(
                              heightFactor: 0.3,
                              widthFactor: 0.3,
                              child: Image.asset('assets/blank.png'),
                            )),
                      ),
                      Container(
                        padding: const EdgeInsets.all(20.0),
                        height: 80.0,
                        width: 80.0,
                        child: const Text('Bulls\nUser_name',
                            style: TextStyle(fontSize: 8)),
                      ),
                    ],
                  ),
                ),
                Material(
                  elevation: 8,
                  child: Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.fromLTRB(20, 20, 0, 20),
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(5.0),
                            child: Align(
                              heightFactor: 0.3,
                              widthFactor: 0.3,
                              child: Image.asset('assets/blank.png'),
                            )),
                      ),
                      Container(
                        padding: const EdgeInsets.all(20.0),
                        height: 80.0,
                        width: 80.0,
                        child: const Text('Vehicle\nUser_name',
                            style: TextStyle(fontSize: 8)),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              child: const Text(
                'Settings',
                style: TextStyle(color: Colors.black, fontSize: 18),
              ),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
              ),
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  '/identity',
                );
              },
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              child: const Text(
                'Logout',
                style: TextStyle(color: Colors.black, fontSize: 18),
              ),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
              ),
              onPressed: () {
                final provider =
                    Provider.of<GoogleSignInProvider>(context, listen: false);
                provider.logout();
              },
            ),
          ],
        ),
      ),
    );
  }
}
