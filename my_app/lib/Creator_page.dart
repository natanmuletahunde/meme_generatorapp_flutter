import 'package:flutter/material.dart';
import 'package:my_app/nav_drawer.dart';
class CreatorPage extends StatefulWidget {
  const CreatorPage({super.key});

  @override
  State <CreatorPage> createState() =>  CreatorPageState();
}

class  CreatorPageState extends State <CreatorPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text( 'create your Meme',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
        backgroundColor:Colors.indigo,
        centerTitle: true,
      ),
     drawer:const NavDrawer(),
     body: const  Center(child:Text('ABOUT'),),
    );
  }
}