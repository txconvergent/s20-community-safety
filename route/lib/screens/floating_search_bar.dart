import 'package:floating_search_bar/floating_search_bar.dart';
import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:route/components/platform_alert_dialog.dart';
// import 'package:route/services/auth.dart';

class FloatingAppBar extends StatelessWidget with PreferredSizeWidget{
  Widget build(BuildContext context) {
        return (FloatingSearchBar(
          trailing: CircleAvatar(
            child: Text("AA"), //account initials possible?
          ),
          drawer: Drawer(
          ),
          onChanged: (String value) {},
          onTap: () {}, //this will make call to route etc.
          decoration: InputDecoration.collapsed(
            hintText: "Search...",
          ),
          children: [
          ],
        ));
      }
  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  // Future<void> _confirmSignOut(BuildContext context) async {
  //   final bool confirmSignOut = await PlatformAlert(title: 'Logout', content: 'Are you sure you want to sign out?', cancelLabel: 'Cancel', actionLabel: 'Logout').show(context);
  //   if(confirmSignOut) {
  //     _signOut(context);
  //   }
  // }
  // Future<void> _signOut(BuildContext context) async {
  //   try {
  //     await Provider.of<AuthBase>(context).signOut(); 
  //   } catch (e) {
  //      print(e.toString());
  //   }
  // }
}