import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:spotify/common/helpers/is_dark_mode.dart';

class BasicAppBar extends StatelessWidget implements PreferredSizeWidget{
  final Widget ?title;
  final bool hideBack;
  const BasicAppBar({super.key, this.title,  this.hideBack = false});

  @override
  Widget build(BuildContext context) {
    return AppBar (
      title: title ?? Text(""),
        centerTitle: true,
        backgroundColor: Colors.transparent,
      elevation: 0,
      leading: hideBack ? null : IconButton(
          onPressed: (){
            Navigator.pop(context);
          },
          icon: Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              color: context.isDarkMode ? Colors.white.withOpacity(0.03)
                  :  Colors.black.withOpacity(0.04),
              shape: BoxShape.circle
            ),
            child: Icon(
              Icons.arrow_back_ios_new,
              size: 20,
              color: context.isDarkMode ? Colors.white : Colors.black,
            ),
          )
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
