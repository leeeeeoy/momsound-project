import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:momsori/screens/birth_screen.dart';

class NicknameScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(),
        body: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              Text(
                '엄마의 이름을 입력해주세요',
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextFormField(
                onChanged: (value) {
                  print(value);
                },
                maxLength: 6,
                decoration: InputDecoration(
                  hintText: '엄마',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(
                height: 0.1 * height,
              ),
              Text(
                '아기의 이름을 입력해주세요',
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextFormField(
                onChanged: (value) {
                  print(value);
                },
                maxLength: 6,
                decoration: InputDecoration(
                  hintText: '우리 아기',
                  border: OutlineInputBorder(),
                ),
              ),
              RaisedButton(
                onPressed: () {
                  Get.to(
                    BirthScreen(),
                    transition: Transition.fadeIn,
                  );
                },
                child: Text('다음'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
