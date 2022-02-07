import 'package:flutter/material.dart';

class WidgetsForQazolarPage {
  static ListTileOfNamazTimesForQazolarPage(
    String NamazName,
    String NamazTime,
  ) {
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
          ),
    );
  }
}
