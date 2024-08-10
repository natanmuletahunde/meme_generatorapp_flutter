import 'package:flutter/material.dart';
class NavDrawer extends StatefulWidget {
  const NavDrawer({super.key});

  @override
  State<NavDrawer> createState() => _NavDrawerState();
}

class _NavDrawerState extends State<NavDrawer> {
  get title => null;

  @override
  Widget build(BuildContext context) {
    return  Drawer(
         child: ListView(
          padding: EdgeInsets.zero,
          children: [
           const  SizedBox(
              height: 88,
              child: DrawerHeader(
                decoration: BoxDecoration(color:Colors.indigo),
                child: Center(
                  child: Text('MENU',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                )),
              ),
              ListTile(
                leading: const Icon(Icons.home),
              title:const Text('Meme of the Day'),
              onTap: () {
                 print('hello home');
              },
              ),
              ListTile(
                leading: const Icon(Icons.home),
              title:const Text('Meme of the Day'),
              onTap: () {
                 print('hello home');
              },
              ),
              ListTile(
                leading: const Icon(Icons.home),
              title:const Text('Meme of the Day'),
              onTap: () {
                 print('hello home');
              },
              ),
          ],
         ),
    );
  }
}