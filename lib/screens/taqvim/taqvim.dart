import 'package:flutter/material.dart';
import 'package:imtihonthird/models/post_model.dart';
import 'package:imtihonthird/service/hive_service.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class Taqvim extends StatefulWidget {
  const Taqvim({Key? key}) : super(key: key);

  @override
  _TaqvimState createState() => _TaqvimState();
}

class _TaqvimState extends State<Taqvim> {
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
       appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white70,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(Icons.arrow_back_ios,color: Colors.black,),
        ),
      ),
        body: FutureBuilder(
      future: ServiceHive.getData(),
      builder: (context, AsyncSnapshot<List<Datum>> snap) {
        if (!snap.hasData) {
          return Center(
            child:
                LoadingAnimationWidget.inkDrop(color: Colors.orange, size: 70),
          );
        } else if (snap.hasError) {
          return Center(child:Text("error with APi")
          );
        } else {
          return ListView.builder(
            itemBuilder: (context, index) {
              return Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Container(
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
                            .getAt(index + 5)!
                            .date!
                            .gregorian!
                            .date
                            .toString(),
                        style: TextStyle(fontSize: 20.0),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          "Bomdod:",
                          style: TextStyle(fontSize: 20.0),
                        ),
                        Text(
                          "${ServiceHive.box2!.getAt(index+5)!.timings!.fajr.toString()}",
                          style: TextStyle(fontSize: 20.0),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        CircleAvatar(
                          radius: 18,
                          backgroundImage: AssetImage("assets/sun.jpeg")
                        ),
                        Text(
                            "${ServiceHive.box2!.getAt(index + 5)!.timings!.sunrise.toString()}",
                            style: TextStyle(fontSize: 20.0)),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          "Peshin:",
                          style: TextStyle(fontSize: 20.0),
                        ),
                        Text(
                          "${ServiceHive.box2!.getAt(index + 5)!.timings!.dhuhr.toString()}",
                          style: TextStyle(fontSize: 20.0),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          "Asir:",
                          style: TextStyle(fontSize: 20.0),
                        ),
                        Text(
                          "${ServiceHive.box2!.getAt(index + 5)!.timings!.asr.toString()}",
                          style: TextStyle(fontSize: 20.0),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          "Shom:",
                          style: TextStyle(fontSize: 20.0),
                        ),
                        Text(
                          "${ServiceHive.box2!.getAt(index + 5)!.timings!.maghrib.toString()}",
                          style: TextStyle(fontSize: 20.0),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          "Xufton:",
                          style: TextStyle(fontSize: 20.0),
                        ),
                        Text(
                          "${ServiceHive.box2!.getAt(index + 5)!.timings!.isha.toString()}",
                          style: TextStyle(fontSize: 20.0),
                        ),
                      ],
                    ),
                  ],
                ),
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
              );
            },
            itemCount: 5,
          );
        }
      },
    ));
  }
}
