import 'dart:convert';

import 'package:chat_application/Models/user_model.dart';
import 'package:chat_application/screens/groups/group.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Chats extends StatefulWidget {
  const Chats({super.key});

  @override
  State<Chats> createState() => _ChatsState();
}

class _ChatsState extends State<Chats> {
  Future<userModel> apihit() async {
    final response = await http
        .get(Uri.parse("https://matoonkh.github.io/alnomi/users.json"));
    var data = jsonDecode(response.body.toString());

    if (response.statusCode == 200) {
      return userModel.fromJson(data);
    } else {
      throw Exception('error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.teal,
          actions: const [
            const SizedBox(
              width: 20,
            ),
            Icon(
              Icons.flight,
              size: 30,
              color: Colors.white,
            ),
            const SizedBox(
              width: 20,
            ),
            Icon(
              Icons.nightlight,
              size: 30,
              color: Colors.white,
            ),
            const SizedBox(
              width: 20,
            ),
            Icon(
              Icons.search,
              size: 30,
              color: Colors.white,
            ),
            const SizedBox(
              width: 20,
            ),
            Icon(
              Icons.camera_enhance,
              size: 30,
              color: Colors.white,
            ),
            const SizedBox(
              width: 20,
            ),
            Icon(
              Icons.more_vert,
              size: 30,
              color: Colors.white,
            ),
            const SizedBox(
              width: 20,
            ),
          ],
        ),
        body: FutureBuilder(
            future: apihit(),
            builder: (context, AsyncSnapshot<userModel> snapshot) {
              if (!snapshot.hasData) {
                return Center(child: Text('Loading'));
              } else {
                return ListView.builder(
                    itemCount: snapshot.data!.users!.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        leading: CircleAvatar(
                          radius: 30,
                          backgroundImage: NetworkImage(
                            snapshot.data!.users![index].image.toString(),
                          ),
                        ),
                        title: Text(
                          snapshot.data!.users![index].name.toString(),
                          style: TextStyle(color: Colors.black),
                        ),
                        subtitle: Row(
                          children: [
                            Icon(
                              Icons.check,
                              color: Colors.black38,
                            ),
                            Text(
                              "How can i help u",
                              style: TextStyle(color: Colors.black38),
                            ),
                          ],
                        ),
                        trailing: Text(
                          snapshot.data!.users![index].timestamp.toString(),
                          style: TextStyle(color: Colors.black38),
                        ),
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => group()));
                        },
                      );
                    });
              }
            }));
  }
}
