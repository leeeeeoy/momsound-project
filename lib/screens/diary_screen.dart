import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DiaryScreen extends StatefulWidget {
  @override
  _DiaryScreenState createState() => _DiaryScreenState();
}

class _DiaryScreenState extends State<DiaryScreen> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(15),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
                decoration: BoxDecoration(
                  color: Color(0xFFF8BBD0),
                  borderRadius: BorderRadius.all(
                    Radius.circular(5),
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Center(
                      child: Text(
                        '출산예정일',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Center(
                      child: Text(
                        '디데이',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Center(
                      child: Text(
                        '임신 주차, 일',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Center(
                      child: Text(
                        '오늘날짜',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                )
            ),
            // todo 달력
            Container(
              padding: EdgeInsets.all(10),
              child: InkWell(
                onTap: () {
                  print('달력');
                },
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.network(
                      'https://lh3.googleusercontent.com/proxy/mCQyTDQbifQcPMxNAVJNWTNjW0vn1336C7uiFxdEzpXho0yhobwYgH1gGnm6855aaD4Hc6yTku1Zi2s6LjeuNb0H-NrLtAC7wpwk0qNSJyblDabjBR6Ya7Q-iSjb5torVu_-wzo2z2-q2zZHOiwLtwSi7HrsE1sN2nKdRDwhZw6O06UdD8pEiNLZJd4sm37sQV_Tk-KoErhUC-O2pf-v7uPtUAFupd1IlipLJpLH5ByRMERai3yBz2Povhzg3czHlGSdF89vYzSvRsyn1y1bzXJXrCssj0CyODnc8XRsJAJCYChszcg-AZI'),
                ),
              ),
            )

          ],
        ),
      ),
    );
  }
}
