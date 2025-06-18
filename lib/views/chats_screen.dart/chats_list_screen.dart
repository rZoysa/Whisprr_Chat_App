import 'package:flutter/material.dart';

class ChatsListScreen extends StatefulWidget {
  const ChatsListScreen({super.key});

  @override
  State<ChatsListScreen> createState() => _ChatsListScreenState();
}

class _ChatsListScreenState extends State<ChatsListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Chats',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),

        centerTitle: true,
        leading: IconButton(
          onPressed: () {},
          icon: Icon(Icons.edit_outlined),
          iconSize: 30,
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.add_circle_outline,
              color: ColorScheme.of(context).primary,
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Flexible(
            child: ListView.builder(
              itemCount: 15,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    ListTile(
                      leading: CircleAvatar(
                        radius: 25,
                        backgroundImage: NetworkImage(
                          'https://img.freepik.com/premium-vector/man-avatar-profile-picture-vector-illustration_268834-538.jpg', // Replace with actual image URL
                        ),
                      ),
                      title: Text('John Doe'),
                      subtitle: Text('Hey, how are you?'),
                      trailing: Text('10:30 AM'),
                    ),
                    Divider(
                      height: 1,
                      color: Colors.grey[300],
                      indent: 25,
                      endIndent: 24,
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
