import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
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
    MediaQueryData queryData;
    queryData = MediaQuery.of(context);
    return SafeArea(
      child: Column(
        children: [
          Image.asset(
            'assets/loginPageImg.png',
            width: queryData.size.width + 200,
            // height: 100,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Welcome to Kisan Hal',
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                    fontFamily: 'Overprass'),
              ),
              const SizedBox(
                height: 100,
              ),
              OutlinedButton.icon(
                  onPressed: () {
                    final provider = Provider.of<GoogleSignInProvider>(context,
                        listen: false);
                    provider.login();
                  },
                  icon: FaIcon(
                    FontAwesomeIcons.google,
                    color: Colors.green[300],
                  ),
                  label: const Text("Google Sign-in"))
            ],
          ),
        ],
      ),
    );
  }
}
