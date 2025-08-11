import 'package:flutter/material.dart';


void main(){
  runApp(const MyApp());
}



class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title: 'golden boy',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor:  Colors.green)
      ),
      home: const MyHomePage(title: 'Golden boy home page')
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar( 

      ),
      body: Center(
        
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[const Text('the chicken nudles soup is magnificent')],
        )
      ),
      );
  }
}