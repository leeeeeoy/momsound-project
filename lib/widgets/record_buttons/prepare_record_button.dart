import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:momsori/screens/recoder_screen.dart';

Widget prepareRecordButton(BuildContext context) {
  double height = MediaQuery.of(context).size.height;
  return Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Text(
        '아이에게 목소리를 들려주세요',
        style: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
      SizedBox(
        height: 0.05 * height,
      ),
      InkWell(
        onTap: rs.record,
        child: SvgPicture.asset(
          'assets/icons/record_icon.svg',
          height: 0.08 * height,
        ),
      ),
    ],
  );
}

class PrepareRecordButton extends StatelessWidget {
  const PrepareRecordButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          '아이에게 목소리를 들려주세요',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(
          height: 0.05 * height,
        ),
        InkWell(
          onTap: rs.record,
          child: SvgPicture.asset(
            'assets/icons/record_icon.svg',
            height: 0.08 * height,
          ),
        ),
      ],
    );
  }
}
