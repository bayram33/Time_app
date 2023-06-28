import "package:flutter/material.dart";
import "package:http/http.dart" as http;
import "dart:convert" as convert;

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  Map data = {};

  @override
  Widget build(BuildContext context) {
    data = data.isNotEmpty
        ? data
        : ModalRoute.of(context)!.settings.arguments as Map;
    print(data);

    String bgImage = data["isDaytime"] ? "day.png" : "night.png";
    print(bgImage);

    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/$bgImage"),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 150, 0, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      data["location"],
                      style: const TextStyle(
                        fontSize: 25,
                        letterSpacing: 2,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Text(
                data["time"],
                style: const TextStyle(
                  fontSize: 66,
                ),
              ),
              TextButton.icon(
                onPressed: () async {
                  dynamic result =
                      await Navigator.pushNamed(context, "/location");
                  setState(() {
                    data = {
                      "location": result["location"],
                      "flag": result["flag"],
                      "time": result["time"],
                      "isDaytime": result["isDaytime"],
                    };
                  });
                },
                icon:
                    const Icon(Icons.location_on_outlined, color: Colors.black),
                label: const Text(
                  "Edit Location",
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
