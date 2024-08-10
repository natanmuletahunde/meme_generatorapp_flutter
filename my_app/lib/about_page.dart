import 'package:flutter/material.dart';
import 'package:my_app/nav_drawer.dart';
class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('About',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
        backgroundColor:Colors.indigo,
        centerTitle: true,
      ),
     drawer:const NavDrawer(),
     body: const  Center(child:Text('ABOUT'),),  
    );
  }
}