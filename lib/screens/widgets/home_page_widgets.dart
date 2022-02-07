import 'package:flutter/material.dart';
import 'package:flutter_alarm_clock/flutter_alarm_clock.dart';

class WidgetsForUi {
  static ListTileOfNamazTimes(
    String NamazName,
    String NamazTime,
  ) {
    List hour = [];
    List minuts = [];
    List time = NamazTime.split(":");

    for (var i = 0; i < 1; i++) {
      for (var j = 0; j < 2; j++) {
        if (time[i][j] != "0") {
          hour.add(time[i][j]);
        }
      }
    }
    for (var i = 1; i < 2; i++) {
      for (var j = 0; j < 2; j++) {
        if (time[i][j] != "0") {
          minuts.add(time[i][j]);
        }
      }
    }
    int realhour = int.parse(hour.join());
    int realmenut = int.parse(minuts.join());

    
    return Card(
      color: Colors.black87,
      child: ListTile(
          contentPadding:
              EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
          leading: Container(
              padding: EdgeInsets.only(right: 12.0),
              decoration: new BoxDecoration(
                  border: new Border(
                      right:
                          new BorderSide(width: 1.0, color: Colors.white24))),
              child: Text(
                "${NamazTime}",
                style: TextStyle(color: Colors.white),
              )),
          title: Text(
            "${NamazName}",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          subtitle: Row(
            children: <Widget>[
              Icon(Icons.linear_scale, color: Colors.yellowAccent),
              Text("", style: TextStyle(color: Colors.white))
            ],
          ),
          trailing: IconButton(
              icon: Icon(
                Icons.alarm,
                color: Colors.amber,
              ),
              onPressed: () {
                FlutterAlarmClock.createAlarm(realhour, realmenut);
              })),
    );
  }
}
