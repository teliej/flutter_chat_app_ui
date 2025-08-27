import 'package:flutter/material.dart';

class HubsTab extends StatelessWidget {
  const HubsTab({super.key});

  Widget _shadowDivider(BuildContext context) {
    return Container(
      height: 10,
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        boxShadow: [
          BoxShadow(
            // color: Colors.black,
            color: Colors.black.withOpacity(0.2),
            offset: const Offset(0, 5),
            blurRadius: 4,
          )
        ],
      ),
    );
  }

  Widget _communityHeader(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      color: theme.scaffoldBackgroundColor,
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
      child: Row(
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              Card(
                color: theme.textTheme.bodyMedium?.color,
                child: const SizedBox(
                  width: 45,
                  height: 45,
                  child: Icon(Icons.groups, size: 30, color: Colors.white),
                ),
              ),
              Positioned(
                bottom: 2,
                right: 2,
                child: CircleAvatar(
                  backgroundColor: theme.colorScheme.primary,
                  radius: 11,
                  child: Icon(Icons.add, size: 20, color: theme.scaffoldBackgroundColor),
                ),
              ),
            ],
          ),
          const SizedBox(width: 12),
          Text(
            "New Hub",
            style: theme.textTheme.bodyLarge,
          ),
        ],
      ),
    );
  }

  Widget _communityItem(BuildContext context, int index) {
    final theme = Theme.of(context);

    return Container(
      color: theme.scaffoldBackgroundColor,
      padding: const EdgeInsets.all(5),
      child: Column(
        children: [
          // Group title
          Row(
            children: [
              Card(
                color: theme.textTheme.bodyMedium?.color,
                child: const SizedBox(
                  width: 40,
                  height: 40,
                  child: Icon(Icons.groups, size: 25, color: Colors.white),
                ),
              ),
              const SizedBox(width: 12),
              Text(
                "TCS ${(index + 1) * 100} LVL",
                style: theme.textTheme.bodyLarge?.copyWith(
                  fontWeight: FontWeight.w400,
                  fontSize: 18,
                ),
              ),
            ],
          ),
          SizedBox(height: 10),
          Divider(
            // color: theme.textTheme.bodyMedium?.color.withOpacity(0.5), // 30% visible
            color: Colors.grey.withOpacity(0.5), // 30% visible
            thickness: 1,
            height: 1,
          ),

          // Chats
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              children: [
                ListTile(
                  onTap: () {},
                  contentPadding: EdgeInsets.zero,
                  leading: const Card(
                    margin: EdgeInsets.zero,
                    color: Color.fromARGB(255, 0, 49, 10),
                    child: SizedBox(
                      width: 35,
                      height: 35,
                      child: Icon(Icons.record_voice_over,
                          color: Color.fromARGB(255, 119, 169, 121)),
                    ),
                  ),
                  title: Text("Announcements",
                      style:
                          theme.textTheme.bodyLarge),
                  subtitle: Text("TCS ${(index + 1) * 104} Assignment",
                      style: theme.textTheme.bodyMedium),
                  trailing: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Yesterday",
                          style: TextStyle(
                              color: theme.textTheme.bodyMedium?.color)),
                      const SizedBox(height: 2),
                    ],
                  ),
                ),

                ListTile(
                  onTap: () {},
                  contentPadding: EdgeInsets.zero,
                  leading: const CircleAvatar(
                    radius: 18,
                    backgroundColor: Color.fromARGB(255, 0, 49, 10),
                    child: Icon(Icons.people,
                        color: Color.fromARGB(255, 119, 169, 121), size: 20),
                  ),
                  title: Text("TELECOMMUNICATION SCIENCE",
                      style: theme.textTheme.bodyLarge),
                  subtitle: Text("~ You: Bro!!! this is an opportunity you can't miss",
                      style: theme.textTheme.bodyMedium),
                  trailing: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("11/06/2025",
                          style: TextStyle(
                              color: theme.textTheme.bodyMedium?.color)),
                      Icon(Icons.notifications_off_rounded,
                          color: theme.textTheme.bodyMedium?.color),
                    ],
                  ),
                ),

                ListTile(
                  onTap: () {},
                  contentPadding: EdgeInsets.zero,
                  leading: const CircleAvatar(
                    radius: 18,
                    backgroundColor: Color.fromARGB(255, 0, 49, 10),
                    child: Icon(Icons.people,
                        color: Color.fromARGB(255, 119, 169, 121), size: 20),
                  ),
                  title: Text("OFFICIAL ${(index + 1) * 100} LVL",
                      style: theme.textTheme.bodyLarge),
                  subtitle: Text("Today, 10:00 AM",
                      style: theme.textTheme.bodyMedium),
                  trailing: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("29/07/2025",
                          style: TextStyle(
                              color: theme.textTheme.bodyMedium?.color)),
                      const SizedBox(height: 2),
                    ],
                  ),
                ),

                // View all
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    children: [
                      Icon(Icons.arrow_forward_ios_outlined,
                          color: theme.textTheme.bodyMedium?.color, size: 16),
                      const SizedBox(width: 12),
                      Text("View all",
                          style: TextStyle(
                            color: theme.textTheme.bodyMedium?.color,
                            fontWeight: FontWeight.w500,
                            fontSize: 15,
                          )),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      children: [
        _communityHeader(context),
        const SizedBox(height: 10),
        _shadowDivider(context),
        const SizedBox(height: 10),
        ...List.generate(
          4,
          (index) => Column(
            children: [
              _communityItem(context, index),
              const SizedBox(height: 10),
              _shadowDivider(context),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ],
    );
  }
}