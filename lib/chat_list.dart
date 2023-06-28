import 'package:flutter/material.dart';
import 'package:messaging_app/chat_page.dart';

class ChatHomeBody extends StatelessWidget {

  const ChatHomeBody({@required this.users, Key key,}) : super(key: key);

  @override
  Widget build(BuildContext context) => Expanded(
    child: Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(25),
          topRight: Radius.circular(25),
        ),
      ),
      child: buildChats(),
    ),
  );

  Widget buildChats() => ListView.builder(
    physics: BouncingScrollPhysics(),
    itemBuilder: (context, index) {
      final user = users[index];

      return Container(
        height: 75,
        child: ListTile(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => ChatScreen(),
            ));
          },
          leading: CircleAvatar(
            radius: 25,
            backgroundImage: NetworkImage(user.urlAvatar),
          ),
          title: Text(user.name),
        ),
      );
    },
    itemCount: users.length,
  );
}
