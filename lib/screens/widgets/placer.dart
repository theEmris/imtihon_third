// // class Placer {
// //   static String placeNamer = "Tashkent";
// // }

// //  SliverAppBar scrollable() {
// //     return SliverAppBar(
// //           backgroundColor: Colors.transparent,
// //           pinned: false,
// //           expandedHeight: 300,
// //           flexibleSpace: FlexibleSpaceBar(
// //             background: CarouselSlider.builder(
// //               carouselController: _controller,
              
// //               itemCount: 0,
// //               itemBuilder: (context, index, pagein) {
// //                 return FutureBuilder(
// //                     future: ServiceHive.getData(),
// //                     builder: (context, AsyncSnapshot snap) {
// //                       return  Container(
// //     child: Column(
// //       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
// //       crossAxisAlignment: CrossAxisAlignment.stretch,
// //       children: [
// //         Container(
// //           alignment: Alignment.center,
// //           height: 30,
// //           width: 150,
// //           decoration: BoxDecoration(
// //             borderRadius: BorderRadius.all(Radius.circular(20),
            
// //             ),
// //             color: Colors.green.shade200,
// //           ),
// //           child:   Text( ServiceHive.box2!.getAt(index)!.date!.gregorian!.date.toString(),
// //           style: TextStyle(fontSize: 20.0),),

// //         ),

// //         Row(
// //           mainAxisAlignment: MainAxisAlignment.spaceAround,
// //           children: [
// //           Text("Bomdod:",style: TextStyle(fontSize: 20.0),),
// //           Text("${ServiceHive.box2!.getAt(index)!.timings!.fajr.toString()}",style: TextStyle(fontSize: 20.0),),
// //         ],),
// //         Row(
// //           mainAxisAlignment: MainAxisAlignment.spaceAround,
// //           children: [
// //           CircleAvatar(
// //             radius: 18,
// //             backgroundImage: NetworkImage("https://previews.123rf.com/images/jpgon/jpgon1505/jpgon150500948/40067962-illustration-of-a-sun-icon-with-a-an-islam-sign.jpg",
// //             ),
// //           ),
// //           Text("${ServiceHive.box2!.getAt(index)!.timings!.sunrise.toString()}",style: TextStyle(fontSize: 20.0)),
// //         ],),
            
// //         Row(
// //           mainAxisAlignment: MainAxisAlignment.spaceAround,
// //           children: [
// //           Text("Peshin:",style: TextStyle(fontSize: 20.0),),
// //           Text("${ServiceHive.box2!.getAt(index)!.timings!.dhuhr.toString()}",style: TextStyle(fontSize: 20.0),),
// //         ],),
        
// //         Row(
// //           mainAxisAlignment: MainAxisAlignment.spaceAround,
// //           children: [
// //           Text("Asir:",style: TextStyle(fontSize: 20.0),),
// //           Text("${ServiceHive.box2!.getAt(index)!.timings!.asr.toString()}",style: TextStyle(fontSize: 20.0),),
// //         ],),
// //         Row(
// //           mainAxisAlignment: MainAxisAlignment.spaceAround,
// //           children: [
// //           Text("Shom:",style: TextStyle(fontSize: 20.0),),
// //           Text("${ServiceHive.box2!.getAt(index)!.timings!.maghrib.toString()}",style: TextStyle(fontSize: 20.0),),
// //         ],),
// //         Row(
// //           mainAxisAlignment: MainAxisAlignment.spaceAround,
// //           children: [
// //           Text("Xufton:",style: TextStyle(fontSize: 20.0),),
// //           Text("${ServiceHive.box2!.getAt(index)!.timings!.isha.toString()}",style: TextStyle(fontSize: 20.0),),
// //         ],),
        
       

// //       ],
// //     ),
// //     width: 350,
// //     margin: const EdgeInsets.only(bottom: 25),
// //     decoration: BoxDecoration(
// //       boxShadow: [
// //         BoxShadow(
// //           color: Colors.black.withOpacity(0.5),
// //           offset: const Offset(5, 10),
// //           spreadRadius: 3,
// //           blurRadius: 10,
// //         ),
// //       ],
// //       color: Colors.green.shade100.withOpacity(0.5),
// //       borderRadius: const BorderRadius.all(
// //         Radius.circular(20),
// //       ),
// //     ),
// //   );
// //                     });
// //               },
// //               options: CarouselOptions(
// //                 autoPlay: true,
// //                 height: 400,
// //                 enlargeCenterPage: true,
// //                 autoPlayCurve: Curves.easeInCirc,
// //                 autoPlayInterval: Duration(seconds: 2),
// //               ),
// //             ),
// //           ),
// //         );
// //   }

  

// // }






// import 'package:carousel_slider/carousel_slider.dart';
// import 'package:flutter/material.dart';
// import 'package:hive/hive.dart';
// import 'package:imtihonthird/models/post_model.dart';
// import 'package:imtihonthird/service/hive_service.dart';

// class HowToUseValueLisenable extends StatefulWidget {
//   const HowToUseValueLisenable({ Key? key }) : super(key: key);

//   @override
//   _HowToUseValueLisenableState createState() => _HowToUseValueLisenableState();
// }

// class _HowToUseValueLisenableState extends State<HowToUseValueLisenable> {
//   Box<Datum>? hereBox;
//   List keys = [];
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: FutureBuilder(
//         future: ServiceHive.getData(),
//         builder:(context,AsyncSnapshot snap){

//           return  Container(
//           child: CarouselSlider.builder(
//         itemCount:5 ,
//         options: CarouselOptions(
//           aspectRatio: 2.0,
//           enlargeCenterPage: true,
//           autoPlay: true,
//         ),
//         itemBuilder: (ctx, index, realIdx) {
//           return Container(
//             child: Text(index.toString()),
//           );
        

//         }
      
//       )
      
//     );
//   }
// }