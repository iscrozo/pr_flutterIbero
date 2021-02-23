import 'package:flutter/material.dart';

class DrawerOption extends StatelessWidget {
  final String text;
  final Function onTap;
  final Icon addIcon;

  const DrawerOption({Key key, this.text, this.onTap, this.addIcon})
      : super(key: key);

  listTileWidget(asTitle) => ListTile(
        title: Text(asTitle),
        leading: addIcon,
        dense: true,
      );

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(13),
        child: listTileWidget('$text'),
      ),
    );
  }
}
