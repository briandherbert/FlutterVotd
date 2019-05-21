import 'package:flutter/material.dart';

import 'moment_widget.dart';

class ImageMomentState extends MomentState {
  @override
  String getName() {
    return "Image";
  }

  @override
  Widget getContent() {
    return Center(
        child: Image.network(Constants.getImageUrl(widget.moment.content.image),
            fit: BoxFit.fill));
  }
}
