import 'package:flutter/material.dart';

Drawer CustomDrawer(){
  return Drawer(
    child: ListView(
      children: [
        DrawerHeader(
          padding: EdgeInsets.all(0),
            child: UserAccountsDrawerHeader(
          decoration: BoxDecoration(color: Colors.teal),
          accountName: Text("Nafiur Rahman Sabbir"),
          accountEmail: Text('nafiurrahmansabbir@gmail.com'),
              currentAccountPicture: Padding(
                padding: const EdgeInsets.all(4.0),
                child: Image.asset('assets/images/sabbir_prof.jpg'),
              ),

        )),
        ListTile(
          leading: Icon(Icons.home),
          title: Text("Home",),onTap: (){},
        )
      ],
    ),
  );
}