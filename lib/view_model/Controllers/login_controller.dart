import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../utils/routes/route_name.dart';
import '../../utils/utils.dart';
import '../services/session_manages.dart';

class LoginController with ChangeNotifier {
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  // DatabaseReference ref = FirebaseDatabase.instance.ref().child('User');
  bool _loading = false;

  bool get loading => _loading;

  setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  void login(BuildContext context, String email, String password) async {
    setLoading(true);

    firebaseAuth
        .signInWithEmailAndPassword(email: email, password: password)
        .then((value) {
      setLoading(false);

      Utils.toastMessage('User Logged In Successfully');
      SessionController().userId = value.user!.uid.toString();
      Navigator.pushNamed(context, RouteName.dashboardScreen);
    }).onError((error, stackTrace) {
      setLoading(false);

      Utils.toastMessage(error.toString());
    });
  }
}
