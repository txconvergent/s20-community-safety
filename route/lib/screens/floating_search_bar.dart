import 'package:floating_search_bar/floating_search_bar.dart';
import 'package:flutter/material.dart';

class FloatingAppBar extends StatelessWidget with PreferredSizeWidget{
  Widget build(BuildContext context) {
        return (FloatingSearchBar(
          trailing: CircleAvatar(
            child: Text("AA"), //account initials possible?
          ),
          drawer: Drawer(
            child: Container(color: Colors.white),
          ),
          onChanged: (String value) {},
          onTap: () {},
          decoration: InputDecoration.collapsed(
            hintText: "Search...",
          ),
          children: [
          ],
        ));
      }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}