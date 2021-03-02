import 'package:flutter/material.dart';

class BabyCard extends StatelessWidget {
  final Color cardColor;
  final Function onTap;
  final Widget cardChild;

  BabyCard({this.cardColor, this.onTap, this.cardChild});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        child: cardChild,
        decoration: BoxDecoration(
          color: cardColor,
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
  }
}
// Row(
//   mainAxisAlignment: MainAxisAlignment.center,
//   children: [
//     BabyCard(
//       cardColor: _selected == 1
//           ? Colors.lightBlueAccent
//           : Colors.blueAccent,
//       cardChild: Padding(
//         padding: EdgeInsets.all(10),
//         child: Text(
//           '단태아',
//           style: TextStyle(
//             fontSize: 32,
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//       ),
//       onTap: () {
//         setState(() {
//           _selected = 1;
//         });
//       },
//     ),
//     SizedBox(
//       width: 50,
//     ),
//     BabyCard(
//       cardColor: _selected == 2
//           ? Colors.lightBlueAccent
//           : Colors.blueAccent,
//       cardChild: Padding(
//         padding: EdgeInsets.all(10),
//         child: Text(
//           '다태아',
//           style: TextStyle(
//             fontSize: 32,
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//       ),
//       onTap: () {
//         setState(() {
//           _selected = 2;
//         });
//       },
//     ),
//   ],
// ),
