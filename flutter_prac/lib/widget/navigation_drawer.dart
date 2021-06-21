import 'package:flutter/material.dart';
import 'package:flutter_prac/page/RuleViewerPage.dart';

class NavigationDrawerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Material(
        color: Color.fromRGBO(51, 51, 51, 51),
        child: ListView(
          children: <Widget>[
            const SizedBox(
              height: 48,
            ),
            buildMenuItem(
                text: 'RuleViewer',
                icon: Icons.workspaces,
                onClicked: () => selectedItem(context, 0))
          ],
        ),
      ),
    );
  }
}

Widget buildMenuItem({
  required String text,
  required IconData icon,
  VoidCallback? onClicked,
}) {
  final color = Colors.white;
  final hoverColor = Colors.black54;

  return ListTile(
    leading: Icon(icon, color: color),
    title: Text(text, style: TextStyle(color: color, fontSize: 20)),
    hoverColor: hoverColor,
    onTap: onClicked,
  );
}

void selectedItem(BuildContext context, int index) {
  switch (index) {
    case 0:
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => RuleViewerPage(),
      ));
      break;
  }
}
