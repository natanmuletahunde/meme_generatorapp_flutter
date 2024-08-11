import 'package:flutter/material.dart';
import 'package:my_app/nav_drawer.dart';

class CreatorPage extends StatefulWidget {
  const CreatorPage({super.key});

  @override
  State<CreatorPage> createState() => _CreatorPageState();
}

class _CreatorPageState extends State<CreatorPage> {
  List<String> memeQuotes = [
    "Laughter is the best medicine, except for actual medicine. That's way better.",
    "I'm not saying I'm Batman, but have you ever seen me and Batman in the same room together?",
    "I'm not superstitious, but I am a little stitious.",
    "I'm not saying I'm a princess, but if the crown fits...",
    "I'm not saying I'm a superhero, but have you ever seen me and Superman in the same room?",
    "I'm not saying I'm a genius, but have you ever seen me and Albert Einstein in the same room?",
    "I'm not saying I'm a time traveler, but have you ever seen me and Doctor Who in the same room?",
    "I'm not saying I'm a wizard, but have you ever seen me and Gandalf in the same room?",
    "I'm not saying I'm a pirate, but have you ever seen me and Captain Jack Sparrow in the same room?",
    "I'm not saying I'm a superhero, but have you ever seen me and Iron Man in the same room?"
  ];

  String? customQuote;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Create your Meme',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.indigo,
        centerTitle: true,
      ),
      drawer: const NavDrawer(
        selected: DrawerSelection.creator,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: memeQuotes.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Card(
                    elevation: 4,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                        memeQuotes[index],
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              decoration: const InputDecoration(
                hintText: 'Enter your own quote',
                border: OutlineInputBorder(),
                contentPadding: EdgeInsets.all(16.0),
              ),
              onChanged: (value) {
                setState(() {
                  customQuote = value;
                });
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: () {
                // Add logic to create meme with selected quote and image
                if (customQuote != null && customQuote!.isNotEmpty) {
                  // Create meme with custom quote
                  _createMeme(customQuote!);
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.indigo,
              ),
              child: const Text(
                'Create Meme',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  void _createMeme(String quote) {
    // Add your logic to create the meme with the custom quote here
    print('Creating meme with quote: $quote');
  }
}