import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../utils/routes/route_name.dart';
import '../../utils/utils.dart';

class ForgotPasswordController with ChangeNotifier {
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  // DatabaseReference ref = FirebaseDatabase.instance.ref().child('User');
  bool _loading = false;

  bool get loading => _loading;

  setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  void forgotPassword(BuildContext context, String email) async {
    setLoading(true);

    firebaseAuth.sendPasswordResetEmail(email: email).then((value) {
      setLoading(false);

      Utils.toastMessage('Please your email to recover your password');
      // SessionController().userId = value.user!.uid.toString();
      Navigator.pushNamed(context, RouteName.loginScreen);
    }).onError((error, stackTrace) {
      setLoading(false);

      Utils.toastMessage(error.toString());
    });
  }
}
