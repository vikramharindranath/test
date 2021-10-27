import 'package:flutter/material.dart';
import 'package:smartyx_receipts/input.dart';

class loginScreen extends StatefulWidget {
  const loginScreen({Key? key}) : super(key: key);

  @override
  _loginScreenState createState() => _loginScreenState();
}

class _loginScreenState extends State<loginScreen> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        body: Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/bgdark.jpg'), fit: BoxFit.cover),
      ),
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: <
          Widget>[
        SizedBox(
          height: 20,
        ),
        new Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image(
              image: AssetImage("assets/logo.png"),
              width: 120,
              height: 120,
              alignment: Alignment.center,
            ),
          ],
        ),
        SizedBox(
          height: 30,
        ),
        new Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 5.0, bottom: 3.0),
              child: new Text(
                "Login Screen",
                style: new TextStyle(
                  fontSize: 40.0,
                  color: Colors.white,
                  fontFamily: 'Montserrat',
                ),
              ),
            )
          ],
        ),
        SizedBox(
          height: 30,
        ),
        new Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: Padding(
                padding:
                    const EdgeInsets.only(left: 20.0, right: 20.0, top: 10.0),
                child: GestureDetector(
                    onTap: () {},
                    child: new TextField(
                      textAlign: TextAlign.center,
                      obscureText: false,
                      keyboardType: TextInputType.text,
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Color(0xFF16B0C4).withOpacity(0.7),
                                width: 5.0),
                            borderRadius: const BorderRadius.all(
                                const Radius.circular(20.0))),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Color(0xFF16B0C4).withOpacity(0.7),
                                width: 5.0),
                            borderRadius: const BorderRadius.all(
                                const Radius.circular(20.0))),
                        hintText: "UserName",
                        hintStyle: new TextStyle(
                          fontFamily: 'Cairo',
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.normal,
                          color: Colors.white,
                        ),
                      ),
                    )),
              ),
            )
          ],
        ),
        SizedBox(
          height: 10,
        ),
        new Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: Padding(
                padding:
                    const EdgeInsets.only(left: 20.0, right: 20.0, top: 10.0),
                child: GestureDetector(
                    onTap: () {},
                    child: new TextField(
                      textAlign: TextAlign.center,
                      obscureText: true,
                      keyboardType: TextInputType.text,
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Color(0xFF16B0C4).withOpacity(0.7),
                                width: 5.0),
                            borderRadius: const BorderRadius.all(
                                const Radius.circular(20.0))),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Color(0xFF16B0C4).withOpacity(0.7),
                                width: 5.0),
                            borderRadius: const BorderRadius.all(
                                const Radius.circular(20.0))),
                        hintText: "Password",
                        hintStyle: new TextStyle(
                          fontFamily: 'Cairo',
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.normal,
                          color: Colors.white,
                        ),
                      ),
                    )),
              ),
            )
          ],
        ),
        SizedBox(
          height: 20,
        ),
        Container(
          alignment: Alignment.center,
          padding: EdgeInsets.only(top: 5.0),
          child: InkWell(
            child: Text(
              'Forgot Password ?',
              style: TextStyle(
                fontSize: 15.0,
                color: Colors.white.withOpacity(0.8),
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.bold,
                fontFamily: 'Montserrat',
              ),
            ),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        new Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: Padding(
                padding:
                    const EdgeInsets.only(left: 20.0, right: 20.0, top: 10.0),
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
                      child: new Text("Login",
                          style: new TextStyle(
                              fontStyle: FontStyle.italic,
                              fontSize: 20.0,
                              color: Colors.white))),
                ),
              ),
            )
          ],
        ),
        SizedBox(
          height: 18,
        ),
        Container(
          alignment: Alignment.center,
          padding: EdgeInsets.only(top: 5.0),
          child: InkWell(
            child: Text(
              'If you do not have an account and wish to join SmartyX ,',
              style: TextStyle(
                fontSize: 15.0,
                color: Colors.white.withOpacity(0.8),
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.bold,
                fontFamily: 'Montserrat',
              ),
            ),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          alignment: Alignment.center,
          padding: EdgeInsets.only(top: 5.0),
          child: InkWell(
            child: Text(
              'Register here',
              style: TextStyle(
                fontSize: 15.0,
                color: Colors.white.withOpacity(0.8),
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.bold,
                fontFamily: 'Montserrat',
              ),
            ),
          ),
        ),
      ]),
    ));
  }
}
