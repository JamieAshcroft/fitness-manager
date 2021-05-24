import 'package:flutter/material.dart';

class AboutWidget extends StatefulWidget {
  @override
  _AboutWidgetState createState() => _AboutWidgetState();
}

class _AboutWidgetState extends State<AboutWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[100],
      body: SafeArea(
        child: Container(
          child: Card(
            margin: EdgeInsets.all(16),
            elevation: 12,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(24),
            ),
            color: Colors.white,
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 24.0, vertical: 36),
              child: Row(
                children: <Widget>[
                  FlutterLogo(size: 48),
                  SizedBox(
                    width: 16,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Text(
                          'Title of the Card',
                          style: Theme.of(context).textTheme.headline5,
                        ),
                        Text('Some description',
                            style: Theme.of(context).textTheme.headline6),
                      ],
                    ),
                  ),
                  Icon(
                    Icons.navigate_next,
                    size: 36,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
