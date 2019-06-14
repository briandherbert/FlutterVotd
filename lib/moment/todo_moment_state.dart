import 'package:flutter/material.dart';

import 'moment_widget.dart';

class TodoMomentState extends MomentState {
  final formController = TextEditingController();

  @override
  String getName() {
    return "TODO";
  }

  @override
  Widget getContent() {
    if (!isSettled) {
      return Text("Loading");
    }

    return Center(
        // Fortunately, this diplays a thumbnail
        child: Text("Need to implement type " + widget.moment.type)
        //Image.network(Constants.getImageUrl(widget.moment.content.image), fit: BoxFit.fill));
    );
  }

}
