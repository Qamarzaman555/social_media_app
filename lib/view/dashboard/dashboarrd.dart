import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../utils/routes/route_name.dart';
import '../../utils/utils.dart';
import '../../view_model/services/session_manages.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  FirebaseAuth auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          actions: [
            IconButton(
                onPressed: () {
                  auth.signOut().then((value) {
                    SessionController().userId = '';
                    Navigator.pushNamed(context, RouteName.loginScreen);
                    Utils.toastMessage('Logged Out Successfully');
                  });
                },
                icon: const Icon(Icons.logout))
          ],
        ),
        body: Center(child: Text('Dashboard${SessionController().userId}')));
  }
}
