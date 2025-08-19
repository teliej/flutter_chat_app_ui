import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'screens/home_page.dart';
import 'theme_provider.dart';
import 'services/mock_data_service.dart';
import 'theme.dart';

// import 'package:flutter/foundation.dart';

void main() async {
  // runApp(const WhatsAppClone());
  WidgetsFlutterBinding.ensureInitialized();
  await MockDataService().loadAllData(); // Load once

  runApp(
    ChangeNotifierProvider(
      create: (_) => ThemeProvider(),
      child: const WhatsAppClone(),
    ),
  );
}

class WhatsAppClone extends StatelessWidget {
  const WhatsAppClone({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return MaterialApp(
      title: 'WhatsApp Clone',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: themeProvider.themeMode, // to switch on command
      // themeMode: ThemeMode.system, // auto-switches
      home: const HomePage(),
    );
  }
}