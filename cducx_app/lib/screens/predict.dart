import 'package:flutter/material.dart';
import 'package:covid/constants.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:tflite/tflite.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Predictor extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: MyImagePicker(),
    );
  }
}

//List myout = null;

class MyImagePicker extends StatefulWidget {
  @override
  _MyImagePickerState createState() => _MyImagePickerState();
}

class _MyImagePickerState extends State<MyImagePicker> {
  File imageURI;
  List result;
  bool _loading = false;
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
                    flex: 1,
                    child: Center(
                      child: Text('No image selected.'),
                    ),
                  )
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
              // padding: EdgeInsets.all(8),
              //  decoration: BoxDecoration(),
              // margin: const EdgeInsets.only(left: 26.0),
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
/*
showAlertDialog5(BuildContext context) {
  // Create button
  Widget okButton = FlatButton(
    child: Text("OK"),
    onPressed: () {
      Navigator.of(context).pop();
    },
  );
  // Create AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text("Result"),
    content: RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 25.0,
        ),
        // /
        children: <TextSpan>[
          TextSpan(text: 'Result : '),
          myout == null
              ? TextSpan(text: 'None')
              : TextSpan(
                  text: '${myout[0]["label"]} Case',
                  style: TextStyle(
                      color: myout[0]["label"] == 'Covid'
                          ? Colors.red
                          : Colors.green),
                )
        ],
      ),
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
}
*/
