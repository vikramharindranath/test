import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:smartyx_receipts/output_api_model_main.dart';
import 'package:smartyx_receipts/output_api_model_results.dart';
import 'package:http/http.dart' as http;
import 'package:smartyx_receipts/storage_page.dart';

class PrintingResultsPage extends StatefulWidget {
  const PrintingResultsPage({Key? key}) : super(key: key);

  @override
  _PrintingResultsPageState createState() => _PrintingResultsPageState();
}

class _PrintingResultsPageState extends State<PrintingResultsPage> {
  String? stringResponse;
  //GetResult2Class _respJson = GetResult2Class(results: []);
  int _code = 0;
  TextEditingController nameController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController itemsController = TextEditingController();
  TextEditingController dateController = TextEditingController();

  Future fetchResult() async {
    //final response = await http.get(Uri.parse("http://localhost:3000/results"),
    //headers: <String, String>{'Content-type': 'application/json'});

    var response = {};
    response["id"] = 1;
    response["name"] = "bft Tankstelle";
    response["price"] = 9.53;
    response["date"] = "2021-05-31 14:56:00";
    response["items"] = "SUPER PLUS";

    var strj = json.encode(response);
    var str = '[' + strj + ']';
    print(str);
    print(str.substring(1, str.length - 1));
    var modjson = str.substring(1, str.length - 1);
    //if (response.statusCode == 200) {
    //var newJson = response.toString();

    dynamic getJson = jsonDecode(modjson);
    print(getJson);

    Welcome getResult = Welcome.fromJson(getJson);
    setState(() {
      //var mapResponse = json.decode(response.body);
      //var dataResponse = mapResponse['results'];

      //_resultrespJson = jsonDecode(_respJson);
      //_code = response.statusCode;
      nameController.text = getResult.name.toString();
      priceController.text = getResult.price.toString();
      itemsController.text = getResult.items.toString();
      dateController.text = getResult.date.toString();
    });
    //} else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    // throw Exception('Failed to load album');
    //} //toast msg
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/bgdark.jpg'), fit: BoxFit.cover),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                new Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 110.0, right: 110.0, top: 10.0),
                        child: GestureDetector(
                          onTap: () {
                            fetchResult();
                            //Navigator.push(
                            //context,
                            //MaterialPageRoute(
                            //builder: (context) => ();
                            //));
                          },
                          child: new Container(
                              alignment: Alignment.center,
                              height: 50.0,
                              width: 10.0,
                              decoration: new BoxDecoration(
                                  color: Color(0xFF16B0C4).withOpacity(0.7),
                                  borderRadius:
                                      new BorderRadius.circular(30.0)),
                              child: new Text("Fetch Result",
                                  style: new TextStyle(
                                      fontSize: 20.0, color: Colors.white))),
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 35,
                ),
                //if (_code == 200)
                Column(
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
                          width: 140,
                          height: 120,
                          alignment: Alignment.center,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Container(
                      alignment: Alignment.topLeft,
                      padding: EdgeInsets.only(left: 30.0),
                      child: InkWell(
                        child: Text(
                          'Name of the Organisation',
                          style: TextStyle(
                            fontSize: 18.0,
                            color: Colors.white.withOpacity(0.8),
                            fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Montserrat',
                          ),
                        ),
                      ),
                    ),
                    new Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(
                                left: 20.0, right: 20.0, top: 10.0),
                            child: GestureDetector(
                                onTap: () {},
                                child: new TextField(
                                  controller: nameController,
                                  textAlign: TextAlign.center,
                                  obscureText: false,
                                  keyboardType: TextInputType.text,
                                  style: TextStyle(color: Colors.white),
                                  decoration: InputDecoration(
                                    focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Color(0xFF16B0C4)
                                                .withOpacity(0.7),
                                            width: 5.0),
                                        borderRadius: const BorderRadius.all(
                                            const Radius.circular(20.0))),
                                    enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Color(0xFF16B0C4)
                                                .withOpacity(0.7),
                                            width: 5.0),
                                        borderRadius: const BorderRadius.all(
                                            const Radius.circular(20.0))),
                                    //hintText: "Markt",
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
                      height: 15,
                    ),
                    Container(
                      alignment: Alignment.topLeft,
                      padding: EdgeInsets.only(left: 30.0),
                      child: InkWell(
                        child: Text(
                          'Price',
                          style: TextStyle(
                            fontSize: 18.0,
                            color: Colors.white.withOpacity(0.8),
                            fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Montserrat',
                          ),
                        ),
                      ),
                    ),
                    new Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(
                                left: 20.0, right: 20.0, top: 10.0),
                            child: GestureDetector(
                                onTap: () {},
                                child: new TextField(
                                  controller: priceController,
                                  textAlign: TextAlign.center,
                                  keyboardType: TextInputType.number,
                                  obscureText: false,
                                  style: TextStyle(color: Colors.white),
                                  decoration: InputDecoration(
                                    focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Color(0xFF16B0C4)
                                                .withOpacity(0.7),
                                            width: 5.0),
                                        borderRadius: const BorderRadius.all(
                                            const Radius.circular(20.0))),
                                    enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Color(0xFF16B0C4)
                                                .withOpacity(0.7),
                                            width: 5.0),
                                        borderRadius: const BorderRadius.all(
                                            const Radius.circular(20.0))),
                                    //hintText: priceController.text,
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
                      height: 15,
                    ),
                    Container(
                      alignment: Alignment.topLeft,
                      padding: EdgeInsets.only(left: 30.0),
                      child: InkWell(
                        child: Text(
                          'Items Purchased',
                          style: TextStyle(
                            fontSize: 18.0,
                            color: Colors.white.withOpacity(0.8),
                            fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Montserrat',
                          ),
                        ),
                      ),
                    ),
                    new Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(
                                left: 20.0, right: 20.0, top: 10.0),
                            child: GestureDetector(
                                onTap: () {},
                                child: new TextField(
                                  controller: itemsController,
                                  textAlign: TextAlign.center,
                                  obscureText: false,
                                  keyboardType: TextInputType.text,
                                  style: TextStyle(color: Colors.white),
                                  decoration: InputDecoration(
                                      focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Color(0xFF16B0C4)
                                                  .withOpacity(0.7),
                                              width: 5.0),
                                          borderRadius: const BorderRadius.all(
                                              const Radius.circular(20.0))),
                                      enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Color(0xFF16B0C4)
                                                  .withOpacity(0.7),
                                              width: 5.0),
                                          borderRadius: const BorderRadius.all(
                                              const Radius.circular(20.0))),
                                      //hintText: itemsController.text,
                                      hintStyle: new TextStyle(
                                        fontFamily: 'Cairo',
                                        fontStyle: FontStyle.italic,
                                        fontWeight: FontWeight.normal,
                                        color: Colors.white,
                                      )),
                                )),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Container(
                      alignment: Alignment.topLeft,
                      padding: EdgeInsets.only(left: 30.0),
                      child: InkWell(
                        child: Text(
                          'Date of Purchase',
                          style: TextStyle(
                            fontSize: 18.0,
                            color: Colors.white.withOpacity(0.8),
                            fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Montserrat',
                          ),
                        ),
                      ),
                    ),
                    new Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(
                                left: 20.0, right: 20.0, top: 10.0),
                            child: GestureDetector(
                                onTap: () {},
                                child: new TextField(
                                  controller: dateController,
                                  textAlign: TextAlign.center,
                                  keyboardType: TextInputType.text,
                                  obscureText: false,
                                  style: TextStyle(color: Colors.white),
                                  decoration: InputDecoration(
                                      focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Color(0xFF16B0C4)
                                                  .withOpacity(0.7),
                                              width: 5.0),
                                          borderRadius: const BorderRadius.all(
                                              const Radius.circular(20.0))),
                                      enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Color(0xFF16B0C4)
                                                  .withOpacity(0.7),
                                              width: 5.0),
                                          borderRadius: const BorderRadius.all(
                                              const Radius.circular(20.0))),
                                      //hintText: dateController.text,
                                      hintStyle: new TextStyle(
                                        fontFamily: 'Cairo',
                                        fontStyle: FontStyle.italic,
                                        fontWeight: FontWeight.normal,
                                        color: Colors.white,
                                      )),
                                )),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    new Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(
                                left: 60.0, right: 60.0, top: 10.0),
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => StoragePage(),
                                    ));
                              },
                              child: new Container(
                                  alignment: Alignment.center,
                                  height: 60.0,
                                  width: 50.0,
                                  decoration: new BoxDecoration(
                                      color: Color(0xFF16B0C4).withOpacity(0.7),
                                      borderRadius:
                                          new BorderRadius.circular(30.0)),
                                  child: new Text("Save changes",
                                      style: new TextStyle(
                                          fontSize: 20.0,
                                          color: Colors.white))),
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ],
            )));
  }
}
