import 'package:flutter/material.dart';

class RuleViewerForm extends StatefulWidget {
  @override
  RuleViewerFormState createState() {
    return RuleViewerFormState();
  }
}

Widget _Stage(List<DropdownMenuItem<String>> onFirstEvent) {
  return DropdownButton(items: onFirstEvent);
}

class RuleViewerFormState extends State<RuleViewerForm> {
  final _formKey = GlobalKey<FormState>();

  List<DropdownMenuItem<String>> _loadData() {
    List<DropdownMenuItem<String>> onFirstEvent = [];

    onFirstEvent.add(new DropdownMenuItem(
      child: Text('Item No. 1'),
      value: 'value 1',
    ));

    onFirstEvent.add(new DropdownMenuItem(
      child: Text('Item No. 2'),
      value: 'value 2',
    ));

    onFirstEvent.add(new DropdownMenuItem(
      child: Text('Item No. 3'),
      value: 'value 3',
    ));

    return onFirstEvent;
  }

  @override
  Widget build(BuildContext context) {
    List<DropdownMenuItem<String>> onFirstEvent = _loadData();
    return Scaffold(
        body: Container(
            margin: EdgeInsets.all(30),
            child: Form(
              key: _formKey,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[_Stage(onFirstEvent)]),
            )));
  }
}
