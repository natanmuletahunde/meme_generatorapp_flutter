import 'package:flutter/material.dart';
import 'package:my_app/nav_drawer.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Meme of the Day',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
        backgroundColor:Colors.indigo,
        centerTitle: true,
      ),
     drawer:const NavDrawer(selected:DrawerSelection.home ,),
    );
  }
  }
