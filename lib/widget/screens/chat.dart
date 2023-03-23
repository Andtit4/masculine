import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat_bubble/chat_bubble.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:masculine/models/message.dart';
import 'package:masculine/models/rdv.model.dart';
import 'package:masculine/services/api.dart';
import 'package:masculine/widget/partials/input.dart';
import 'package:masculine/widget/utils/utils.dart';
import 'package:zego_zimkit/services/services.dart';
import 'package:zego_zimkit/zego_zimkit.dart';

class ChatScreen extends StatefulWidget {
  final String? telephoneuser;
  final RdvModel data;
  const ChatScreen({
    super.key,
    required this.telephoneuser,
    required this.data,
    /*  required this.data */
  });

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  TextEditingController _text = TextEditingController();
  late int tel = 0;

  _connect() async {
    // tel = int.parse(widget.telephoneuser);
    // await ZIMKit().connectUser(id: widget.data.id_rdv.toString());
    print('___Connect_to__ZIM');
    return await Api().getMessageBy(widget.data.id_rdv, widget.telephoneuser);
  }

  @override
  void initState() {
    super.initState();
    _connect();
  }

  @override
  Widget build(BuildContext context) {
    late double width = MediaQuery.of(context).size.width;
    late double height = MediaQuery.of(context).size.height;

    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.black,
        ),
        body: Column(
          children: [
            Expanded(
                flex: 10,
                child: Container(
                  child: FutureBuilder(
                    future: _connect(),
                    builder: (BuildContext context, AsyncSnapshot snapshot) {
                      if (!snapshot.hasData)
                        return Center(
                            child: CircularProgressIndicator(
                          strokeWidth: 2,
                          color: Colors.white,
                        ));

                      List<Message> data = snapshot.data;
                      print("object");

                      return ListView.builder(
                        itemCount: data.length,
                        itemBuilder: (context, index) {
                          print("___LENGTH__${data.length}");

                          return Column(
                            children: [
                              data[index].from_num ==
                                      widget.telephoneuser.toString()
                                  ? ChatBubble(
                                      clipper: ChatBubbleClipper1(
                                          type: BubbleType.receiverBubble),
                                      alignment: Alignment.topRight,
                                      margin: EdgeInsets.only(top: 20),
                                      backGroundColor: Colors.blue,
                                      child: Container(
                                        constraints: BoxConstraints(
                                          maxWidth: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.7,
                                        ),
                                        child: Text(
                                          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      ),
                                    )
                                  : ChatBubble(
                                      clipper: ChatBubbleClipper1(
                                          type: BubbleType.sendBubble),
                                      alignment: Alignment.topRight,
                                      margin: EdgeInsets.only(top: 20),
                                      backGroundColor: Colors.white,
                                      child: Container(
                                        constraints: BoxConstraints(
                                          maxWidth: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.7,
                                        ),
                                        child: Text(
                                          data[index].content,
                                          style: GoogleFonts.poppins(),
                                        ),
                                      ),
                                    )
                            ],
                          );
                        },
                      );
                    },
                  ),
                )),
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    TiInput(
                        color: Colors.black,
                        hintText: 'Message',
                        // height: height * .08,
                        icon: '',
                        hintColor: Colors.white,
                        // border: Border.all(width: .1, color: Colors.white),
                        inputController: _text,
                        keyboardType: TextInputType.text,
                        readonly: false,
                        width: width * .7),
                    GestureDetector(
                      onTap: () {
                        Api().addMessage(
                            widget.telephoneuser,
                            90202020,
                            _text.text,
                            widget.data.nomuser,
                            widget.data.id_rdv);

                        setState(() {
                          _text.text = "";
                        });
                      },
                      child: Container(
                        width: width * .15,
                        height: height * .08,
                        color: Colors.grey,
                        child: Icon(
                          Icons.send,
                          color: Colors.white,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ));
  }
}
