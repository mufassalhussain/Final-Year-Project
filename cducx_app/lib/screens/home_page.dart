import 'package:covid/constants.dart';
import 'package:covid/screens/symptoms.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:covid/components/reusable_card.dart';
import 'package:covid/screens/dos_and_donts.dart';
import 'package:covid/screens/predict.dart';
//import 'package:covid/screens/stats_screen.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  void onTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  final List<Widget> _children = [
    HomeBase(),
    Predictor(),
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 90.0,
          centerTitle: true,
          title: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/dosanddonts/covid19.png',
                fit: BoxFit.contain,
                height: 50.0,
                width: 50.0,
              ),
              Text(
                'CDUCX',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15.0),
              ),
              Container(
                padding: const EdgeInsets.all(8.0),
              ),
            ],
          ),
          leading: IconButton(
            icon: Icon(Icons.menu),
            onPressed: () {},
          ),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.notifications),
              onPressed: () {},
            ),
          ],
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [Colors.purple, Colors.blue],
              ),
            ),
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          onTap: onTapped,
          backgroundColor: Colors.purple,
          currentIndex: _currentIndex,
          items: [
            BottomNavigationBarItem(
              icon: Icon(
                FontAwesomeIcons.home,
                color: Colors.black,
              ),
              title: Text(
                'Home',
                style: kBottomBarTextStyle,
              ),
            ),
            BottomNavigationBarItem(
              icon: Icon(
                FontAwesomeIcons.superpowers,
                color: Colors.black,
              ),
              title: Text(
                'Predict',
                style: kBottomBarTextStyle,
              ),
            ),
          ],
        ),
        body: _children[_currentIndex],
      ),
    );
  }
}

class HomeBase extends StatelessWidget {
  const HomeBase({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        SizedBox(
          height: 40.0,
        ),
        /*
        Expanded(
          flex: 1,
          child: Container(
            padding: EdgeInsets.only(left: 20.0, top: 20.0),
            child: Text(
              'Home',
              style: TextStyle(
                fontFamily: 'Baloo',
                fontSize: 40.0,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
        
        ),*/
        Expanded(
          flex: 2,
          child: HomeScreenCard(
              colour: Color(0xFF47B2A0),
              onPress: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SymptomsPage()));
              },
              iconChild: Icon(
                FontAwesomeIcons.lungsVirus,
                size: kHomeScreenIconSize,
              ),
              text: 'Symptoms'),
        ),
        Expanded(
          flex: 2,
          child: HomeScreenCard(
              colour: Colors.orange,
              onPress: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => DosAndDontsPage()));
              },
              iconChild:
                  Icon(FontAwesomeIcons.handsWash, size: kHomeScreenIconSize),
              text: 'Do\'s and Dont\'s'),
        ),
        SizedBox(
          height: 40,
        )
      ],
    );
  }
}
