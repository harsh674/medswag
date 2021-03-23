import 'package:flutter/cupertino.dart';
import 'package:swag_health/Checkout.dart';
import 'package:swag_health/LogIn.dart';
import 'package:swag_health/Medicine.dart';
import 'package:swag_health/News.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:swag_health/Summon.dart';
import 'category_model.dart';
import 'package:swag_health/screens/stats_screen.dart';

import 'screens/stats_screen.dart';

void main() {
  runApp(Home());
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      home: new Main(),
    );
  }
}

class Main extends StatefulWidget {
  Main({Key key}) : super(key: key);
  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<Main> {
  final GlobalKey<NavigatorState> _navigatorKey = GlobalKey<NavigatorState>();
  List<Category> list1 = List<Category>();
  int selectedIndex = 1;
  final widgetOptions = ['Summon', 'Home', 'Checkout'];
  String set = "Home";
  @override
  void initState() {
    {
      list1 = [
        Category('Panadol',
            'https://en.wikipedia.org/wiki/Paracetamol_brand_names#/media/File:Panadol.jpg'),
        Category('LIV 52',
            'https://en.wikipedia.org/wiki/The_Himalaya_Drug_Company#/media/File:Logo_of_Himalaya_-_The_Drug_Company.svg'),
        Category('Astra Zeneca',
            'https://en.wikipedia.org/wiki/AstraZeneca#/media/File:AstraZeneca.svg'),
        Category('Moderna',
            'https://en.wikipedia.org/wiki/Moderna#/media/File:Moderna_Therapeutics_company_logo.png'),
        Category('CoVaxin',
            'https://en.wikipedia.org/wiki/Bharat_Biotech#/media/File:Bharat_Biotech_logo.svg'),
        Category('Vaxart',
            'https://en.wikipedia.org/wiki/Vaxart#/media/File:Vaxart_logo.svg'),
        Category('Medline',
            'ahttps://en.wikipedia.org/wiki/Cipla#/media/File:Cipla_logo.svg'),
        Category('Moov',
            'https://en.wikipedia.org/wiki/Cipla#/media/File:Cipla_logo.svg'),
        Category('BetaDine',
            'https://en.wikipedia.org/wiki/Cipla#/media/File:Cipla_logo.svg'),
        Category('Dettol',
            'https://en.wikipedia.org/wiki/Cipla#/media/File:Cipla_logo.svg'),
      ];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Text(
                'Med-Swag',
                style: TextStyle(color: Colors.white, fontSize: 30),
              ),
              decoration: BoxDecoration(
                color: Colors.black,
              ),
            ),
            ListTile(
              title: Text('Covid Updates'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => StatsScreen()),
                );
              },
            ),
            ListTile(
                title: Text('Medicine'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Medicine()),
                  );
                }),
            ListTile(
              title: Text('About Us'),
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),
            ListTile(
              title: Text('Contact Us'),
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),
          ],
        ),
      ),
      backgroundColor: Colors.white,
      appBar: AppBar(
        // leading: new IconButton(
        //   icon: new Icon(Icons.arrow_back, color: Colors.white),
        //   onPressed: () => Navigator.push(
        //       context, MaterialPageRoute(builder: (context) => Home())),
        // ),
        actions: <Widget>[
          IconButton(
              icon: new Icon(Icons.exit_to_app),
              tooltip: 'Log Out',
              onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LogIn()),
                  ))
        ],
        centerTitle: true,
        title: Text(
          set,
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.black,
        elevation: 0,
      ),
      body: Navigator(key: _navigatorKey, onGenerateRoute: generateRoute),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.star_border), title: Text('Summon')),
          BottomNavigationBarItem(icon: Icon(Icons.home), title: Text('Home')),
          BottomNavigationBarItem(
              icon: Icon(Icons.local_grocery_store), title: Text('Checkout')),
        ],
        currentIndex: selectedIndex,
        fixedColor: Colors.lightGreen,
        unselectedItemColor: Colors.black,
        onTap: onItemTapped,
      ),
    );
  }

  void onItemTapped(int index) {
    switch (index) {
      case 0:
        _navigatorKey.currentState.pushReplacementNamed("Summon");
        break;
      case 1:
        _navigatorKey.currentState.pushReplacementNamed("Home");
        break;
      case 2:
        _navigatorKey.currentState.pushReplacementNamed("Checkout");
        break;
    }
    setState(() {
      selectedIndex = index;
      set = widgetOptions[selectedIndex].toString();
    });
  }

  Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case "Checkout":
        return MaterialPageRoute(
            builder: (context) => Checkout());
      case "Summon":
        return MaterialPageRoute(
            builder: (context) => Summon());
      default:
        return MaterialPageRoute(builder: (context) => HomeButton());
    }
  }
}
