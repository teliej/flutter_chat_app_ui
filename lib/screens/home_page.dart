// import 'package:flutter/material.dart';
// import '../widgets/chats_tab.dart';

// class HomePage extends StatelessWidget {
//   const HomePage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return DefaultTabController(
//       length: 3,
//       child: Scaffold(
//         appBar: AppBar(
//           title: const Text('WhatsApp'),
//           elevation: 0,
//           actions: [
//             IconButton(
//               icon: const Icon(Icons.camera_alt_outlined),
//               onPressed: () {},
//             ),
//             IconButton(
//               icon: const Icon(Icons.search),
//               onPressed: () {},
//             ),
//             PopupMenuButton<String>(
//               onSelected: (value) {},
//               itemBuilder: (BuildContext context) {
//                 return ['New Group', 'Settings'].map((String choice) {
//                   return PopupMenuItem<String>(
//                     value: choice,
//                     child: Text(choice),
//                   );
//                 }).toList();
//               },
//             ),
//           ],
//           bottom: const TabBar(
//             indicatorColor: Colors.white,
//             labelStyle: TextStyle(fontWeight: FontWeight.bold),
//             tabs: [
//               Tab(text: 'CHATS'),
//               Tab(text: 'STATUS'),
//               Tab(text: 'CALLS'),
//             ],
//           ),
//         ),
//         body: const TabBarView(
//           children: [
//             ChatsTab(),
//             Center(child: Text('Status Tab')),
//             Center(child: Text('Calls Tab')),
//           ],
//         ),
//       ),
//     );
//   }
// }





// """Adding floating action button button (FAB)"""
// """Scaffold can only have one floatingActionButton, and it's in the homepage"""
// """So I need logic to show and hide it depending on the selected tab"""
// """This means we are extending to a statefulWidget"""










import 'package:flutter/material.dart';
import '../widgets/chats_tab.dart';
import '../widgets/updates_tab.dart';
import '../widgets/calls_tab.dart';
import '../widgets/communities_tab.dart';
import '../theme_provider.dart';
import 'package:provider/provider.dart';


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

  final List<String> tabName = ['WhatsApp', 'Updates','Communities', 'Calls'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(tabName[_tabController.index]),
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.camera_alt_outlined),
            onPressed: () {},
          ),
          PopupMenuButton<String>(
            onSelected: (value) {
              if (value == 'Toggle Theme') {
                Provider.of<ThemeProvider>(context, listen: false).toggleTheme();
              }
            },
            itemBuilder: (BuildContext context) {
              return ['New Group','New broadcast','Linked devices', 'Starred', 'Read all', 'Settings','Toggle Theme'].map((String choice) {
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
          // Center(child: Text('Status Tab')),
          CommunitiesTab(),
          CallsTab(),
          // Center(child: Text('Calls Tab')),
        ],
      ),
      floatingActionButton: _tabController.index == 0
          ? FloatingActionButton(
              onPressed: () {
                // You can trigger new chat screen later
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Start a new chat')),
                );
              },
              backgroundColor: Color.fromARGB(255, 26, 131, 29),
              child: const Icon(Icons.chat, color: Colors.white),
            )
          : null,
      bottomNavigationBar: SizedBox(
        height: 60,
        child: TabBar(
          controller: _tabController,
          indicatorColor: Colors.white,
          labelStyle: const TextStyle(fontWeight: FontWeight.bold),
          tabs: const [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Flexible(
                  flex: 2,
                  child: Icon(Icons.chat),
                  ),
                Flexible(
                  flex: 1,
                  child: Tab(text: 'Chats'),
                )
              ],),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Flexible(
                  flex: 2,
                  child: Icon(Icons.update),
                  ),
                Flexible(
                  flex: 1,
                  child: Tab(text: 'Updates'),
                  ),
              ],),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Flexible(
                  flex: 2,
                  child: Icon(Icons.groups),
                  ),
                Flexible(
                  flex: 1,
                  child: Tab(text: 'Communities'),
                  ),
              ],),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Flexible(
                  flex: 2,
                  child: Icon(Icons.call),
                  ),
                Flexible(
                  flex: 1,
                  child: Tab(text: 'Calls'),
                  ),
              ],),
          ],
        ),
    ));
  }
} 









































































// import 'package:flutter/material.dart';
// import '../widgets/chats_tab.dart';
// import '../widgets/status_tab.dart';
// import '../widgets/call_tab.dart';
// import '../theme_provider.dart';
// import 'package:provider/provider.dart';


// class HomePage extends StatefulWidget {
//   const HomePage({super.key});

//   @override
//   State<HomePage> createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {
//   late TabController _tabController;
//   late PageController _pageController;

//   @override
//   void initState() {
//     super.initState();
//     _tabController = TabController(length: 3, vsync: this);
//     _pageController = PageController();

//     _tabController.addListener(() {
//       if (_tabController.indexIsChanging) {
//         _pageController.animateToPage(
//           _tabController.index,
//           duration: const Duration(milliseconds: 200), // 🎯 Faster transition
//           curve: Curves.easeInOut,
//         );
//       }
//       setState(() {}); // Rebuild to update FAB visibility
//     });
//   }

//   @override
//   void dispose() {
//     _tabController.dispose();
//     super.dispose();
//   }

//   final List<String> tabName = ['WhatsApp', 'Status', 'Calls'];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.transparent,
//         title: Text(tabName[_tabController.index]),
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
//       body: PageView(
//         controller: _pageController,
//         physics: const OnePageAtATimeScrollPhysics(), // 👈 Only one tab per swipe
//         onPageChanged: (index) {
//           _tabController.index = index;
//         },
//         children: const [
//           ChatsTab(),
//           StatusTab(),
//           CallTab(),
//         ],
//       ),
//       floatingActionButton: _tabController.index == 0
//           ? FloatingActionButton(
//               onPressed: () {
//                 // You can trigger new chat screen later
//                 ScaffoldMessenger.of(context).showSnackBar(
//                   const SnackBar(content: Text('Start a new chat')),
//                 );
//               },
//               backgroundColor: Colors.teal,
//               child: const Icon(Icons.chat, color: Colors.white),
//             )
//           : null,
//       bottomNavigationBar: TabBar(
//           controller: _tabController,
//           indicatorColor: Colors.white,
//           labelStyle: const TextStyle(fontWeight: FontWeight.bold),
//           tabs: const [
//             Tab(text: 'CHATS'),
//             Tab(text: 'STATUS'),
//             Tab(text: 'CALLS'),
//           ],
//         ),
//     );
//   }
// }





















// class OnePageAtATimeScrollPhysics extends ScrollPhysics {
//   const OnePageAtATimeScrollPhysics({ScrollPhysics? parent}) : super(parent: parent);

//   @override
//   OnePageAtATimeScrollPhysics applyTo(ScrollPhysics? ancestor) {
//     return OnePageAtATimeScrollPhysics(parent: buildParent(ancestor));
//   }

//   @override
//   Simulation? createBallisticSimulation(ScrollMetrics position, double velocity) {
//     // Clamp to only allow one page per swipe
//     final Simulation? simulation = super.createBallisticSimulation(position, velocity);
//     if (simulation != null && velocity.abs() > 1000.0) {
//       final pixelsPerPage = position.viewportDimension;
//       final currentPage = position.pixels / pixelsPerPage;
//       final targetPage = velocity > 0 ? currentPage.ceil() : currentPage.floor();
//       final nextPage = velocity > 0 ? currentPage.floor() + 1 : currentPage.ceil() - 1;

//       final clampedTargetPage = velocity > 0
//           ? (nextPage > targetPage ? targetPage : nextPage)
//           : (nextPage < targetPage ? targetPage : nextPage);

//       final targetPixels = clampedTargetPage * pixelsPerPage;

//       return ScrollSpringSimulation(spring, position.pixels, targetPixels, velocity);
//     }

//     return simulation;
//   }
// }
