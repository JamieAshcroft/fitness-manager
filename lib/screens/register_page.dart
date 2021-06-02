import 'package:fitness_management/features/constants.dart';
import 'package:fitness_management/screens/home_page.dart';
import 'package:fitness_management/screens/sign_up_page.dart';
import 'package:fitness_management/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class RegisterWidget extends StatefulWidget {
  @override
  _RegisterWidgetState createState() => _RegisterWidgetState();
}

class _RegisterWidgetState extends State<RegisterWidget> {
  final _formKey = GlobalKey<FormState>();

  String email = '';
  String password = '';
  String error = '';

  @override
  Widget build(BuildContext context) {
    final _auth = Provider.of<AuthProvider>(context, listen: false);

    return Scaffold(
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
                padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Hey There,\nWelcome',
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
                        'Sign-Up to continue!',
                        style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                            fontWeight: FontWeight.normal,
                            decoration: TextDecoration.none),
                      ),
                    ),
                    Form(
                      key: _formKey,
                      child: Column(
                        children: <Widget>[
                          SizedBox(height: 20.0),
                          TextFormField(
                            decoration: textInputDecoration.copyWith(
                                hintText: 'Enter an email address'),
                            textCapitalization: TextCapitalization.none,
                            validator: (val) => val!.isEmpty
                                ? 'Enter your email address'
                                : null,
                            onChanged: (val) {
                              setState(() => email = val);
                            },
                          ),
                          SizedBox(height: 20.0),
                          TextFormField(
                            decoration: textInputDecoration.copyWith(
                                hintText: 'Enter a password'),
                            validator: (val) => val!.length < 6
                                ? 'Password must be 6+ chars long'
                                : null,
                            obscureText: true,
                            onChanged: (val) {
                              setState(() => password = val);
                            },
                          ),
                          SizedBox(height: 20),
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
                              if (_formKey.currentState!.validate()) {
                                final result = await _auth
                                    .registerUserWithEmailAndPassword(
                                        email, password);

                                if (result) {
                                  Navigator.of(context).pop();
                                } else {
                                  setState(() => error =
                                      'Please supply a valid email address');
                                }
                              }
                            },
                            icon: FaIcon(
                              FontAwesomeIcons.signInAlt,
                              color: Colors.red,
                            ),
                            label: Text('Register'),
                          ),
                          SizedBox(height: 12),
                          Text(
                            error,
                            style: TextStyle(color: Colors.red),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
