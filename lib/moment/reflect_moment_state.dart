import 'package:flutter/material.dart';
import 'package:flutter_app/ui/utils.dart';

import 'moment_widget.dart';

class ReflectMomentState extends MomentState {
  final formController = TextEditingController();

  @override
  String getName() {
    return "Reflect";
  }

  @override
  Widget getContent() {
    return Center(
        child: Padding(
      padding: const EdgeInsets.all(20.0),
      child: Card(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(28.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: GestureDetector(
                  onTap: () {
                    print("text context ${formController.text}");
                  },
                  child: Text(
                    // Title
                    widget.moment.content.prompt,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                ),
              ),
              AspectRatio(
                aspectRatio: 1.0,
                child: Container(
                  decoration: new BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: Color.fromARGB(255, 240, 240, 240)),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: TextField(
                      // Text input
                      controller: formController,
                      //autofocus: true,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Write your response here1.'),
                      onEditingComplete: () {
                        Utils.dismissKeyboard(context);
                      },
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    ));
  }
}
