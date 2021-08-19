import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Messages extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseFirestore.instance.collection('chat').snapshots(),
      builder: (context, chatSnapshot) {
        if (chatSnapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        }

        dynamic snapshotData = chatSnapshot.data;
        var chatDocs = snapshotData?.docs ?? [];

        return ListView.builder(
          itemCount: chatDocs.length,
          itemBuilder: (ctx, index) => Text(chatDocs[index]['text']),
        );
      },
    );
  }
}