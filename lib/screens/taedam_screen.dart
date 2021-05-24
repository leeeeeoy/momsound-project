import 'package:draggable_scrollbar/draggable_scrollbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:momsori/screens/loading_screen.dart';
import 'package:momsori/widgets/taedam_story.dart';

class TaedamScreen extends StatefulWidget {
  @override
  _TaedamScreenState createState() => _TaedamScreenState();
}

class _TaedamScreenState extends State<TaedamScreen> {
  var _month = 5;
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              Container(
                alignment: Alignment.topLeft,
                child: InkWell(
                  onTap: () {
                    Get.off(() => LoadingScreen());
                  },
                  child: Icon(
                    Icons.arrow_back_ios,
                  ),
                ),
              ),
              Center(
                child: Text(
                  '태담가이드',
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: List.generate(9, (index) => Text("${index + 1}개월")),
                ),
              ),
              SliderTheme(
                data: SliderTheme.of(context).copyWith(
                  inactiveTrackColor: Color(0xFFC4C4C4),
                  activeTrackColor: Color(0xFFC4C4C4),
                  thumbColor: Color(0xFFFFA9A9),
                  overlayColor: Color(0xFFFFA9A9).withOpacity(0.5),
                  thumbShape: RoundSliderThumbShape(enabledThumbRadius: 8),
                  overlayShape: RoundSliderOverlayShape(overlayRadius: 12.0),
                ),
                child: Slider(
                  value: _month.toDouble(),
                  min: 1,
                  max: 9,
                  onChanged: (double newValue) {
                    setState(() {
                      _month = newValue.round();
                    });
                  },
                ),
              ),
              Expanded(
                child: DraggableScrollbar.arrows(
                  controller: _scrollController,
                  alwaysVisibleScrollThumb: true,
                  backgroundColor: Color(0xFFC4C4C4),
                  child: ListView.builder(
                    controller: _scrollController,
                    itemCount: taedamStories[_month].length,
                    itemExtent: 100.0,
                    itemBuilder: (context, index) {
                      return Container(
                        padding: EdgeInsets.all(5.0),
                        child: taedamStories[_month][index],
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
