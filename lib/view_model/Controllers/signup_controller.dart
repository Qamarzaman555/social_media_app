import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/foundation.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../utils/routes/route_name.dart';
import '../../utils/utils.dart';
import '../services/session_manages.dart';

class SignUpController with ChangeNotifier {
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  DatabaseReference ref = FirebaseDatabase.instance.ref().child('User');
  bool _loading = false;

  bool get loading => _loading;

  setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  void signUp(BuildContext context, String userName, String email,
      String password) async {
    setLoading(true);

    firebaseAuth
        .createUserWithEmailAndPassword(email: email, password: password)
        .then((value) {
      SessionController().userId = value.user!.uid.toString();

    setLoading(false);

      ref.child(value.user!.uid.toString()).set({
        'uid': value.user!.uid.toString(),
        'email': value.user!.email!.toLowerCase().toString(),
        'userName': userName,
      }).then((value) {
    setLoading(false);

        Navigator.pushNamed(context, RouteName.dashboardScreen);
      }).onError((error, stackTrace) {
    setLoading(false);

        Utils.toastMessage(error.toString());
      });
      Utils.toastMessage('User Created Successfully');
    }).onError((error, stackTrace) {
    setLoading(false);

      Utils.toastMessage(error.toString());
    });
  }
}
