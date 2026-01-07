import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter/services.dart';

import '../widgets/chats_tab.dart';
import '../widgets/moments_tab.dart';
import '../widgets/calls_tab.dart';
import '../widgets/hubs_tab.dart';
import '../theme_provider.dart';
import '../app_theme/custom_colors.dart';





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
    final theme = Theme.of(context);
    final customColors = Theme.of(context).extension<CustomColors>()!;
    final List<String> tabName = ['ChatApp', 'Moments', 'Hubs', 'Calls'];



    WidgetsBinding.instance.addPostFrameCallback((_) {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
          statusBarColor: Colors.transparent, // keep transparent, content goes behind
          statusBarIconBrightness:
              theme.brightness == Brightness.dark ? Brightness.light : Brightness.dark,
          systemNavigationBarColor: theme.scaffoldBackgroundColor,
          systemNavigationBarIconBrightness:
              theme.brightness == Brightness.dark ? Brightness.light : Brightness.dark,
        ),
      );
    });


    PreferredSizeWidget buildAppBar(int pageIndex) {
      switch (pageIndex) {
        case 0:
          return AppBar(
            elevation: 0,
            // backgroundColor: Colors.transparent,
            title: Text(tabName[pageIndex],
              style: TextStyle(
                color: customColors.header,
                fontWeight: FontWeight.w700),
            ),
            actions: [
              IconButton(
                icon: const Icon(Icons.camera_alt_outlined),
                onPressed: () {},
              ),
              PopupMenuButton<String>(
                color: theme.scaffoldBackgroundColor,
                constraints: BoxConstraints(
                  minWidth: 100,
                  maxWidth: 180,
                  minHeight: 0,
                  maxHeight: 400,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                // onSelected: (value) {
                //   if (value == 'Toggle Theme') {
                //     Provider.of<ThemeProvider>(context, listen: false).toggleTheme();
                //   }
                // },
                onSelected: (value) {},
                itemBuilder: (BuildContext context) {
                  return [
                    'New Group',
                    'New broadcast',
                    'Linked devices',
                    'Starred',
                    'Read all',
                    'Settings',
                  ].map((String choice) {
                    return PopupMenuItem<String>(
                      value: choice,
                      child: Text(
                        choice,
                        style: theme.textTheme.bodyLarge?.copyWith(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    );
                  }).toList();
                },
              ),
            ],
          );
        case 1:
          return AppBar(
            elevation: 0,
            // backgroundColor: Colors.transparent,
            title: Text(tabName[pageIndex],
              style: TextStyle(
                color: theme.textTheme.bodyLarge?.color,
                fontWeight: FontWeight.w700),
            ),
            actions: [
              IconButton(
                icon: const Icon(Icons.search),
                onPressed: () {},
              ),
              PopupMenuButton<String>(
                color: theme.scaffoldBackgroundColor,
                constraints: BoxConstraints(
                  minWidth: 100,
                  maxWidth: 180,
                  minHeight: 0,
                  maxHeight: 400,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                onSelected: (value) {},
                itemBuilder: (BuildContext context) {
                  return [
                    'Create channel',
                    'Moment privacy',
                    'Starred',
                    'Settings',
                  ].map((String choice) {
                    return PopupMenuItem<String>(
                      value: choice,
                      child: Text(
                        choice,
                        style: theme.textTheme.bodyLarge?.copyWith(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    );
                  }).toList();
                },
              ),
            ],
          );
        case 2:
          return AppBar(
            elevation: 0,
            // backgroundColor: Colors.transparent,
            title: Text(tabName[pageIndex],
              style: TextStyle(
                color: theme.textTheme.bodyLarge?.color,
                fontWeight: FontWeight.w700),
            ),
            actions: [
              PopupMenuButton<String>(
                color: theme.scaffoldBackgroundColor,
                constraints: BoxConstraints(
                  minWidth: 100,
                  maxWidth: 180,
                  minHeight: 0,
                  maxHeight: 400,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                onSelected: (value) {},
                itemBuilder: (BuildContext context) {
                  return [
                    'Settings',
                  ].map((String choice) {
                    return PopupMenuItem<String>(
                      value: choice,
                      child: Text(
                        choice,
                        style: theme.textTheme.bodyLarge?.copyWith(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    );
                  }).toList();
                },
              ),
            ],
          );
        case 3:
        default:
          return AppBar(
            elevation: 0,
            // backgroundColor: Colors.transparent,
            title: Text(tabName[pageIndex],
              style: TextStyle(
                color: theme.textTheme.bodyLarge?.color,
                fontWeight: FontWeight.w700),
            ),
            actions: [
              IconButton(
                icon: const Icon(Icons.search),
                onPressed: () {},
              ),
              PopupMenuButton<String>(
                color: theme.scaffoldBackgroundColor,
                constraints: BoxConstraints(
                  minWidth: 100,
                  maxWidth: 180,
                  minHeight: 0,
                  maxHeight: 400,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                onSelected: (value) {},
                itemBuilder: (BuildContext context) {
                  return [
                    'Clear call log',
                    'Settings',
                  ].map((String choice) {
                    return PopupMenuItem<String>(
                      value: choice,
                      child: Text(
                        choice,
                        style: theme.textTheme.bodyLarge?.copyWith(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    );
                  }).toList();
                },
              ),
            ],
          );
      }
    }

    floatAction(int pageIndex){
      switch (pageIndex) {
        case 0:
          return FloatingActionButton(
            onPressed: () {
              // Provider.of<ThemeProvider>(context, listen: false).isDarkMode
              // ScaffoldMessenger.of(context).showSnackBar(
              //   const SnackBar(content: Text('Start a new chat')),
              // );
              Provider.of<ThemeProvider>(context, listen: false).toggleTheme();
            },
            // backgroundColor: theme.colorScheme.primary,
            backgroundColor: theme.textTheme.bodyMedium?.color,
            child: 
              Provider.of<ThemeProvider>(context, listen: false).isDarkMode 
                ? Icon(
                    Icons.light_mode,
                    size: 22, color: theme.textTheme.bodyLarge?.color)
                : Icon(
                    Icons.dark_mode,
                    size: 22, color: theme.textTheme.bodyLarge?.color)
          );
        case 1:
          return FloatingActionButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Media')),
                );
              },
              backgroundColor: theme.colorScheme.primary,
              child: Icon(Icons.add_a_photo_outlined,
                  size: 22, color: theme.colorScheme.onPrimary),
            );
        case 3:
          return FloatingActionButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Start a new call')),
                );
              },
              backgroundColor: theme.colorScheme.primary,
              child: Icon(Icons.add_call,
                  size: 22, color: theme.colorScheme.onPrimary),
            );
        case 2:
        default:
          return FloatingActionButton(
            onPressed: null,
            backgroundColor: Colors.transparent,
            elevation: 0,
            child: const SizedBox.shrink(),
          );
      }
    }

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      appBar: buildAppBar(_tabController.index), // <-- AppBar is here now
      body: TabBarView(
        controller: _tabController,
        children: [
          // Only bodies, no Scaffold/appBar here!
          ChatsTab(),
          UpdatesTab(),
          HubsTab(),
          CallsTab(),
        ],
      ),
      floatingActionButton: floatAction(_tabController.index),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(0),
        child: Material(
          color: theme.scaffoldBackgroundColor, // Match theme background
          // color: Colors.black.withAlpha(100), // Match theme background
          elevation: 8, // Soft floating shadow
          child: SizedBox(
            height: 60,
            child: TabBar(
              controller: _tabController,
              // isScrollable: true,
              labelPadding: EdgeInsets.zero,
              dividerColor: Colors.transparent,
              indicator: BoxDecoration(),
              labelStyle: const TextStyle(fontSize:12, fontWeight: FontWeight.bold),
              labelColor: theme.colorScheme.primary,
              unselectedLabelColor: theme.textTheme.bodyLarge?.color,              
              splashFactory: NoSplash.splashFactory, // Removes splash highlight
              // onTap: (index) {
              //   _pageController.jumpToPage(index);
              // },
              tabs: [
                Tab(
                  icon: Icon(Icons.chat),
                  child: Text("Chats"),
                ),
                Tab(
                  icon: Icon(Icons.update),
                  child: Text("Moments"),
                ),
                Tab(
                  icon: Icon(Icons.groups),
                  child: Text("Hubs"),
                ),
                Tab(
                  icon: Icon(Icons.call),
                  child: Text("Calls"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}