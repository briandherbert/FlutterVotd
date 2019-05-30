import 'package:flutter/material.dart';

import 'moment_widget.dart';
import 'package:flutter_app/ui/video_player.dart';
import 'package:flutter_app/constants.dart';

class VideoMomentState extends MomentState {
  final formController = TextEditingController();

  @override
  String getName() {
    return "Video";
  }

  @override
  double getTopPadding() {
    return 0.0;
  }

  @override
  Widget getContent() {
    return Center(
        // Fortunately, this diplays a thumbnail
        child: VideoPlayerScreen(url: Constants.getImageUrl(widget.moment.content.url))
        //Image.network(Constants.getImageUrl(widget.moment.content.image), fit: BoxFit.fill));
    );
  }

}
