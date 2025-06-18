import 'package:flutter/material.dart';
import 'package:logger/web.dart';
import 'package:whisprr/components/glass_app_bar.dart';
import 'package:whisprr/views/chats_screen.dart/widgets/user_search_bottom_sheet.dart';

class ChatsListScreen extends StatefulWidget {
  const ChatsListScreen({super.key});

  @override
  State<ChatsListScreen> createState() => _ChatsListScreenState();
}

class _ChatsListScreenState extends State<ChatsListScreen> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: GlassAppBar(
        title: 'Chats',
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.edit_outlined),
          iconSize: 30,
        ),
        actions: [
          IconButton(
            onPressed: () {
              showModalBottomSheet(
                context: context,
                isScrollControlled: true,
                // backgroundColor: Theme.of(context).colorScheme.surfaceBright,
                backgroundColor: Colors.transparent,
                builder: (context) => Builder(
                  builder: (context) {
                    return Container(
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.surfaceBright,
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(20),
                        ),
                      ),
                      child: UserSearchBottomSheet(),
                    );
                  },
                ),
              );
            },
            icon: Icon(
              Icons.add_circle_outline,
              color: Theme.of(context).colorScheme.primary,
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
                      onTap: () {
                        Logger().f(index);
                      },
                      leading: const CircleAvatar(
                        radius: 25,
                        backgroundImage: NetworkImage(
                          'https://cdn-icons-png.flaticon.com/512/219/219970.png',
                        ),
                      ),
                      title: Text('John Doe'),
                      subtitle: Text('Hey, how are you?'),
                      trailing: Text('10:30 AM'),
                    ),
                    Divider(
                      height: 0,
                      thickness: 0.5,
                      color: theme.dividerColor,
                      indent: 20,
                      // endIndent: 20,
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
