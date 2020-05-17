import 'dart:ui';

import 'package:flutter/material.dart';

void main() {
  runApp(GaleryApp());
}

class GaleryApp extends StatefulWidget {
  @override
  _GaleryAppState createState() => _GaleryAppState();
}

class _GaleryAppState extends State<GaleryApp> {
  int count = 0;
  List<String> bucketPicLinks = [
    '0.jpg',
    '1.jpg',
    '2.jpg',
  ];

  Iterable<String> increaseNumPic() sync* {
    if (count < bucketPicLinks.length) {
      yield bucketPicLinks[count];
      // avoid to increase the count beyond the length of the bucketPicLinks
      if (count < bucketPicLinks.length-1) {
        count++;
      }
    }
  }

  Iterable<String> decreaseNumPic() sync* {
    if (count > 0) {
      count--;
      yield bucketPicLinks[count];
    }// avoid to decrease the count beyond the length of the bucketPicLinks
    else{
      yield bucketPicLinks[count];
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Center(
              child: Text('Galery')),
        ),
        body: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(
                      'images/$count.jpg'),
                  fit: BoxFit.cover)),
          child: Center(
            child: ClipRect(
              child: SizedBox(
                child: BackdropFilter(
                  filter: ImageFilter.blur(
                    sigmaX: 12.0,
                    sigmaY: 12.0,
                  ),
                  child: Center(
                    child: Stack(
                      children: <Widget>[
                        Image(
                          image: AssetImage(
                              // Calling the same pic but blur pic
                              'images/$count.jpg'),
                        ),
                        //right side
                        Positioned(
                          left: 200,
                          right: 0,
                          top: 0,
                          bottom: 0,
                          child: FlatButton(
                            highlightColor: Colors.transparent,
                            splashColor: Colors.transparent,
                            onPressed: () {
                              setState(() {
                                // Calling incrementFlowPic
                                print(increaseNumPic());
                              });
                            },

                          ),
                        ),
                        //Left side
                        Positioned(
                          left: 0,
                          right: 200,
                          top: 0,
                          bottom: 0,
                          child: FlatButton(
                            highlightColor: Colors.transparent,
                            splashColor: Colors.transparent,
                            onPressed: () {
                              setState(() {
                                // Calling decrementFlowPic
                                print(decreaseNumPic());
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
