import 'package:flutter/material.dart';
import 'package:soundconverge/models/chat.model.dart';
import 'package:soundconverge/models/chatData.dart';
import 'package:soundconverge/theme/colors.dart';
import 'package:soundconverge/screens/widgets/chatListView.dart';

class ChatUI extends StatefulWidget {
  const ChatUI({Key? key}) : super(key: key);

  @override
  _ChatUIState createState() => _ChatUIState();
}

class _ChatUIState extends State<ChatUI> {
  // Class Variables
  late TextEditingController _controller;

  // init fn
  @override
  void initState() {
    _controller = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      drawer: Drawer(),
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(),
            Text('Assistant-Zedd'),
            SizedBox(),
            CircleAvatar(
              backgroundColor: white,
            ),
          ],
        ),
      ),
      body: Container(
        child: Column(
          children: [
            Expanded(child: botChatList(size)),
            Container(
              alignment: Alignment.bottomCenter,
              color: primaryColor,
              height: 66,
              child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: Container(
                    decoration: BoxDecoration(
                      color: white.withAlpha(100),
                      borderRadius: BorderRadius.circular(35),
                    ),
                    child: TextField(
                      controller: _controller,
                      decoration: InputDecoration(
                        hintStyle: TextStyle(fontSize: 13, color: white),
                        hintText: 'Search any song  🎵',
                        suffixIcon: IconButton(
                          icon: Icon(Icons.send, color: white),
                          onPressed: _controller.text.isEmpty ? null : () {},
                        ),
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.all(20),
                      ),
                    ),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
