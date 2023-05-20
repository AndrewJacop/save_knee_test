import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '/chat_model.dart';
import '../conversation_list.dart';

final _firestore = FirebaseFirestore.instance;

class ChatPage extends StatefulWidget {
  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  bool isLoaded = false;
  List<ChatModel> chatList = [];
  final _auth = FirebaseAuth.instance;

  getChatsList() async {
    // List<Doctor> drList = await getDrList();
    // User curruntUser = _auth.currentUser!;
    // String currentUserName = curruntUser.displayName!;
    // //String currentUserName = 'Andrew Ashraf';
    // final drsData = await _firestore.collection('doctors').get();
    // for (var dt in drsData.docs) {
    //   //print(dt['name']);
    //   drList.add(dt['name']);
    // }
    // for (var dr in drList) {
    //   final data = await _firestore
    //       .collection('chats')
    //       .doc(currentUserName)
    //       .collection(dr)
    //       .get();
    //   if (data.docs.isNotEmpty) {
    //     chatList.add(ChatModel(
    //         name: dr,
    //         messageText: data.docs.last['text'],
    //         imageURL: 'assets/images/doctor2.png'));
    //   }
    // }
    // setState(() {
    //   isLoaded = true;
    // });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getChatsList();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 25).r,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: const Color(0xff073D97),
                      borderRadius: BorderRadius.circular(12).w,
                    ),
                    child: IconButton(
                      icon: const Icon(
                        Icons.arrow_back_ios_new_outlined,
                        color: Colors.white,
                      ),
                      onPressed: () => Navigator.of(context).pop(),
                    ),
                  ),
                  const Spacer(
                    flex: 2,
                  ),
                  Center(
                    child: Text(
                      "Messages",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 25.sp,
                      ),
                    ),
                  ),
                  const Spacer(
                    flex: 2,
                  ),
                  Padding(
                      padding: const EdgeInsets.only(right: 30).r,
                      child: IconButton(
                        icon: Icon(
                          Icons.logout_outlined,
                          color: Color(0xff0D235C),
                          size: 50,
                        ),
                        onPressed: () {
                          getChatsList();
                        },
                      )),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16, left: 16, right: 16),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: "Search...",
                    hintStyle: TextStyle(color: Colors.grey.shade600),
                    prefixIcon: Icon(
                      Icons.search,
                      color: Colors.grey.shade600,
                      size: 20,
                    ),
                    filled: true,
                    fillColor: Colors.grey.shade100,
                    contentPadding: const EdgeInsets.all(8).w,
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20).w,
                        borderSide: BorderSide(color: Colors.grey.shade100)),
                  ),
                ),
              ),
              SizedBox(
                height: 500,
                child: Visibility(
                  visible: isLoaded,
                  replacement: Center(child: CircularProgressIndicator()),
                  child: ListView.builder(
                    itemCount: chatList.length,
                    itemBuilder: (context, index) {
                      final chat = chatList[index];
                      return ConversationList(
                        name: chat.name,
                        messageText: chat.messageText,
                        imageUrl: chat.messageText,
                        isMessageRead: true,
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
