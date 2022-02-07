import 'package:flutter/material.dart';
import 'package:imtihonthird/screens/qazolar/qazolarWidgets.dart';
import 'package:imtihonthird/service/hive_service.dart';

class QazolarPage extends StatefulWidget {
  const QazolarPage({Key? key}) : super(key: key);

  @override
  _QazolarPageState createState() => _QazolarPageState();
}

class _QazolarPageState extends State<QazolarPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            )),
      ),
      body: FutureBuilder(
          future: ServiceHive.getData(),
          builder: (context, AsyncSnapshot snap) {
            if (!snap.hasData) {
              Text("data yo'q");
              return CircularProgressIndicator.adaptive();
            } else if (snap.hasError) {
              return Text("xato bor");
            } else {
              return ListView.builder(
                itemBuilder: (context, index) {
                  print("box3 ni uzunligi ${ServiceHive.box3!.length}");
                  return Column(
                    children: [
                      Dismissible(
                        onDismissed: (v) {
                          setState(() {
                            ServiceHive.box3!.deleteAt(index);
                          });
                        },
                        key: UniqueKey(),
                        child: Container(
                          alignment: Alignment.center,
                          height: 30,
                          width: 150,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(20),
                            ),
                            color: Colors.green.shade200,
                          ),
                          child: Text(
                            ServiceHive.box2!
                                .getAt(index)!
                                .date!
                                .gregorian!
                                .date
                                .toString(),
                            style: TextStyle(fontSize: 20.0),
                          ),
                        ),
                      ),
                      Dismissible(
                        key: UniqueKey(),
                        child: WidgetsForQazolarPage
                            .ListTileOfNamazTimesForQazolarPage(
                                "Bomdod",
                                ServiceHive.box2!
                                    .getAt(index)!
                                    .timings!
                                    .fajr
                                    .toString()),
                      ),
                     
                      Dismissible(
                        key: UniqueKey(),
                        child: WidgetsForQazolarPage
                            .ListTileOfNamazTimesForQazolarPage(
                                "Peshin",
                                ServiceHive.box2!
                                    .getAt(index)!
                                    .timings!
                                    .dhuhr
                                    .toString()),
                      ),
                      Dismissible(
                        key: UniqueKey(),
                        child: WidgetsForQazolarPage
                            .ListTileOfNamazTimesForQazolarPage(
                                "Asr",
                                ServiceHive.box2!
                                    .getAt(index)!
                                    .timings!
                                    .asr
                                    .toString()),
                      ),
                      Dismissible(
                        key: UniqueKey(),
                        child: WidgetsForQazolarPage
                            .ListTileOfNamazTimesForQazolarPage(
                                "Shom",
                                ServiceHive.box2!
                                    .getAt(index)!
                                    .timings!
                                    .maghrib
                                    .toString()),
                      ),
                      Dismissible(
                        key: UniqueKey(),
                        child: WidgetsForQazolarPage
                            .ListTileOfNamazTimesForQazolarPage(
                                "Xufton",
                                ServiceHive.box2!
                                    .getAt(index)!
                                    .timings!
                                    .isha
                                    .toString()),
                        onDismissed: (v) {
                          setState(() {
                            ServiceHive.box3!.deleteAt(index);
                          });
                        },
                      )
                    ],
                  );
                },
                itemCount: 2,
              );
            }
          }),
      
    );
  }
}
