import "package:flutter/material.dart";
import "package:world_app/service/worldtime.dart";

class Location extends StatefulWidget {
  const Location({super.key});

  @override
  State<Location> createState() => _LocationState();
}

class _LocationState extends State<Location> {
  List<WorldTime> locations = [
    WorldTime(url: "Europe/Istanbul", location: "İstanbul", flag: "tr.jpg"),
    WorldTime(url: 'Europe/London', location: 'London', flag: 'uk.png'),
    WorldTime(url: 'Europe/Berlin', location: 'Athens', flag: 'greece.png'),
    WorldTime(url: 'Africa/Cairo', location: 'Cairo', flag: 'egypt.png'),
    WorldTime(url: 'Africa/Nairobi', location: 'Nairobi', flag: 'kenya.png'),
    WorldTime(url: 'America/New_York', location: 'New York', flag: 'usa.png'),
    WorldTime(url: 'Asia/Seoul', location: 'Seoul', flag: 'south_korea.png'),
    WorldTime(url: 'Asia/Jakarta', location: 'Jakarta', flag: 'indonesia.png'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("location page"),
      ),
      body: ListView.builder(
        itemCount: locations.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 1, horizontal: 10),
            child: Card(
              child: ListTile(
                onTap: () async {
                  await locations[index].getTime();
                  // ignore: use_build_context_synchronously
                  Navigator.pop(
                    context,
                    {
                      "location": locations[index].location,
                      "flag": locations[index].flag,
                      "time": locations[index].time,
                      "isDaytime": locations[index].isDaytime,
                    },
                  );
                },
                title: Text("${locations[index].location}"),
                leading: CircleAvatar(
                  backgroundImage:
                      AssetImage("assets/${locations[index].flag}"),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
