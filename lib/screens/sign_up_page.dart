import 'package:fitness_management/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class SignUpWidget extends StatelessWidget {
  final AuthProvider _auth = AuthProvider();
  @override
  Widget build(BuildContext context) => Scaffold(
        body: AnnotatedRegion<SystemUiOverlayStyle>(
          value: SystemUiOverlayStyle.light,
          child: GestureDetector(
            child: Stack(
              children: <Widget>[
                Container(
                  height: double.infinity,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Color(0x663bb9eb),
                        Color(0x993bb9eb),
                        Color(0xcc3bb9eb),
                        Color(0xff3bb9eb),
                      ],
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(32),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Spacer(),
                      FlutterLogo(size: 120),
                      Spacer(),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Hey There,\nWelcome Back',
                          style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              decoration: TextDecoration.none),
                        ),
                      ),
                      SizedBox(height: 8),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Login to your account to continue',
                          style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                              fontWeight: FontWeight.normal,
                              decoration: TextDecoration.none),
                        ),
                      ),
                      Spacer(),
                      ElevatedButton.icon(
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(14.0),
                            ),
                            primary: Colors.white,
                            onPrimary: Colors.black,
                            minimumSize: Size(double.infinity, 50),
                          ),
                          icon: FaIcon(
                            FontAwesomeIcons.google,
                            color: Colors.red,
                          ),
                          onPressed: () {
                            final provider = Provider.of<AuthProvider>(context,
                                listen: false);
                            provider.googleLogin();
                          },
                          label: Text('Sign Up with Google')),
                      SizedBox(
                        height: 16,
                      ),
                      ElevatedButton.icon(
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(14.0),
                            ),
                            primary: Colors.white,
                            onPrimary: Colors.black,
                            minimumSize: Size(double.infinity, 50),
                          ),
                          onPressed: () {},
                          icon: FaIcon(
                            FontAwesomeIcons.addressBook,
                            color: Colors.red,
                          ),
                          label: Text('Sign Up with email')),
                      SizedBox(height: 16),
                      ElevatedButton.icon(
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(14.0),
                            ),
                            primary: Colors.white,
                            onPrimary: Colors.black,
                            minimumSize: Size(double.infinity, 50),
                          ),
                          onPressed: () async {
                            dynamic result = await _auth.signInAnon();
                            if (result == null) {
                              print('error signing in');
                            } else {
                              print('signed in');
                              print(result);
                            }
                          },
                          icon: FaIcon(
                            FontAwesomeIcons.signInAlt,
                            color: Colors.red,
                          ),
                          label: Text('Continue as guest')),
                      SizedBox(height: 40),
                      RichText(
                        text: TextSpan(
                          text: 'Already have an account? ',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                          children: [
                            TextSpan(
                              text: 'Log in',
                              style: TextStyle(
                                  decoration: TextDecoration.underline),
                            ),
                          ],
                        ),
                      ),
                      Spacer(),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      );
}
