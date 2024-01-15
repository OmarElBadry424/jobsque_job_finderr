import 'package:flutter/material.dart';
import 'package:jobsque/theme/theme_cubit.dart';

import '../Widgets/color.dart';

class DefaultIcon extends StatefulWidget {
  const DefaultIcon({Key? key}) : super(key: key);

  @override
  State<DefaultIcon> createState() => _DefaultIconState();
}

class _DefaultIconState extends State<DefaultIcon> {
  bool isIconPressed = false;
  void changeIcon(){
    setState(() {
      isIconPressed = !isIconPressed;
    });
  }
  @override
  Widget build(BuildContext context) {
    return  IconButton(
        icon: isIconPressed
            ? Icon(Icons.dark_mode,
          color: AppTheme.lightgre,
        ) // Icon to show when pressed
            : Icon(Icons.light_mode,
        color: AppTheme.lightgre,), // Default icon
        onPressed: () {
          changeIcon();
          ThemeCubit.get(context).isDarkTheme;
          ThemeCubit.get(context).changeAppTheme();
        });

  }
}
