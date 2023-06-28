import "package:flutter/material.dart";
import "package:world_app/service/worldtime.dart";
import "package:http/http.dart" as http;
import "dart:convert" as convert;
import "package:flutter_spinkit/flutter_spinkit.dart";

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future<void> setupWorldTime() async {
    WorldTime instance = WorldTime(
        location: "Berlin", flag: "germany.png", url: "Europe/Istanbul");
    await instance.getTime();

    //ignore: use_build_context_synchronously
    Navigator.pushReplacementNamed(context, "/loading", arguments: {
      "location": instance.location,
      "flag": instance.flag,
      "time": instance.time,
      "isDaytime": instance.isDaytime,
    });
    
  }

  @override
  void initState() {
    setupWorldTime();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple[300],
      appBar: AppBar(),
      body: const Center(
        child: SpinKitCubeGrid(
          color: Colors.white,
          size: 50,
        ),
      ),
    );
  }
}
