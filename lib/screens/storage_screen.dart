import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StorageScreen extends StatefulWidget {
  @override
  _StorageScreenState createState() => _StorageScreenState();
}

class _StorageScreenState extends State<StorageScreen> {
  final _formKey = GlobalKey<FormState>();

  final myController = TextEditingController();

  // final Size size = MediaQuery.of(context).size;
  var folders = [];

  @override
  Widget build(BuildContext context) {
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
                Container(
                  child: Text(
                    '저장소',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                Row(
                  children: [
                    FlatButton(
                      color: Colors.white,
                      onPressed: () {},
                      child: Text(
                        '검색',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    FlatButton(
                      color: Colors.white,
                      onPressed: () {
                        folders.clear();
                        setState(() {});
                      },
                      child: Text(
                        '편집',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    bottom: 8,
                  ),
                  child: Container(
                    child: ListTile(
                      onTap: () {},
                      title: Text(
                        '모든 녹음 항목',
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w500),
                      ),
                      trailing: Text(
                        '194개',
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                ),
                Container(
                  child: ListTile(
                    onTap: () {},
                    title: Text(
                      '카테고리',
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                    ),
                    trailing: Text(
                      '194개',
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
                // Container(
                //   child: ListView.builder(
                //     itemBuilder: (context, index) {
                //       return ListTile(leading: folders[index]);
                //     },
                //     itemCount: folders.length,
                //   ),
                // ),
              ],
            ),
          ),
          Container(
            child: ListTile(
              onTap: () {
                showDialog(
                    context: context,
                    builder: (_) => CupertinoAlertDialog(
                          title: Text(
                            '폴더추가',
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.w500),
                          ),
                          content: Form(
                            key: _formKey,
                            child: SizedBox(
                              width: 100,
                              height: 100,
                              child: TextFormField(
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return '이름을 입력해 주세요.';
                                  } else {
                                    return null;
                                  }
                                },
                                decoration: InputDecoration(
                                    border: InputBorder.none, hintText: '폴더 추가', labelText: '폴더 추가'),
                              ),
                            ),
                          ),
                          actions: [
                            CupertinoDialogAction(
                              child: Text(
                                '취소',
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w700,
                                    color: Color.fromARGB(255, 255, 169, 169)),
                              ),
                            ),
                            CupertinoDialogAction(
                              onPressed: () {
                                if(_formKey.currentState.validate()) {
                                  Scaffold.of(context).showSnackBar(SnackBar(content: Text('Processing Data')));
                                }
                              },
                              child: Text(
                                '확인',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700,
                                  color: Color.fromARGB(255, 255, 169, 169),
                                ),
                              ),
                            ),
                          ],
                        ));
              },
              title: Text('+ 카테고리 추가',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
            ),
          ),
        ],
      ),
    );
  }
}
