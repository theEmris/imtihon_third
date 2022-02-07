import 'package:flutter/material.dart';
import 'package:imtihonthird/screens/widgets/listOfSuras.dart';

class QuranSuras extends StatefulWidget {
  const QuranSuras({Key? key}) : super(key: key);

  @override
  _QuranSurasState createState() => _QuranSurasState();
}

class _QuranSurasState extends State<QuranSuras> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("Quron Suralari",style:TextStyle(color: Colors.black) ,),
          centerTitle: true,
          backgroundColor:Colors.white70,
          elevation: 0,
          leading: IconButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        icon: Icon(Icons.arrow_back_ios,color: Colors.black,),
      )),
      backgroundColor: Colors.white70,
      body: SurasBuilder(),
    );
  }

  ListView SurasBuilder() {
    return ListView.builder(
      itemBuilder: (context, index) {
        return Card(
          color: Colors.amberAccent,
          child: ListTile(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  "${SuraNames[index]["arabic"]}",
                  style: TextStyle(fontSize: 27),
                ),
                Text(
                  "(${SuraNames[index]["name"]})",
                ),
              ],
            ),
            leading: Text("${SuraNames[index]["surahNo"].toString()} - sura"),
            subtitle: Text("${SuraNames[index]["meaning"]}"),
            trailing: IconButton(
              icon: Icon(Icons.play_arrow),
              onPressed: () {},
            ),
          ),
        );
      },
      itemCount: SuraNames.length,
    );
  }
}
