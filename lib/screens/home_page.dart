import 'package:firebase_auth/firebase_auth.dart';
import 'package:fitness_management/screens/screens.dart';
import 'package:flutter/material.dart';
import 'package:fitness_management/screens/sign_up_page.dart';
import 'package:fitness_management/screens/profile_page.dart';
import 'package:fitness_management/features/side_menu.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
        body: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            // final authProvider = Provider.of<AuthProvider>(context); <---- Empty condiiton
            // if (authProvider.isAnonymous) {}
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasData) {
              return HomePageDisplay();
            } else if (snapshot.hasError) {
              return Center(child: Text('Something went wrong!'));
            } else {
              return SignUpWidget();
            }
          },
        ),
      );
}

class HomePageDisplay extends StatefulWidget {
  @override
  _HomePageDisplayState createState() => _HomePageDisplayState();
}

class _HomePageDisplayState extends State<HomePageDisplay> {
  PageController _pageController = PageController();
  List<Widget> _screens = [
    MainDisplayWidget(),
    AboutWidget(),
    LoggedInWidget(),
  ];

  int _selectedIndex = 0;
  void _onPageChanged(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _onItemTapped(int selectedIndex) {
    _pageController.jumpToPage(selectedIndex);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        children: _screens,
        onPageChanged: _onPageChanged,
        physics: NeverScrollableScrollPhysics(),
      ),
      appBar: AppBar(
        title: Text(
          'KidCal',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.normal),
        ),
        iconTheme: IconThemeData(color: Colors.black),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.notifications_none),
            color: Colors.black,
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.search),
            color: Colors.black,
            onPressed: () {},
          ),
        ],
        elevation: 0,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.white, Colors.white],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
      ),
      drawer: SideMenu(),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: this._selectedIndex,
        selectedItemColor: Colors.greenAccent.shade400,
        unselectedItemColor: Colors.grey,
        backgroundColor: Colors.white,
        onTap: _onItemTapped,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.camera), label: 'About'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }
}

class MainDisplayWidget extends StatefulWidget {
  @override
  _MainDisplayWidgetState createState() => _MainDisplayWidgetState();
}

class _MainDisplayWidgetState extends State<MainDisplayWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      // title: Text('GENERAL KENOBI'),
      //centerTitle: true,
      //leading: IconButton(
      // icon: Icon(Icons.menu),
      // onPressed: () {},/
      // )),
      body: Container(
        color: Colors.blueGrey[100],
      ),
    );
  }
}
