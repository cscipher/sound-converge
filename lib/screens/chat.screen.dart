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
  late List<BotChat> _chatData;
  late FocusNode _focusNode;
  late ScrollController _scrollController;
  String umsg = '';

  void reqFocus() => FocusScope.of(context).requestFocus(_focusNode);
  void removeFocus() => FocusScope.of(context).unfocus();
  scrollToBottom() {
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      final bottomOffset = _scrollController.position.maxScrollExtent;
      _scrollController.animateTo(
        bottomOffset,
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    });
  }

  // init fn
  @override
  void initState() {
    _scrollController = ScrollController();
    scrollToBottom();
    _controller = TextEditingController();
    _focusNode = FocusNode();
    _focusNode.addListener(() {});

    setState(() {
      _chatData = chatdata;
    });
    super.initState();
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
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
            Text(
              'Zedd - You\'e music finder!',
              style: TextStyle(fontSize: 16),
            ),
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
            Expanded(
                child: SingleChildScrollView(
              controller: _scrollController,
              physics: ScrollPhysics(),
              child: Column(
                children: [
                  SizedBox(height: 20),
                  botChatList(size, _chatData),
                ],
              ),
            )),
            Container(
              alignment: Alignment.bottomCenter,
              height: 60,
              child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            color: primaryColor.withAlpha(140),
                            borderRadius: BorderRadius.circular(35),
                          ),
                          child: TextField(
                            onTap: () => reqFocus(),
                            focusNode: _focusNode,
                            controller: _controller,
                            onChanged: (String val) {
                              setState(() {
                                umsg = val;
                              });
                            },
                            onEditingComplete: () {
                              setState(() {
                                umsg = _controller.text;
                              });
                            },
                            onSubmitted: (String val) {
                              setState(() {
                                umsg = val;
                              });
                              removeFocus();
                            },
                            decoration: InputDecoration(
                              hintStyle: TextStyle(fontSize: 13, color: white),
                              hintText: 'Search any song',
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.all(20),
                            ),
                          ),
                        ),
                      ),
                      IconButton(
                        icon: Icon(Icons.send, color: primaryColor),
                        onPressed: _controller.text.isEmpty
                            ? null
                            : () {
                                setState(() {
                                  _chatData.add(BotChat(message: umsg));
                                  _controller.clear();
                                });
                                scrollToBottom();
                              },
                      ),
                    ],
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
