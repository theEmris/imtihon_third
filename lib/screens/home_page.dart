import 'package:flutter/material.dart';
import 'package:imtihonthird/screens/widgets/home_page_widgets.dart';
import 'package:imtihonthird/screens/widgets/listOfActivities.dart';
import 'package:imtihonthird/service/hive_service.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Color tileColor = Colors.transparent;
  Color colorOfAlarm = Colors.transparent;
  int son = DateTime.now().day - 1;

  @override
  Widget build(BuildContext context) {
    debugPrint("bugungi kun" + son.toString());

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/mainImage.jpg"), fit: BoxFit.cover),
        ),
        child: CustomScrollView(
          slivers: [
            HomePageAppBar(),
            circularAvatarsForScreens(),
          ],
        ),
      ),
      
    );
  }

  SliverAppBar HomePageAppBar() {
    return SliverAppBar(
        backgroundColor: Colors.transparent,
        pinned: true,
        floating: true,
        expandedHeight: MediaQuery.of(context).size.height * 0.75,
        flexibleSpace: FlexibleSpaceBar(
            background: Container(
                width: 350,
                margin: const EdgeInsets.only(bottom: 25),
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.5),
                      offset: const Offset(5, 10),
                      spreadRadius: 3,
                      blurRadius: 10,
                    ),
                  ],
                  color: Colors.green.shade100.withOpacity(0.5),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(20),
                  ),
                ),
                child: FutureBuilder(
                    future: ServiceHive.getData(),
                    builder: (context, AsyncSnapshot snap) {
                      if (!snap.hasData) {
                        return Center(
                          child: CircularProgressIndicator.adaptive(),
                        );
                      } else if (snap.hasError) {
                        return Center(
                          child: Text("xato bor"),
                        );
                      } else {
                        return ListView.builder(
                          itemBuilder: (context, index) {
                            int son2 = int.parse(ServiceHive.box2!
                                .getAt(index)!
                                .date!
                                .gregorian!
                                .day!);
                            
                              son2 == son ? son = 0: son;

                            return Column(
                              children: [
                                timerForToday(index),
                                WidgetsForUi.ListTileOfNamazTimes(
                                    "Bomdod",
                                    ServiceHive.box2!
                                        .getAt(index + son)!
                                        .timings!
                                        .fajr
                                        .toString()),
                                WidgetsForUi.ListTileOfNamazTimes(
                                    "Quyosh",
                                    ServiceHive.box2!
                                        .getAt(index + son)!
                                        .timings!
                                        .sunrise
                                        .toString()),
                                WidgetsForUi.ListTileOfNamazTimes(
                                    "Peshin",
                                    ServiceHive.box2!
                                        .getAt(index + son)!
                                        .timings!
                                        .dhuhr
                                        .toString()),
                                WidgetsForUi.ListTileOfNamazTimes(
                                    "Asr",
                                    ServiceHive.box2!
                                        .getAt(index + son)!
                                        .timings!
                                        .asr
                                        .toString()),
                                WidgetsForUi.ListTileOfNamazTimes(
                                    "Shom",
                                    ServiceHive.box2!
                                        .getAt(index + son)!
                                        .timings!
                                        .maghrib
                                        .toString()),
                                WidgetsForUi.ListTileOfNamazTimes(
                                    "Xufton",
                                    ServiceHive.box2!
                                        .getAt(index + son)!
                                        .timings!
                                        .isha
                                        .toString()),
                              ],
                            );
                          },
                          itemCount: 1,
                        );
                      }
                    }))));
  }

  Container timerForToday(int index) {
    return Container(
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
        ServiceHive.box2!.getAt(index + son)!.date!.gregorian!.date.toString(),
        style: TextStyle(fontSize: 20.0),
      ),
    );
  }

  SliverGrid circularAvatarsForScreens() {
    return SliverGrid(
        delegate: SliverChildBuilderDelegate((context, index) {
          return InkWell(
            onTap: () {
              Navigator.pushNamed(
                  context, Activities.activies[index]["router"]);
            },
            child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 70,
                        backgroundImage:
                            AssetImage(Activities.activies[index]["image"])),
                    Text(
                      "${Activities.activies[index]["title"]}",
                      style: TextStyle(fontSize: 23, color: Colors.greenAccent),
                    ),
                  ],
                )),
          );
        }, childCount: Activities.activies.length),
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2));
  }
}
