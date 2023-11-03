import 'dart:convert';

import 'package:chat_application/Models/group_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class group extends StatefulWidget {
  const group({super.key});

  @override
  State<group> createState() => _groupState();
}

class _groupState extends State<group> {
  Future<groupmodel> apihit() async {
    final response = await http
        .get(Uri.parse('https://matoonkh.github.io/alnomi/messages.json'));
    var data = jsonDecode(response.body.toString());

    if (response.statusCode == 200) {
      return groupmodel.fromJson(data);
    } else {
      throw Exception("error");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        backgroundColor: Colors.teal,
        
        ),
      
      body: FutureBuilder(
          future: apihit(),
          builder: (context, AsyncSnapshot<groupmodel> snapshot) {
            if (!snapshot.hasData) {
              return Center(child: Text('Loading'));
            } else {
              return ListView.builder(
                  itemCount: snapshot.data!.messages!.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: CircleAvatar(
                        radius: 20,
                        backgroundImage: NetworkImage(
                          snapshot.data!.messages![index].image.toString(),
                        ),
                      ),
                      title: Container(
                        child: Column(
                          children: [
                            Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                snapshot.data!.messages![index].name.toString(),
                                style: TextStyle(color: Colors.teal),
                              ),
                            ),
                            Text(
                              snapshot.data!.messages![index].message
                                  .toString(),
                            ),
                            Align(
                                alignment: Alignment.bottomRight,
                                child: Text(snapshot
                                    .data!.messages![index].timestamp
                                    .toString())),
                          ],
                        ),
                        width: double.infinity,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Colors.black12),
                      ),
                    );
                  });
            }
          }),
    );
  }
}
