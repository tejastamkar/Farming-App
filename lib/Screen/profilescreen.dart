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
    return Column(
      children: [
        const Center(child: Text('This is Profile screen')),
        ElevatedButton.icon(
            onPressed: () {
              final provider =
                  Provider.of<GoogleSignInProvider>(context, listen: false);
              provider.logout();
            },
            icon: const Icon(Icons.logout),
            label: const Text('LogOut'))
      ],
    );
  }
}
