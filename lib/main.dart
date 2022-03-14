import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:kisaanhal/Screen/loginscreen.dart';
import 'package:kisaanhal/Screen/navbar.dart';
import 'package:kisaanhal/provider/google_sign_in.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MaterialApp(
    home: LoginFunc(),
  ));
}

class LoginFunc extends StatelessWidget {
  const LoginFunc({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
       
        body: ChangeNotifierProvider(
          create: (context) => GoogleSignInProvider(),
          child: StreamBuilder(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (context, snapshot) {
              final provider = Provider.of<GoogleSignInProvider>(context);

              if (provider.isSigningIn) {
                return buildLoading();
              } else if (snapshot.hasData) {
                return const Navbar();
              } else {
                return const LoginScreen();
              }
            },
          ),
        ),
      );

  Widget buildLoading() => Stack(
        // fit: StackFit.expand,
        children: const [
          Center(child: CircularProgressIndicator()),
        ],
      );
}
