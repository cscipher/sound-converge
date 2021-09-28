import 'package:day_night_switcher/day_night_switcher.dart';
import 'package:flutter/material.dart';
import 'package:soundconverge/models/chat.model.dart';
import 'package:soundconverge/models/chatData.dart';
import 'package:soundconverge/screens/widgets/hamburgerMenu.dart';
import 'package:soundconverge/screens/widgets/chatListView.dart';
import 'package:soundconverge/services/bot.service.dart';
import 'package:soundconverge/services/deepLink.dart';
import 'package:soundconverge/theme/themes.dart';

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
  var _icon = Icons.mode_night;

  void reqFocus() => FocusScope.of(context).requestFocus(_focusNode);
  void removeFocus() => FocusScope.of(context).unfocus();

  scrollToBottom() {
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      final bottomOffset = _scrollController.position.maxScrollExtent;
      _scrollController.animateTo(
        bottomOffset,
        duration: Duration(milliseconds: 150),
        curve: Curves.easeInOut,
      );
    });
  }

  showSnackBar(String msg) =>
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(msg)));

  _convo() async {
    setState(() {
      _chatData.add(BotChat(message: umsg));
      _controller.clear();
    });
    scrollToBottom();
    try {
      BotChat resp = await querySong(umsg);
      setState(() {
        _chatData.add(resp);
      });
    } on Exception catch (e) {
      // showSnackBar(e.toString());
      print(e);
      final errTxt = BotChat(
          message:
              'Something went wrong. Please check your internet connection or try again later! 🤖',
          sid: 'bid',
          rid: 'usr');
      setState(() {
        _chatData.add(errTxt);
      });
    }
    scrollToBottom();
  }

  // init fn
  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    scrollToBottom();
    _controller = TextEditingController();
    _focusNode = FocusNode();
    _focusNode.addListener(() {});
    currentTheme.addListener(() {
      setState(() {});
    });
    setState(() {
      _chatData = [];
      // chatdata;
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: theme.backgroundColor,
      drawer: Hamburger(),
      appBar: AppBar(
        iconTheme: theme.iconTheme,
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Text('Zedd - You\'re music finder!',
            style: TextStyle(color: theme.textTheme.headline1!.color)),
        actions: [
          IconButton(
              tooltip: 'Theme switch',
              onPressed: () {
                currentTheme.toggleTheme();
                setState(() {
                  _icon == Icons.wb_sunny
                      ? _icon = Icons.mode_night
                      : _icon = Icons.wb_sunny;
                });
              },
              icon: Icon(_icon))
        ],
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
                  botChatList(size, _chatData, theme),
                  SizedBox(height: 5),
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
                            color: Colors.grey.withAlpha(30),
                            borderRadius: BorderRadius.circular(35),
                          ),
                          child: TextField(
                            cursorColor: theme.primaryColor,
                            style: TextStyle(
                                color: theme.textTheme.headline1!.color),
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
                              hintStyle: TextStyle(
                                  color: theme.textTheme.headline1!.color!
                                      .withAlpha(130)),
                              hintText: 'Search any song',
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                  borderSide: BorderSide(
                                      color: Colors.grey.withAlpha(80))),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                  borderSide: BorderSide(
                                      color: Colors.grey.withAlpha(80))),
                              contentPadding: EdgeInsets.fromLTRB(20, 0, 0, 10),
                            ),
                          ),
                        ),
                      ),
                      IconButton(
                          icon: Icon(Icons.send, color: theme.primaryColor),
                          onPressed:
                              _controller.text.isEmpty ? null : () => _convo()),
                    ],
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
