import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

checkData(uid, name, email) {
  FirebaseFirestore.instance
      .collection('Users')
      .doc(uid)
      .get()
      .then((docSnapshot) => {
            if (docSnapshot.exists)
              {true}
            else
              {
                FirebaseFirestore.instance.collection('Users').doc(uid).set({
                  'Name': name,
                  "Email": email,
                  'Uid': uid,
                }),
              }
          });
}

fireStoreUserData() {
  GoogleSignInAccount? _userObj;
  final GoogleSignIn googleSignIn = GoogleSignIn();
  User? user = FirebaseAuth.instance.currentUser;
  String uid = user!.uid;
  late String email, name;
  googleSignIn.signIn().then((userData) {
    _userObj = userData;
    name = _userObj!.displayName.toString();
    email = _userObj!.email.toString();
    checkData(uid, name, email);
  }).catchError((e) {
    // print(e);
  });
}
