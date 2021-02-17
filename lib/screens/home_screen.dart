import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Padding(
      padding: EdgeInsets.all(15),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              child: Row(
                children: [
                  Text(
                    '주차',
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  ButtonTheme(
                    minWidth: 5,
                    height: 20,
                    child: RaisedButton(
                      onPressed: showPicker,
                      color: Colors.white30,
                    ),
                  ),
                ],
              ),
            ),
            Container(
                decoration: BoxDecoration(
                  color: Color(0xFFF8BBD0),
                  borderRadius: BorderRadius.all(
                    Radius.circular(5),
                  ),
                ),
                child: Center(
                  child: Text(
                    '출산예정일, 디데이',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )),
            Container(
              child: Center(
                child: Text(
                  '엄마이름',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: Color(0xFFF8BBD0),
                borderRadius: BorderRadius.all(
                  Radius.circular(5),
                ),
              ),
              child: Center(
                child: Text(
                  '태명',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: Stack(
                children: [
                  InkWell(
                    onTap: () {
                      print('캐릭터');
                    },
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.network(
                          'https://images.unsplash.com/photo-1496174742515-d2146dcf8e80?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MjF8fGN1dGV8ZW58MHx8MHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60'),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 0.6 * height),
                    child: Center(
                      child: Container(
                        width: 80,
                        height: 80,
                        child: RaisedButton(
                          onPressed: () {
                            print('녹음버튼');
                          },
                          color: Color(0xFFF48FB1),
                          child: Center(
                            child: Text(
                              '녹음',
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  int selectedValue;
  showPicker() {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: 150,
          child: CupertinoPicker(
            backgroundColor: Colors.white,
            onSelectedItemChanged: (value) {
              setState(() {
                selectedValue = value;
                print('$selectedValue');
              });
            },
            itemExtent: 35.0,
            children: const [
              Text('주차선택'),
              Text('주차선택'),
              Text('주차선택'),
              Text('주차선택'),
              Text('주차선택'),
              Text('주차선택'),
              Text('주차선택'),
            ],
          ),
        );
      },
    );
  }
}
