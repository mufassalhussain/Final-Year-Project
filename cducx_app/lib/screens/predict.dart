import 'package:flutter/material.dart';
import 'package:covid/constants.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:tflite/tflite.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:covid/screens/home_page.dart';
import 'package:bmprogresshud/bmprogresshud.dart';
import 'dart:async';

class Predictor extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: MyImagePicker(),
    );
  }
}

double probability;

class HomePage2 extends StatefulWidget {
  @override
  _HomePage2State createState() => _HomePage2State();
}

class _HomePage2State extends State<HomePage2> {
  GlobalKey<ProgressHudState> _hudKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: NavDrawer(),
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'Predict',
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
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => HomePage())),
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
                          HomePage2(),
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
        body: ProgressHud(
            key: _hudKey,
            maximumDismissDuration: Duration(seconds: 2),
            child: Center(
              child: Builder(builder: (context) {
                return Predictor();
              }),
            )));
  }
}

//List myout = null;
String mytext;

class MyImagePicker extends StatefulWidget {
  @override
  _MyImagePickerState createState() => _MyImagePickerState();
}

class _MyImagePickerState extends State<MyImagePicker> {
  File imageURI;
  List result;
  bool _loading = false;
  bool flag = false;

  //String result1;
  //String path;

  //final picker = ImagePicker();

/*
  Future getImageFromCamera() async {
    final image = await picker.getImage(source: ImageSource.camera);
    setState(() {
      imageURI = File(image.path);
      path = image.path;
    });
  }

  Future getImageFromGallery() async {
    final image = await picker.getImage(source: ImageSource.gallery);
    setState(() {
      imageURI = File(image.path);
      path = image.path;
    });
  }
  */

/*
  Future classifyImage() async {
    await Tflite.loadModel(
        model: "assets/models/model1.tflite",
        labels: "assets/models/labels.txt");
    var output = await Tflite.runModelOnImage(path: path);
    setState(() {
      result = output;
      //myout = output;
      //result1 = output.toString();
    });
  }
*/

  @override
  void initState() {
    super.initState();
    _loading = true;
    if (imageURI == null) {
      flag = true;
    }
    loadModel().then((value) {
      setState(() {
        _loading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            imageURI == null
                ? Expanded(
                    flex: 5,
                    child: Image.asset('assets/images/dosanddonts/select.png',
                        width: 300, height: 200, fit: BoxFit.cover))
                : Expanded(
                    flex: 5,
                    child: Image.file(imageURI,
                        width: 300, height: 200, fit: BoxFit.cover),
                  ),

            /*
            Expanded(
              flex: 3,
              child: Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Color(0xFFDFE2E2),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: RaisedButton(
                  onPressed: () => getImageFromCamera(),
                  child: Text(
                    'Click Here To Select Image From Camera',
                    style: kPredictButtonsStyle,
                    textAlign: TextAlign.center,
                  ),
                  color: kSelectImageCameraButtonColor,
                  padding: EdgeInsets.fromLTRB(12, 12, 12, 12),
                ),
              ),
            ),
           
           */
            Expanded(
              flex: 3,
              child: Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Color(0xFFDFE2E2),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: RaisedButton(
                  onPressed: () => pickImage(),
                  child: Column(
                    children: <Widget>[
                      Icon(
                        FontAwesomeIcons.image,
                        size: 50.0,
                      ),
                      Text(
                        'Select Image From Gallery',
                        style: kPredictButtonsStyle,
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                  textColor: Colors.black,
                  color: kSelectImageButtonGalleryColor,
                  padding: EdgeInsets.fromLTRB(12, 12, 12, 12),
                ),
              ),
            ),
            /*
            Expanded(
              flex: 3,
              child: Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Color(0xFFDFE2E2),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: RaisedButton(
                  onPressed: () => classifyImage(),
                  child: Column(
                    children: <Widget>[
                      Icon(
                        FontAwesomeIcons.superpowers,
                        size: 50.0,
                      ),
                      Text(
                        'Predict',
                        style: kPredictButtonsStyle,
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                  color: kClassifyImageButtonColor,
                  padding: EdgeInsets.fromLTRB(12, 12, 12, 12),
                ),
              ),
            ),
         */
            Expanded(
              flex: 3,
              child: Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Color(0xFFDFE2E2),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: RaisedButton(
                  onPressed: () => _showProgressHud(context, result),
                  child: Column(
                    children: <Widget>[
                      Icon(
                        FontAwesomeIcons.superpowers,
                        size: 50.0,
                      ),
                      Text(
                        'Predict',
                        style: kPredictButtonsStyle,
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                  textColor: Colors.black,
                  color: Colors.blueAccent,
                  padding: EdgeInsets.fromLTRB(12, 12, 12, 12),
                ),
              ),

              /*
              child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25.0,
                  ),
                  // /
                  children: <TextSpan>[
                    TextSpan(text: 'Result : '),
                    result == null
                        ? TextSpan(text: 'None')
                        : TextSpan(
                            text: '${result[0]["label"]} Case',
                            style: TextStyle(
                                color: result[0]["label"] == 'Positive'
                                    ? Colors.red
                                    : Colors.green),
                          )
                  ],
                ),
              ),
            */
            ),
            SizedBox(
              height: 5.0,
            )
/*
            result == null
                ? Expanded(
                    flex: 2,
                    child: Center(
                      child: Text('Result', style: kResultTextStyle),
                    ),
                  )
                : Expanded(
                    flex: 2,
                    child: Center(
                      child: Text(result1, style: kResultTextStyle),
                    ),
                  ),
        */
          ],
        ),
      ),
    );
  }

  loadModel() async {
    await Tflite.loadModel(
      model: "assets/models/model1.tflite",
      labels: "assets/models/labels.txt",
    );
  }

  pickImage() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);
    if (image == null) return null;
    setState(() {
      _loading = true;
      imageURI = image;
    });
    classifyImage(image);
  }

  classifyImage(File image) async {
    var output = await Tflite.runModelOnImage(
      path: image.path,
      numResults: 2,
      threshold: 0.5,
      imageMean: 127.5,
      imageStd: 127.5,
    );
    setState(() {
      _loading = false;
      result = output;
    });
  }

  @override
  void dispose() {
    Tflite.close();
    super.dispose();
  }
}

_showProgressHud(BuildContext context, List result) {
  if (result[0]["label"] == 'Normal' ||
      result[0]["label"] == 'Positive' ||
      result[0]["label"] == 'Other_Disease') {
    var hud = ProgressHud.of(context);
    hud.show(ProgressHudType.progress, "loading");

    double current = 0;
    Timer.periodic(Duration(milliseconds: 1000.0 ~/ 60), (timer) {
      current += 1;
      var progress = current / 100;
      hud.updateProgress(progress, "loading $current%");
      if (progress == 1) {
        hud.showAndDismiss(ProgressHudType.success, "Load success");
        timer.cancel();
        showAlertDialog5(context, result);
      }
    });
  }
}

//
_showErrorHud(BuildContext context) {
  ProgressHud.of(context)
      .showAndDismiss(ProgressHudType.error, "Load Fail Select Image First");
}

showAlertDialog5(BuildContext context, List myout) {
  var alertStyle = AlertStyle(
    animationType: AnimationType.fromTop,
    isOverlayTapDismiss: false,
    descStyle: TextStyle(fontWeight: FontWeight.bold),
    animationDuration: Duration(milliseconds: 350),
    titleStyle: TextStyle(
      color: Colors.red,
      fontWeight: FontWeight.bold,
    ),
  );
  var alertStyle2 = AlertStyle(
    animationType: AnimationType.fromTop,
    isOverlayTapDismiss: false,
    descStyle: TextStyle(fontWeight: FontWeight.bold),
    animationDuration: Duration(milliseconds: 350),
    titleStyle: TextStyle(
      color: Colors.green,
      fontWeight: FontWeight.bold,
    ),
  );
  var alertStyle3 = AlertStyle(
    animationType: AnimationType.fromTop,
    isOverlayTapDismiss: false,
    descStyle: TextStyle(fontWeight: FontWeight.bold),
    animationDuration: Duration(milliseconds: 350),
    titleStyle: TextStyle(
      color: Colors.orange,
      fontWeight: FontWeight.bold,
    ),
  );
  /* //Create button
  Widget okButton = FlatButton(
    child: Text("OK"),
    onPressed: () {
      Navigator.of(context).pop();
    },

  );
 */
  if (myout[0]["label"] == 'Positive') {
    //probability = myout[0]["confidence"];
    Alert(
      style: alertStyle,
      context: context,
      type: AlertType.error,
      title: "COVID19 Positive",
      desc:
          "You may require emergency care.Call an Ambulance right now.",
      buttons: [
        DialogButton(
          child: Text(
            "Ok",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          gradient: LinearGradient(colors: [
            Color.fromRGBO(116, 116, 191, 1.0),
            Color.fromRGBO(52, 138, 199, 1.0)
          ]),
          onPressed: () => Navigator.pop(context),
          width: 120,
        )
      ],
    ).show();
  } else if (myout[0]["label"] == 'Normal') {
    //probability = myout[0]["confidence"];
    //mytext = 'COVID19 status is '+myout[0]["label"].toString()+' Congratulation you are safe';
    Alert(
      context: context,
      style: alertStyle2,
      type: AlertType.success,
      title: "COVID19 Normal",
      desc: "Congratulation you are safe.",
      buttons: [
        DialogButton(
          child: Text(
            "Ok",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          gradient: LinearGradient(colors: [
            Color.fromRGBO(116, 116, 191, 1.0),
            Color.fromRGBO(52, 138, 199, 1.0)
          ]),
          onPressed: () => Navigator.pop(context),
          width: 120,
        )
      ],
    ).show();
  } else if (myout[0]["label"] == 'Other_Disease') {
    //probability = myout[0]["confidence"];
    Alert(
      context: context,
      style: alertStyle3,
      type: AlertType.warning,
      title: "Other Disease",
      desc: "You may require emergency care.",
      buttons: [
        DialogButton(
          child: Text(
            "Ok",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          gradient: LinearGradient(colors: [
            Color.fromRGBO(116, 116, 191, 1.0),
            Color.fromRGBO(52, 138, 199, 1.0)
          ]),
          onPressed: () => Navigator.pop(context),
          width: 120,
        )
      ],
    ).show();
  } else {}

/*
  // Create AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text("Result"),
    content: Text(
      '$mytext',
      style: TextStyle(
          color: myout[0]["label"] == 'Positive' ? Colors.red : Colors.green),
    ),
    actions: [
      okButton,
    ],
  );

 // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );

*/
}
