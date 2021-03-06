import 'package:flutter/material.dart';
import 'package:covid/screens/home_page.dart';

class aboutus extends StatefulWidget {
  @override
  _aboutusState createState() => _aboutusState();
}

class _aboutusState extends State<aboutus> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavDrawer(),
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'About Us',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 25.0,
            fontFamily: 'Poppins',
          ),
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
      body: Container(
          child: ListView(
        children: <Widget>[
          Column(
            children: <Widget>[
              SizedBox(
                width: 40.0,
                height: 10.0,
                child: Divider(
                  color: Colors.black,
                ),
              ),
              Text(
                'Developers',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30.0,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: Column(
                      children: <Widget>[
                        CircleAvatar(
                          radius: 90,
                          backgroundColor: Colors.black,
                          child: CircleAvatar(
                            backgroundColor: Colors.white,
                            radius: 85,
                            backgroundImage: AssetImage(
                                'assets/images/symptoms/myprofile.png'),
                          ),
                        ),
                        SizedBox(
                          width: 20.0,
                          height: 10.0,
                          child: Divider(
                            color: Colors.black,
                          ),
                        ),
                        Text(
                          'Muhammad Bilal',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15.0,
                          ),
                        ),
                        SizedBox(
                          width: 10.0,
                        ),
                        Text(
                          'Phone:',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15.0,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                        Text(
                          '+923047966966',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15.0,
                          ),
                        ),
                        SizedBox(
                          width: 20.0,
                          height: 10.0,
                          child: Divider(
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          'Email:',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15.0,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                        Text(
                          'jutt.muhammadbilal',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15.0,
                          ),
                        ),
                        Text(
                          '@gmail.com',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                  // SizedBox(
                  //   width: 20.0,
                  // ),
                  Expanded(
                    child: Column(
                      children: <Widget>[
                        CircleAvatar(
                          radius: 90,
                          backgroundColor: Colors.black,
                          child: CircleAvatar(
                            backgroundColor: Colors.white,
                            radius: 85,
                            backgroundImage: AssetImage(
                                'assets/images/symptoms/Mufassalprofile.png'),
                          ),
                        ),
                        SizedBox(
                          width: 20.0,
                          height: 10.0,
                          child: Divider(
                            color: Colors.black,
                          ),
                        ),
                        Text(
                          'Mufassal Hussain',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15.0,
                          ),
                        ),
                        Text(
                          'Phone:',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15.0,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                        Text(
                          '+923064672596',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15.0,
                          ),
                        ),
                        SizedBox(
                          width: 20.0,
                          height: 10.0,
                          child: Divider(
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          'Email:',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15.0,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                        Text(
                          'hmufassal',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15.0,
                          ),
                        ),
                        Text(
                          '@gmail.com',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                width: 20.0,
                height: 20.0,
                child: Divider(
                  color: Colors.black,
                ),
              ),
              Text(
                'About CDUCX',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30.0,
                  decoration: TextDecoration.underline,
                ),
              ),
              Wrap(children: <Widget>[
                SizedBox(
                  width: 2.0,
                  height: 8.0,
                  child: Divider(
                    color: Colors.black,
                  ),
                ),
                Text(
                  'Covid-19 Detection using Chest X-ray (CDUCX) is an Artificial intelligence based Model that can detect Covid-19 presence in your X-Ray by just giving X-Ray Image Using previous X-Ray dataset of COVID POSITIVE and COVID NEGATIVE Patients. It is developed as FYP project of BSCS Batch-15.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15.0,
                  ),
                ),
              ]),
              Expanded(
                child: Image.asset(
                  'assets/images/symptoms/comsatslogo.png',
                  height: 30.0,
                ),
              ),
            ],
          ),
        ],
      )),
    );
  }
}
