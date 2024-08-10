import 'package:flutter/material.dart';
import 'package:my_app/Creator_page.dart';
import 'package:my_app/about_page.dart';
import 'package:my_app/home_page.dart';
enum DrawerSelection {home,creator, about} 
class NavDrawer extends StatefulWidget {
  final DrawerSelection selected;
  const NavDrawer({Key? key, required this.selected}) : super(key: key);

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
                selected: widget.selected == DrawerSelection.home,
                selectedColor: Colors.indigo,
                leading: const Icon(Icons.home),
              title:const Text('Meme of the Day'),
              onTap: () {
                Navigator.pushReplacement(context , MaterialPageRoute(builder: (context) => const HomePage()),);
              },
              ),
              ListTile(
              selected: widget.selected == DrawerSelection.creator,
              leading: const Icon(Icons.whatshot),
              title:const Text('Meme creator'),
              onTap: () {
              Navigator.pushReplacement(context , MaterialPageRoute(builder: (context) => const CreatorPage()),);

              },
              ),
              ListTile(
                selected: widget.selected == DrawerSelection.about,
                leading: const Icon(Icons.info),
              title:const Text('About'),
              onTap: () {
                 Navigator.pushReplacement(context , MaterialPageRoute(builder: (context) => const AboutPage()),);

              },
              ),
          ],
         ),
    );
  }
}