import 'package:fitness_management/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:fitness_management/screens/home_page.dart';
import 'package:provider/provider.dart';
import 'screens/screens.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  static final String title = 'MainPage';

  @override
  Widget build(BuildContext context) => ChangeNotifierProvider(
        create: (context) => GoogleSignInProvider(),
        child: MaterialApp(
          routes: {
            '/profile': (context) => LoggedInWidget(),
            '/about': (context) => AboutWidget(),
          },
          debugShowCheckedModeBanner: false,
          title: title,
          theme: ThemeData.dark().copyWith(accentColor: Colors.indigo),
          home: HomePage(),
        ),
      );
}
