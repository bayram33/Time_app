import "package:http/http.dart" as http;
import "dart:convert" as convert;
import "package:intl/intl.dart";

class WorldTime {
  String? location;
  String? time;
  String? flag;
  String? url;
  bool? isDaytime;

  WorldTime({this.location, this.flag, this.url});

  Future<void> getTime() async {
    try {
      // make the request
      var response = await http.get(
        Uri.parse("http://worldtimeapi.org/api/timezone/$url"),
      );
      Map data = convert.jsonDecode(response.body);

      // get properties from data
      String offset = data["utc_offset"];
      String offSet = offset.substring(1, 3);
      // create datetime object
      String datetime = data["datetime"];
      DateTime lastDatatime = DateTime.parse(datetime);
      DateTime lastDateTime =
          lastDatatime.add(Duration(hours: int.parse(offSet)));
      // set the time property
      time = DateFormat.jm().format(lastDateTime);
      isDaytime =
          lastDateTime.hour > 6 && lastDateTime.hour <20 ? true : false;
    } catch (e) {
      print(e);
      time = "Couldn't the data from Api";
    }
  }
}
