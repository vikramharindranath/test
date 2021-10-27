import 'package:flutter/material.dart';

class StoragePage extends StatefulWidget {
  const StoragePage({Key? key}) : super(key: key);

  @override
  _StoragePageState createState() => _StoragePageState();
}

class _StoragePageState extends State<StoragePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Retrieved Results List',
            //style: TextStyle(color: Colors.black.withOpacity(0.5)),
          ),
          backgroundColor: Color(0xFF16B0C4).withOpacity(0.7),
          foregroundColor: Colors.black,
        ),
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/bgdark.jpg'), fit: BoxFit.cover),
          ),
          child: BuildListView(),
        ));
  }
}

ListView BuildListView() {
  return ListView.builder(
    itemCount: 15,
    itemBuilder: (_, index) {
      return ListTile(
        title: Text(
          'Result : $index',
          style: TextStyle(color: Colors.white),
        ),
        tileColor: Colors.white,
        leading: Icon(
          Icons.info,
          color: Colors.white.withOpacity(0.7),
        ),
        subtitle: Text(
          'Purchased date : ',
          style: TextStyle(color: Colors.white.withOpacity(0.4)),
        ),
        trailing: Icon(
          Icons.open_in_new,
          color: Colors.white.withOpacity(0.7),
        ),
        focusColor: Colors.white.withOpacity(1),
        hoverColor: Colors.white.withOpacity(0.3),
      );
    },
  );
}
