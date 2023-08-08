import 'package:better_player_example/pages/normal_player_page.dart';
import 'package:flutter/material.dart';

class PlayerPageWidget extends StatefulWidget {
  const PlayerPageWidget({Key? key}) : super(key: key);

  @override
  State<PlayerPageWidget> createState() => _PlayerPageWidgetState();
}

class _PlayerPageWidgetState extends State<PlayerPageWidget> {
  TextEditingController textEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Btter player testing"),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: textEditingController,
              decoration: InputDecoration(hintText: "Enter m3u8 video link"),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).push<void>(
                MaterialPageRoute(
                  builder: (context) => NormalPlayerPage(
                    videoLink: textEditingController.text,
                  ),
                ),
              );
            },
            child: Text("Submit"),
          ),
        ],
      ),
    );
  }
}
