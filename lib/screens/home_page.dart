import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/chats_tab.dart';
import '../widgets/updates_tab.dart';
import '../widgets/calls_tab.dart';
import '../widgets/communities_tab.dart';
import '../theme_provider.dart';
import '../custom_colors.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
    _tabController.addListener(() {
      setState(() {}); // Rebuild to update FAB visibility
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context); // 👈 get active theme
    final customColors = Theme.of(context).extension<CustomColors>()!;

    final List<Text> tabName = [
      Text(
        'WhatsApp',
        style: TextStyle(
          color: customColors.header,
          fontWeight: FontWeight.w500,
        ),
      ),
      Text(
        'Updates',
        style: TextStyle(
          color: theme.textTheme.bodyLarge?.color,
          fontWeight: FontWeight.w400,
        ),
      ),
      Text(
        'Communities',
        style: TextStyle(
          color: theme.textTheme.bodyLarge?.color,
          fontWeight: FontWeight.w400,
        ),
      ),
      Text(
        'Calls',
        style: TextStyle(
          color: theme.textTheme.bodyLarge?.color,
          fontWeight: FontWeight.w400,
        ),
      ),
    ];

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: tabName[_tabController.index],
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.camera_alt_outlined),
            onPressed: () {},
          ),
          PopupMenuButton<String>(
            color: theme.scaffoldBackgroundColor,
            constraints: BoxConstraints(
              minWidth: 100, // set min width
              maxWidth: 180, // optional max width
              minHeight: 0,  // not really needed, but you can control height too
              maxHeight: 400, // useful if many items
            ),
            shape: RoundedRectangleBorder( // rounded corners
              borderRadius: BorderRadius.circular(12),
            ),
            onSelected: (value) {
              if (value == 'Toggle Theme') {
                Provider.of<ThemeProvider>(context, listen: false).toggleTheme();
              }
            },
            itemBuilder: (BuildContext context) {
              return [
                'New Group',
                'New broadcast',
                'Linked devices',
                'Starred',
                'Read all',
                'Settings',
                'Toggle Theme'
              ].map((String choice) {
                return PopupMenuItem<String>(
                  value: choice,
                  child: Text(choice),
                );
              }).toList();
            },
          ),
        ],
      ),
      body: TabBarView(
        controller: _tabController,
        children: const [
          ChatsTab(),
          UpdatesTab(),
          CommunitiesTab(),
          CallsTab(),
        ],
      ),
      floatingActionButton: _tabController.index == 0
          ? SizedBox(
              height: 50,
              width: 50,
              child: FloatingActionButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Start a new chat')),
                  );
                },
                backgroundColor: theme.colorScheme.primary,
                child: Icon(Icons.chat,
                    size: 22, color: theme.colorScheme.onPrimary),
              ),
            )
          : null,
      bottomNavigationBar: SizedBox(
        height: 60,
        child: TabBar(
          controller: _tabController,
          indicatorColor: theme.colorScheme.primary,
          labelStyle: const TextStyle(fontWeight: FontWeight.bold),
          tabs: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Flexible(
                  flex: 2,
                  child: Icon(Icons.chat,
                      color: theme.textTheme.bodyLarge?.color),
                ),
                Flexible(
                  flex: 1,
                  child: Tab(
                    child: Text(
                      'Chats',
                      style: TextStyle(
                        fontSize: 12,
                        color: theme.textTheme.bodyLarge?.color,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Flexible(
                  flex: 2,
                  child: Icon(Icons.update,
                      color: theme.textTheme.bodyLarge?.color),
                ),
                Flexible(
                  flex: 1,
                  child: Tab(
                    child: Text(
                      'Updates',
                      style: TextStyle(
                        fontSize: 12,
                        color: theme.textTheme.bodyLarge?.color,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Flexible(
                  flex: 2,
                  child: Icon(Icons.groups,
                      color: theme.textTheme.bodyLarge?.color),
                ),
                Flexible(
                  flex: 1,
                  child: Tab(
                    child: Text(
                      'Communities',
                      style: TextStyle(
                        fontSize: 12,
                        color: theme.textTheme.bodyLarge?.color,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Flexible(
                  flex: 2,
                  child: Icon(Icons.call,
                      color: theme.textTheme.bodyLarge?.color),
                ),
                Flexible(
                  flex: 1,
                  child: Tab(
                    child: Text(
                      'Calls',
                      style: TextStyle(
                        fontSize: 12,
                        color: theme.textTheme.bodyLarge?.color,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}




















// BEFORE THEME DONE CORRECTLY




// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// import '../widgets/chats_tab.dart';
// import '../widgets/updates_tab.dart';
// import '../widgets/calls_tab.dart';
// import '../widgets/communities_tab.dart';
// import '../theme_provider.dart';
// import '../app_color.dart';


// class HomePage extends StatefulWidget {
//   const HomePage({super.key});

//   @override
//   State<HomePage> createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {
//   late TabController _tabController;

//   @override
//   void initState() {
//     super.initState();
//     _tabController = TabController(length: 4, vsync: this);
//     _tabController.addListener(() {
//       setState(() {}); // Rebuild to update FAB visibility
//     });
//   }

//   @override
//   void dispose() {
//     _tabController.dispose();
//     super.dispose();
//   }

//   final List<Text> tabName = [
//     Text(
//       'WhatsApp', 
//       style: TextStyle(
//         color: AppColors.header,
//         fontWeight: FontWeight.w500),),
//     Text(
//       'Updates',
//       style: TextStyle(
//         color: AppColors.textPrimary,
//         fontWeight: FontWeight.w400),),
//     Text(
//       'Communities', 
//       style: TextStyle(
//         color: AppColors.textPrimary,
//         fontWeight: FontWeight.w400),),
//     Text(
//       'Calls',
//       style: TextStyle(
//         color: AppColors.textPrimary,
//         fontWeight: FontWeight.w400),),
//     ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: AppColors.background,
//       appBar: AppBar(
//         backgroundColor: Colors.transparent,
//         title: tabName[_tabController.index],
//         elevation: 0,
//         actions: [
//           IconButton(
//             icon: const Icon(Icons.camera_alt_outlined),
//             onPressed: () {},
//           ),
//           PopupMenuButton<String>(
//             onSelected: (value) {
//               if (value == 'Toggle Theme') {
//                 Provider.of<ThemeProvider>(context, listen: false).toggleTheme();
//               }
//             },
//             itemBuilder: (BuildContext context) {
//               return ['New Group','New broadcast','Linked devices', 'Starred', 'Read all', 'Settings','Toggle Theme'].map((String choice) {
//                 return PopupMenuItem<String>(
//                   value: choice,
//                   child: Text(choice),
//                 );
//               }).toList();
//             },
//           ),
//         ],
//       ),
//       body: TabBarView(
//         controller: _tabController,
//         children: const [
//           ChatsTab(),
//           UpdatesTab(),
//           // Center(child: Text('Status Tab')),
//           CommunitiesTab(),
//           CallsTab(),
//           // Center(child: Text('Calls Tab')),
//         ],
//       ),
//       floatingActionButton: _tabController.index == 0
//           ? SizedBox(
//             height: 50,
//             width: 50,
//             child: FloatingActionButton(
//               onPressed: () {
//                 // You can trigger new chat screen later
//                 ScaffoldMessenger.of(context).showSnackBar(
//                   const SnackBar(content: Text('Start a new chat')),
//                 );
//               },
//               backgroundColor: AppColors.primary,
//               child: const Icon(Icons.chat,size: 22, color: AppColors.background),
//             ))
//           : null,
//       bottomNavigationBar: SizedBox(
//         height: 60,
//         child: TabBar(
//           controller: _tabController,
//           indicatorColor: AppColors.primary,
//           // indicatorColor: Colors.amber,
//           labelStyle: const TextStyle(fontWeight: FontWeight.bold),
//           tabs: const [
//             Column(
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 Flexible(
//                   flex: 2,
//                   child: Icon(Icons.chat, color: AppColors.textPrimary,),
//                   ),
//                 Flexible(
//                   flex: 1,
//                   child: Tab(child: Text('Chats', style: TextStyle(fontSize: 12,color: AppColors.textPrimary))),
//                 )
//               ],),
//             Column(
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 Flexible(
//                   flex: 2,
//                   child: Icon(Icons.update, color: AppColors.textPrimary),
//                   ),
//                 Flexible(
//                   flex: 1,
//                   child: Tab(child: Text('Updates', style: TextStyle(fontSize: 12,color: AppColors.textPrimary),)),
//                   ),
//               ],),
//             Column(
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 Flexible(
//                   flex: 2,
//                   child: Icon(Icons.groups, color: AppColors.textPrimary),
//                   ),
//                 Flexible(
//                   flex: 1,
//                   child: Tab(child: Text('Communities', style: TextStyle(fontSize: 12,color: AppColors.textPrimary), overflow: TextOverflow.ellipsis,)),
//                   ),
//               ],),
//             Column(
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 Flexible(
//                   flex: 2,
//                   child: Icon(Icons.call, color: AppColors.textPrimary),
//                   ),
//                 Flexible(
//                   flex: 1,
//                   child: Tab(child: Text('Calls', style: TextStyle(fontSize: 12,color: AppColors.textPrimary))),
//                   ),
//               ],),
//           ],
//         ),
//     ));
//   }
// } 