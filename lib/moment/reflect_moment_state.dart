import 'package:flutter/material.dart';
import 'package:flutter_app/ui/utils.dart';

import 'moment_widget.dart';

class ReflectMomentState extends MomentState {
  final formController = TextEditingController();

  @override
  String getName() {
    return "Reflection";
  }

  Widget createButton(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: SizedBox(
        width: double.infinity,
        child: new RaisedButton(
            padding: EdgeInsets.all(10.0),
            child: new Text(
              text,
              style: TextStyle(fontSize: 14),
            ),
            color: Constants.bgColorLight(),
            onPressed: () {
              onButtonPressed();
            },
            elevation: 0,
            textColor: Colors.black,
            shape: new RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(10.0))),
      ),
    );
  }

  void onButtonPressed() {
    widget.pageController
        ?.nextPage(
        duration: Duration(milliseconds: 500), curve: Curves.easeOut);
  }

  @override
  Widget getContent() {
    List<Widget> columnWidgets = new List<Widget>();
    columnWidgets.add(
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
        )
    );

    for (String answer in data.quickOptions) {
      columnWidgets.add(createButton(answer));
    }

    columnWidgets.add(
        Container(
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
                  hintText: 'Write your own response here.'),
              onEditingComplete: () {
                Utils.dismissKeyboard(context);
              },
            ),
          ),
        )
    );

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
                children: columnWidgets,
              ),
            ),
          ),
        ));
  }
}
