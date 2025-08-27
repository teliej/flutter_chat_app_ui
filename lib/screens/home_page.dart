import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
  late PageController _pageController;
  double _dragStartX = 0.0;
  double _dragStartPage = 0.0;
  bool _isDragging = false;
  int _currentPageIndex = 0; // Track the current page for AppBar

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
    _pageController = PageController(initialPage: 0);

    _tabController.addListener(() {
      if (_tabController.indexIsChanging) {
        _pageController.jumpToPage(_tabController.index);
      }
      setState(() {});
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    _pageController.dispose();
    super.dispose();
  }

  void _handleHorizontalDragStart(DragStartDetails details) {
    _dragStartX = details.globalPosition.dx;
    _dragStartPage = _pageController.page ?? _tabController.index.toDouble();
    _isDragging = true;
  }

  void _handleHorizontalDragUpdate(DragUpdateDetails details) {
    if (!_isDragging) return;
    final screenWidth = MediaQuery.of(context).size.width;
    final delta = details.globalPosition.dx - _dragStartX;
    final pageDelta = -delta / screenWidth;
    double targetPage = (_dragStartPage + pageDelta).clamp(0.0, 3.0);
    _pageController.position.moveTo(targetPage * _pageController.position.viewportDimension);
  }

  void _handleHorizontalDragEnd(DragEndDetails details) async {
    if (!_isDragging) return;
    _isDragging = false;
    // final screenWidth = MediaQuery.of(context).size.width;
    final currentPage = _pageController.page ?? _tabController.index.toDouble();
    final pageDelta = currentPage - _tabController.index;
    int newIndex = _tabController.index;

    if (pageDelta.abs() > 0.5) {
      if (pageDelta > 0 && _tabController.index < 3) {
        newIndex = _tabController.index + 1;
      } else if (pageDelta < 0 && _tabController.index > 0) {
        newIndex = _tabController.index - 1;
      }
    }

    await _pageController.animateToPage(
      newIndex,
      duration: const Duration(milliseconds: 320),
      curve: Curves.easeOutCubic,
    );
    _tabController.index = newIndex;
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final customColors = Theme.of(context).extension<CustomColors>()!;
    final List<String> tabName = ['ChatApp', 'Moments', 'Hubs', 'Calls'];

    PreferredSizeWidget buildAppBar(int pageIndex) {
      switch (pageIndex) {
        case 0:
          return AppBar(
            elevation: 0,
            backgroundColor: Colors.transparent,
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
            backgroundColor: Colors.transparent,
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
            backgroundColor: Colors.transparent,
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
            backgroundColor: Colors.transparent,
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
        default:
          return null;
      }
    }

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      appBar: buildAppBar(_currentPageIndex), // <-- AppBar is here now
      body: GestureDetector(
        onHorizontalDragStart: _handleHorizontalDragStart,
        onHorizontalDragUpdate: _handleHorizontalDragUpdate,
        onHorizontalDragEnd: _handleHorizontalDragEnd,
        child: PageView(
          controller: _pageController,
          physics: const NeverScrollableScrollPhysics(),
          onPageChanged: (index) {
            setState(() {
              _currentPageIndex = index;
            });
            _tabController.index = index;
          },
          children: [
            // Only bodies, no Scaffold/appBar here!
            ChatsTab(),
            UpdatesTab(),
            HubsTab(),
            CallsTab(),
          ],
        ),
      ),
      floatingActionButton: floatAction(_currentPageIndex),
      bottomNavigationBar: SizedBox(
        height: 60,
        child: TabBar(
          controller: _tabController,
          indicatorColor: theme.colorScheme.primary,
          labelStyle: const TextStyle(fontWeight: FontWeight.bold),
          onTap: (index) {
            _pageController.jumpToPage(index);
          },
          tabs: [
            Tab(
              icon: Icon(Icons.chat, color: theme.textTheme.bodyLarge?.color),
              child: Text(
                "Chats",
                style: TextStyle(
                  color: theme.textTheme.bodyLarge?.color,
                  fontSize: 12,
                ),
              ),
            ),
            Tab(
              icon: Icon(Icons.update, color: theme.textTheme.bodyLarge?.color),
              child: Text(
                "Moments",
                style: TextStyle(
                  color: theme.textTheme.bodyLarge?.color,
                  fontSize: 12,
                ),
              ),
            ),
            Tab(
              icon: Icon(Icons.groups, color: theme.textTheme.bodyLarge?.color),
              child: Text(
                "Hubs",
                style: TextStyle(
                  color: theme.textTheme.bodyLarge?.color,
                  fontSize: 12,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Tab(
              icon: Icon(Icons.call, color: theme.textTheme.bodyLarge?.color),
              child: Text(
                "Calls",
                style: TextStyle(
                  color: theme.textTheme.bodyLarge?.color,
                  fontSize: 12,
                ),
              ),
            ),
          ]
        ),
      ),
    );
  }
}