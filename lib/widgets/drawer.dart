import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';




class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    const imageUrl =
     "https://i.pinimg.com/736x/73/bb/e7/73bbe73b3e8fc0f3e8f2076b23665aaf.jpg";
   
    
    return  Drawer(
      child: Container(
        color: Colors.deepPurple,
        child: ListView(
          padding: EdgeInsets.zero,
          // ignore: prefer_const_literals_to_create_immutables
          children: [
              const DrawerHeader(
              padding: EdgeInsets.zero,
              child: UserAccountsDrawerHeader(
                margin: EdgeInsets.zero,
                accountName:  Text("Lê Quí Long"),
                accountEmail:  Text("lequilong2000@gmail.com"),
                currentAccountPicture: CircleAvatar(
                  backgroundImage: NetworkImage(imageUrl),
                ),
              ),
            ),
            const ListTile(
              leading: 
                Icon(
                  CupertinoIcons.home,
                  color : Colors.white
                  ),
              title: Text(
                  "Home",
                  textScaleFactor: 1.2,
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
            ),

            const ListTile(
              leading: 
                Icon(
                  CupertinoIcons.profile_circled,
                  color : Colors.white
                  ),
              title: Text(
                  "Profile",
                  textScaleFactor: 1.2,
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
            ),

            const ListTile(
              leading: 
                Icon(
                  CupertinoIcons.mail,
                  color : Colors.white
                  ),
              title: Text(
                  "Email",
                  textScaleFactor: 1.2,
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
            ),

            const ListTile(
              leading: 
                Icon(
                  CupertinoIcons.phone,
                  color : Colors.white
                  ),
              title: Text(
                  "Phone",
                  textScaleFactor: 1.2,
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
            ),


          ],
        ),
      ),
    );
  }
}