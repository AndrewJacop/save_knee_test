//import 'dart:wasm';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:intl/intl.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

final _fireStore=FirebaseFirestore.instance;
final _auth=FirebaseAuth.instance;
final current_user=_auth.currentUser;
late User loggedInUser;
class Chat extends StatefulWidget {
  const Chat({Key? key}) : super(key: key);

  @override
  void getCurrentUser(){
    //final new_user=_auth.currentUser;

  }
  State<Chat> createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  void getMessages()async{
    final messages= await _fireStore.collection('chats').get();
    for(var message in messages.docs ){
      print(message.data);
    }
  }
  void messagesStream()async{
    await for(var snapShot in _fireStore.collection('chats').snapshots()){
      for (var message in snapShot.docs){

      }
    }
  }

  TextEditingController text_control = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final screenHeight= MediaQuery.of(context).size.height;
    final screenWidth= MediaQuery.of(context).size.width;
    final bodyHeight=screenHeight-MediaQuery.of(context).padding.top-MediaQuery.of(context).padding.bottom;
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        backgroundColor: Colors.white,
        leading: Padding(
          padding: const EdgeInsets.only(left: 20).r,
          child: IconButton(
            icon: Icon(
              Icons.arrow_back_ios_new,
              color: Theme.of(context).primaryColor,
              size: 50,
            ),
            onPressed: () {},
          ),
        ),
        centerTitle: true,
        title: Text(
          "Dr/shimaa Elsawy",
          style: TextStyle(
              color: Theme.of(context).primaryColor,
              fontSize: 30.sp,
              fontWeight: FontWeight.bold),
        ),
        actions: [
          Padding(
              padding: const EdgeInsets.only(right: 30).r,
              child: IconButton(
                icon: Icon(
                  Icons.logout_outlined,
                  color: Theme.of(context).primaryColor,
                  size: 50,
                ),
                onPressed: () {},
              )),
        ],
      ),
      body: Column(
        children: [
          MesaageStream(),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(10).w,
              child: Container(
                height: .1*bodyHeight,
                child: TextField(
                  controller: text_control,
                  //TextEditingController(text: text_control.text),
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Theme.of(context).primaryColor,
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20).w),
                    suffixIcon: GestureDetector(
                        onTap: () {
                          _fireStore.collection('chats').add({
                            'msgFrom':current_user!.email,
                            'msgTo':'dr/aya',
                            'text':text_control.text,
                            'timeStamp':Timestamp.now().toString(),
                          });
                          text_control.clear();

                        },
                        child: Icon(
                          Icons.send,
                          color: Colors.white,
                        )),
                    contentPadding: EdgeInsets.all(20).w,
                    hintText: 'Type your message here',
                    hintStyle: TextStyle(color: Colors.white),
                  ),
                  style: TextStyle(color: Colors.white),

                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
/*
class Message {
  String text;
  DateTime date;
  bool isSentByMe;
  Message({required this.text, required this.date, required this.isSentByMe});
}*/

class Message extends StatelessWidget {
  Message({required this.otherUser,required this.text,required this.isSentByMe,required this.timeStamp});
  final bool isSentByMe;
  final String otherUser;
  final String text;
  final String timeStamp;
  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
      child: Column(
        crossAxisAlignment: isSentByMe?CrossAxisAlignment.end:CrossAxisAlignment.start,
        children: [
          Text(otherUser,style: TextStyle(
              fontSize: 12,
              color: Colors.black
          ),),
          Material(
            elevation:5.0,
            borderRadius: isSentByMe?BorderRadius.only(topLeft: Radius.circular(30),bottomLeft: Radius.circular(30),bottomRight: Radius.circular(30)):
            BorderRadius.only(
                topRight: Radius.circular(30),
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30)
            ),
            color: isSentByMe?Colors.lightBlueAccent:Colors.white,
            child: Text('text from $otherUser',
              style: TextStyle(
                  fontSize: 15,
                  color: isSentByMe? Colors.white:Colors.black
              ),),
          ),
        ],
      ),
    );;
  }
}
class MesaageStream extends StatelessWidget {
  const MesaageStream({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var chats=_fireStore.collection('chats').doc(current_user!.uid);

    return StreamBuilder<QuerySnapshot>(
      stream: _fireStore.collection('chats').snapshots(),
        builder: (context,snapshot){
          if(!snapshot.hasData){
            return Center(
              child: CircularProgressIndicator(
                backgroundColor: Colors.deepPurple,
              ),
            );
          }
          final messages=snapshot.data!.docs.reversed;
          List<Message> message_list=[];
          for(var item in messages){
            final msgFrom=item['msgFrom'];
            final msgTo=item['msgTo'];
            final text=item['text'];
            final timeStamp=item['timeStamp'];
            final messageBubble=Message(
                otherUser: msgFrom, text: text, isSentByMe: true, timeStamp: timeStamp);
            message_list.add(messageBubble);
          }
          return Expanded(
            child: ListView(
              padding: EdgeInsets.all(10),
              reverse: true,
              children: message_list,
            ),
          );
        }

    );
  }
}

