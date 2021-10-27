import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:smartyx_receipts/input.dart';
import 'package:smartyx_receipts/login.dart';
import 'package:permission_handler/permission_handler.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(
      statusBarColor: Colors.white.withOpacity(0.1),
      //or set color with: Color(0xFF0000FF)
    ));
    return MaterialApp(
      title: 'Receipts',
      debugShowCheckedModeBanner: false,
      // Set Raleway as the default app font
      theme: ThemeData(
        fontFamily: 'Roboto',
      ),

      home: MyHomePage(),
    );
  }
}

void setState(Map map) {}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  void getPermission() async {
    bool allow = await Permission.storage.isGranted;
    if (allow == true) {
    } else {
      Permission.storage.request();
    }
  }

  @override
  void initState() {
    getPermission();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/bgdark.jpg'), fit: BoxFit.cover),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: 20,
            ),
            new Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image(
                  image: AssetImage("assets/logo.png"),
                  width: 170,
                  height: 170,
                  alignment: Alignment.center,
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            new Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 5.0, bottom: 3.0),
                  child: new Text(
                    "SmartyX",
                    style: new TextStyle(fontSize: 50.0, color: Colors.white),
                  ),
                )
              ],
            ),
            new Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 2.0, bottom: 20.0),
                  child: new Text(
                    "AI Solutions",
                    style: new TextStyle(fontSize: 28.0, color: Colors.white),
                  ),
                )
              ],
            ),
            new Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 20.0, right: 20.0, top: 10.0),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => InputPage(),
                            ));
                      },
                      child: new Container(
                          alignment: Alignment.center,
                          height: 60.0,
                          width: 50.0,
                          decoration: new BoxDecoration(
                              color: Color(0xFF16B0C4).withOpacity(0.7),
                              borderRadius: new BorderRadius.circular(30.0)),
                          child: new Text("Extract",
                              style: new TextStyle(
                                  fontSize: 20.0, color: Colors.white))),
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 6,
            ),
            new Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 20.0, right: 3.0, top: 10.0),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => loginScreen(),
                            ));
                      },
                      child: new Container(
                          alignment: Alignment.center,
                          height: 60.0,
                          decoration: new BoxDecoration(
                              color: Color(0xFF16B0C4).withOpacity(0.7),
                              borderRadius: new BorderRadius.circular(27.0)),
                          child: new Text("Login",
                              style: new TextStyle(
                                  fontSize: 20.0, color: Colors.white))),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 8.0, right: 20.0, top: 10.0),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => loginScreen(),
                            ));
                      },
                      child: new Container(
                          alignment: Alignment.center,
                          height: 60.0,
                          decoration: new BoxDecoration(
                              color: Color(0xFF16B0C4).withOpacity(0.7),
                              borderRadius: new BorderRadius.circular(27.0)),
                          child: new Text("Trial",
                              style: new TextStyle(
                                  fontSize: 20.0, color: Colors.white))),
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
