import 'package:covid/constants.dart';
import 'package:covid/screens/about_us.dart';
import 'package:covid/screens/symptoms.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:covid/components/reusable_card.dart';
import 'package:covid/screens/dos_and_donts.dart';
import 'package:covid/screens/predict.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

//import 'package:covid/screens/stats_screen.dart';
String _message = '';
String nmesg = '-1';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();

  _registerOnFirebase() {
    _firebaseMessaging.subscribeToTopic('all');
    _firebaseMessaging.getToken().then((token) => print(token));
  }

  @override
  void initState() {
    _registerOnFirebase();
    getMessage();
    if (nmesg != _message) {
      if (_message != '') {
        final snackBar = SnackBar(
          content: Text('Notification: $_message'),
          action: SnackBarAction(
            label: 'Undo',
            onPressed: () {
              // Some code to undo the change.
            },
          ),
        );

        ScaffoldMessenger.of(context).showSnackBar(snackBar);
        nmesg = _message;
      }
    } else {}

    super.initState();
  }

  void getMessage() {
    _firebaseMessaging.configure(
        onMessage: (Map<String, dynamic> message) async {
      print('received message');
      setState(() => _message = message["notification"]["body"]);
    }, onResume: (Map<String, dynamic> message) async {
      print('on resume $message');
      setState(() => _message = message["notification"]["body"]);
    }, onLaunch: (Map<String, dynamic> message) async {
      print('on launch $message');
      setState(() => _message = message["notification"]["body"]);
    });
  }

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
          ],
        ),
        // leading: IconButton(
        //  icon: Icon(Icons.menu),
        //onPressed: () {
        // NavDrawer();
        //},
        // ),
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
              '',
            ),
            decoration: BoxDecoration(
                color: Colors.green,
                image: DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage('assets/images/dosanddonts/works.png'))),
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
