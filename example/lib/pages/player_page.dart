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
      appBar: AppBar(),
      body: Column(
        children: [
          TextField(
            controller: textEditingController,
            decoration: InputDecoration(hintText: "Enter m3u8 video link"),
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
