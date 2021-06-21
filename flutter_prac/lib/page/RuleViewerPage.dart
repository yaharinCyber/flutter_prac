import 'package:flutter/material.dart';
import 'package:flutter_prac/widget/RuleViewerform.dart';

class RuleViewerPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
        //drawer: NavigationDrawerWidget(),
        appBar: AppBar(
          title: Text('Rule Viewer'),
          centerTitle: true,
          backgroundColor: Color.fromRGBO(51, 51, 51, 51),
        ),
        body: RuleViewerForm(),
      );
}
