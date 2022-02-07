import 'dart:io';

import 'package:dio/dio.dart';
import 'package:hive/hive.dart';
import 'package:imtihonthird/models/post_model.dart';
import 'package:path_provider/path_provider.dart';

class ServiceHive {
  static Box<Datum>? box2;
  //box3 opened for qazahs
  static Box<Datum>? box3;

  static Future initHive() async {
    Directory dir = await getApplicationDocumentsDirectory();
    Directory dir2 = await getApplicationDocumentsDirectory();

    Hive.init(dir.path);
    Hive.init(dir2.path);

    box2 = await Hive.openBox('post_data3');
    box3 = await Hive.openBox('post_data4');

  }

  static Future putDataToBox(List<Datum> data) async {
    box3!.clear();
    box2!.clear();
    for (Datum item in data) {
      box2!.add(item);
      //box3 added for qazahs
      box3!.add(item);
    }
  }

  static Future<List<Datum>> getData() async {
    await initHive();
    Response res = await Dio().get(
        'https://api.aladhan.com/v1/calendarByCity?city=Tashkent&country=Uzbekistan&method=2&month=2&year=2022');

    List<Datum> posts =
        (res.data["data"] as List).map((e) => Datum.fromJson(e)).toList();
    await putDataToBox(posts);
    return posts;
  }

  static regitserAllAdapters() {
    Hive.registerAdapter(WelcomeAdapter());
    Hive.registerAdapter(DatumAdapter());
    Hive.registerAdapter(DateAdapter());
    Hive.registerAdapter(GregorianAdapter());
    Hive.registerAdapter(DesignationAdapter());
    Hive.registerAdapter(GregorianMonthAdapter());
    Hive.registerAdapter(GregorianWeekdayAdapter());
    Hive.registerAdapter(HijriAdapter());
    Hive.registerAdapter(HijriMonthAdapter());
    Hive.registerAdapter(HijriWeekdayAdapter());
    Hive.registerAdapter(MetaAdapter());
    Hive.registerAdapter(MethodAdapter());
    Hive.registerAdapter(LocationAdapter());
    Hive.registerAdapter(ParamsAdapter());
    Hive.registerAdapter(TimingsAdapter());
  }
}
