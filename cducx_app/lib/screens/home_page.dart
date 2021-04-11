import 'package:covid/constants.dart';
import 'package:covid/screens/about_us.dart';
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavDrawer(),
      appBar: AppBar(
        toolbarHeight: 70.0,
        centerTitle: true,
        title: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/dosanddonts/covid19.png',
              fit: BoxFit.contain,
              height: 40.0,
              width: 40.0,
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
        // leading: IconButton(
        //  icon: Icon(Icons.menu),
        //onPressed: () {
        // NavDrawer();
        //},
        // ),
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
      /*
        BottomNavigationBar(
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
        
        */
      bottomNavigationBar: BottomAppBar(
        color: Colors.purple,
        child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                child: SizedBox(
                  height: 70,
                  child: Material(
                    type: MaterialType.transparency,
                    child: InkWell(
                      onTap: () => {
                        HomePage(),
                      },
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(
                            FontAwesomeIcons.home,
                            color: Colors.black,
                          ),
                          Text(
                            'Home',
                            style: kBottomBarTextStyle,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: SizedBox(
                  height: 70,
                  child: Material(
                    type: MaterialType.transparency,
                    child: InkWell(
                      onTap: () => {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => HomePage2())),
                      },
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(
                            FontAwesomeIcons.superpowers,
                            color: Colors.black,
                          ),
                          Text(
                            'Predict',
                            style: kBottomBarTextStyle,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ]),
      ),
      body: HomeBase(),
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
          height: 30,
        )
      ],
    );
  }
}

class NavDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Text(
              'CDUCX APP',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold),
            ),
            decoration: BoxDecoration(
                color: Colors.green,
                image: DecorationImage(
                    fit: BoxFit.fill,
                    image:
                        AssetImage('assets/images/dosanddonts/covid19.png'))),
          ),
          ListTile(
            leading: Icon(FontAwesomeIcons.home),
            title: Text('Home'),
            onTap: () => {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => HomePage())),
            },
          ),
          ListTile(
            leading: Icon(
              FontAwesomeIcons.lungsVirus,
            ),
            title: Text('Symptoms'),
            onTap: () => {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => SymptomsPage())),
            },
          ),
          ListTile(
            leading: Icon(
              FontAwesomeIcons.handsWash,
            ),
            title: Text('Do\'s and Dont\'s'),
            onTap: () => {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => DosAndDontsPage())),
            },
          ),
          ListTile(
            leading: Icon(FontAwesomeIcons.superpowers),
            title: Text('Predict'),
            onTap: () => {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => HomePage2())),
            },
          ),
          ListTile(
            leading: Icon(FontAwesomeIcons.infoCircle),
            title: Text('About Us'),
            onTap: () => {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => aboutus())),
            },
          ),
        ],
      ),
    );
  }
}
