import 'package:flutter/material.dart';

class PageIndicator extends StatefulWidget {
  final PageController controller;
  final int count;
  static final double _height = 3;

  PageIndicator({Key key, @required this.controller, @required this.count})
      : super();

  @override
  PageIndicatorState createState() => PageIndicatorState();
}

class PageIndicatorState extends State<PageIndicator> {
  int _page = 0;

  void controllerListener() {
    if (_page != widget.controller.page && widget.controller.page % 1.0 == 0) {
      setState(() {
        _page = widget.controller.page.floor();
      });
    }
  }
  
  VoidCallback _callback;

  @override
  void initState() {
    _callback = controllerListener;

    print("init page indicator, listener ");
    widget.controller.addListener(_callback);
    super.initState();
  }

  @override
  void dispose() {
    widget.controller.removeListener(_callback);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    widget.controller.addListener(() {
      //print("controller listener in page indicator, page is ${widget.controller.page}");
      int newPage = (widget.controller.page + .5).floor();
      if (_page != newPage) {
        setState(() {
          _page = newPage;
        });
      }
    });

    var indicators = List<Widget>();
    for (int i = 0; i < widget.count; i++) {
      indicators.add(new Expanded(
        child: Padding(
          padding: EdgeInsets.fromLTRB(
              PageIndicator._height, 0, PageIndicator._height, 0),
          child: Container(
            color: _getPageSelectorColor(i <= _page),
            height: PageIndicator._height,
          ),
        ),
      ));
    }

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[]..addAll(indicators),
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
