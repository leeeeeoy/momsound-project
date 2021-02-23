import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class StorageScreen extends StatefulWidget {
  @override
  _StorageScreenState createState() => _StorageScreenState();
}

class _StorageScreenState extends State<StorageScreen> {
  var folders = [];

  void flutterToastMessageLongPressed() {
    Fluttertoast.showToast(
      msg: 'long pressed',
      gravity: ToastGravity.CENTER,
      backgroundColor: Colors.redAccent,
      fontSize: 20,
      textColor: Colors.white,
      toastLength: Toast.LENGTH_LONG,
    );
  }

  void flutterToastMessageOnTaped() {
    Fluttertoast.showToast(
      msg: 'on taped',
      gravity: ToastGravity.CENTER,
      backgroundColor: Colors.redAccent,
      fontSize: 20,
      textColor: Colors.white,
      toastLength: Toast.LENGTH_LONG,
    );
  }

  @override
  Widget build(BuildContext context) {
    // final Size size = MediaQuery.of(context).size;

    return Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                RaisedButton(
                  onPressed: () {
                    folders.add(RaisedButton(
                      onPressed: () {},
                      child: Text('test'),
                    ));
                    // folders.add();
                    setState(() {});
                  },
                  child: Text(
                    'new folder',
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                RaisedButton(
                  onPressed: () {},
                  child: Text(
                    'edit',
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            child: Text(
              'Storage',
              style: TextStyle(
                fontSize: 64,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Container(
            child: Text(
              'Total Storage',
              style: TextStyle(
                fontSize: 48,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Container(
            child: ListTile(
              title: Text(
                'title',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.normal,
                ),
              ),
              subtitle: Text('subtitle'),
              dense: true,
              onTap: () {
                flutterToastMessageOnTaped();
              },
              onLongPress: () {
                showDialog(
                    context: context,
                    builder: (_) => CupertinoAlertDialog(
                          title: Text('Long Press'),
                          content: Text('Accept?'),
                          actions: [
                            CupertinoDialogAction(
                              child: Text('yes'),
                            ),
                            CupertinoDialogAction(
                              child: Text('no'),
                            ),
                          ],
                        ));

                // flutterToastMessageLongPressed();
              },
              selected: true,
              trailing: Text('trailing'),
            ),
          ),
          Expanded(
            child: Container(
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return ListTile(leading: folders[index]);
                },
                itemCount: folders.length,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
