import "package:flutter/material.dart";
import "package:world_app/loading.dart";
import "package:world_app/location.dart";
import "homapage.dart";

void main() {
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner:false,
      theme: ThemeData(
        primarySwatch: Colors.deepPurple
      ),
      initialRoute: "/",
      routes: {
        "/": (context) => const HomePage(),
        "/location": (context) => const Location(),
        "/loading":(context) => const Loading(),
      },
    );
  }
}
