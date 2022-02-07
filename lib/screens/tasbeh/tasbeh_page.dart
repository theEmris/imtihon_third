import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class TasbehPage extends StatefulWidget {
  const TasbehPage({Key? key}) : super(key: key);

  @override
  _TasbehPageState createState() => _TasbehPageState();
}

class _TasbehPageState extends State<TasbehPage> {
  int times = 0;
  int counter = 0;
  int realTime = 0;
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
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/tasbehMainPage.png"),
                fit: BoxFit.cover)),
        child: Column(
          children: [
            SizedBox(
              height: 200,
            ),
            Expanded(
              child: Center(
                child: Column(
                  children: [
                    Text(
                      "${funksiya(counter)}",
                      style: TextStyle(fontSize: 43, color: Colors.red),
                    ),
                    Container(
                      alignment: Alignment.center,
                      height: 100,
                      width: 100,
                      child: Text(
                        "${times}/${realTime}",
                        style: TextStyle(fontSize: 43, color: Colors.red),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Expanded(
                child: Center(
              child: InkWell(
                splashColor: Colors.green,
                highlightColor: Colors.green,
                onTap: () {
                  counter += 1;
                  if (counter == 99) {
                    times += 1;
                    counter = 0;
                  }

                  realTime += 1;
                  if (realTime == 33) {
                    realTime = 0;
                  }
                  setState(() {});
                },
                child: CircleAvatar(
                    child: Text(
                      "$realTime",
                      style: TextStyle(fontSize: 33, color: Colors.green),
                    ),
                    backgroundColor: Colors.white70,
                    radius: 50,
                    backgroundImage: AssetImage("assets/fingerPrint.png")),
              ),
            ))
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          counter = 0;
          realTime = 0;
          setState(() {});
        },
        child: Icon(Icons.refresh),
      ),
    );
  }

  funksiya(int son) {
    if (son > 99) {
      son = 0;
      setState(() {});
    } else if (son >= 0 && son <= 33) {
      return "Subhanalloh";
    } else if (son >= 33 && son <= 66) {
      return "Alhamdullillah";
    } else if (son >= 67 && son <= 99) {
      return "Allohu Akbar";
    }
  }
}
