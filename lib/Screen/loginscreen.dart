import 'package:flutter/material.dart';

import 'package:kisaanhal/provider/google_sign_in.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: Column(
          children: [
            Image.asset('assets/loginPageImg.png', fit: BoxFit.fill),
            const SizedBox(
              // width: 500,
              height: 60,
            ),
            const Text(
              'Welcome to KisanHal ',
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w700,
                  color: Color.fromARGB(255, 0, 2, 7),
                  fontFamily: 'Overprass'),
            ),
            const SizedBox(
              height: 50,
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 60),
              child: const Text(
                'Lets Join together ',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                  fontFamily: 'Overpass',
                  color: Color.fromARGB(255, 48, 164, 100),
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            OutlinedButton.icon(
              style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all(Colors.black),
                padding: MaterialStateProperty.all(const EdgeInsets.all(12.0)),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                ),
              ),
              onPressed: () async {
                final provider =
                    Provider.of<GoogleSignInProvider>(context, listen: false);
                await provider.login();
              },
              icon: Image.asset('assets/googleLogo.png'),
              label: const Text(
                "Google Sign-in",
                style: TextStyle(
                    fontSize: 24,
                    fontFamily: 'Overpass',
                    fontWeight: FontWeight.w500),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
