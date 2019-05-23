import 'package:flutter/material.dart';

class PageIndicator extends StatefulWidget {
  final PageController controller;
  final int count;

  PageIndicator({Key key, @required this.controller, @required this.count}) : super();

  @override
  PageIndicatorState createState() => PageIndicatorState();
}

class PageIndicatorState extends State<PageIndicator> {
  int _page = 0;

  @override
  void initState() {
    widget.controller.addListener(() {
      print(
          "controller listener in page indicator, page is ${widget.controller.page}");
      if (_page != widget.controller.page && widget.controller.page % 1.0 == 0) {
        setState(() {
          _page = widget.controller.page.floor();
        });
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print("num pages $num");

    var indicators = List<Widget>();
    for (int i = 0; i < widget.count; i++) {
      indicators.add(new Expanded(
        child: Padding(
          padding: EdgeInsets.fromLTRB(4.0, 0, 4.0, 0),
          child: Container(
            color: _getPageSelectorColor(i <= _page),
            height: 4,
          ),
        ),
      ));
    }

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
      ]..addAll(indicators),
    );
  }

  _getPageSelectorColor(bool selected) {
    if (selected) return Colors.white;
    return Colors.white12;
  }

  void onPageChanged(int page) {
    setState(() {
      _page = page;
    });
  }
}
