import 'package:fitness_management/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';

class SideMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser!;
    return Drawer(
      child: Column(
        children: <Widget>[
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(10),
            color: Theme.of(context).primaryColor,
            child: Center(
              child: Column(
                children: [
                  Container(
                    width: 100,
                    height: 50,
                    alignment: Alignment.topLeft,
                  ),
                  CircleAvatar(
                    radius: 30,
                  ),
                  SizedBox(height: 8),
                ],
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.logout),
            onTap: () {
              final provider =
                  Provider.of<AuthProvider>(context, listen: false);
              provider.logout();
            },
          ),
        ],
      ),
    );
  }
}
