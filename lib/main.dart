import 'package:flutter/material.dart';
import 'package:calendar_view/calendar_view.dart';
import 'package:get/get.dart';
import 'package:ueh_project_admin/constants/app_color.dart';
import 'package:ueh_project_admin/routes/app_pages.dart';
import 'package:ueh_project_admin/routes/route_name.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return CalendarControllerProvider(
      controller: EventController(),
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'UEH Project',
        theme: ThemeData(
          // fontFamily: 'Montserrat',
          // fontFamily: 'Montserrat',
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          backgroundColor: AppColors.greyBackgroundCOlor,
        ),
        initialRoute: RouteNames.signInScreen,
        getPages: AppPages.pages,
        defaultTransition: Transition.cupertino,
      ),
    );
  }
}


// import 'package:flutter/material.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);

//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         // This is the theme of your application.
//         //
//         // Try running your application with "flutter run". You'll see the
//         // application has a blue toolbar. Then, without quitting the app, try
//         // changing the primarySwatch below to Colors.green and then invoke
//         // "hot reload" (press "r" in the console where you ran "flutter run",
//         // or simply save your changes to "hot reload" in a Flutter IDE).
//         // Notice that the counter didn't reset back to zero; the application
//         // is not restarted.
//         primarySwatch: Colors.blue,
//       ),
//       home: const MyHomePage(title: 'Flutter Demo Home Page'),
//     );
//   }
// }

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({Key? key, required this.title}) : super(key: key);

//   final String title;

//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   OverlayState? overlayState;
//   OverlayEntry? overlayEntry;
//   OverlayEntry? overlayEntry2;
//   bool showOverlay = false;
//   int index = 0;
//   List<Widget> widgets = [
//     Container(height: 40, width: 60, color: Colors.transparent),
//     Container(height: 40, width: 60, color: Colors.transparent),
//     Container(
//       height: 300,
//       width: 300,
//       color: Colors.green,
//       child: TextButton(
//         child: Text('Click Me'),
//         onPressed: () {
//           print('Clicked');
//         },
//       ),
//     ),
//     Container(
//       height: 300,
//       width: 300,
//       color: Colors.black,
//       child: TextButton(
//         child: Text('Click Me'),
//         onPressed: () {
//           print('Clicked');
//         },
//       ),
//     ),
//   ];
//   final layerLink = LayerLink();
//   final textButtonFocusNode = FocusNode();
//   final textButtonFocusNode1 = FocusNode();

//   void _showOverlay(BuildContext context, int index) async {
//     overlayState = Overlay.of(context)!;

//     overlayEntry = OverlayEntry(
//         maintainState: true,
//         builder: (context) {
//           return Positioned(
//             left: index == 0
//                 ? MediaQuery.of(context).size.width * 0.43
//                 : MediaQuery.of(context).size.width * 0.5,
//             top: MediaQuery.of(context).size.height * 0.09,
//             child: TextButton(
//               onPressed: () {},
//               onHover: (val) {
//                 if (val && showOverlay) {
//                   if (index == 0) {
//                     textButtonFocusNode.requestFocus();
//                   } else if (index == 1) {
//                     textButtonFocusNode1.requestFocus();
//                   }
//                 } else {
//                   if (index == 0) {
//                     textButtonFocusNode.unfocus();
//                   } else if (index == 1) {
//                     textButtonFocusNode1.unfocus();
//                   }
//                 }
//               },
//               child: widgets[index],
//             ),
//           );
//         });
//     overlayEntry2 = OverlayEntry(
//         maintainState: true,
//         builder: (context) {
//           return Positioned(
//             left: index == 0
//                 ? MediaQuery.of(context).size.width * 0.43
//                 : MediaQuery.of(context).size.width * 0.5,
//             top: MediaQuery.of(context).size.height * 0.13,
//             child: TextButton(
//               onPressed: () {},
//               onHover: (val) {
//                 if (val && showOverlay) {
//                   if (index == 0) {
//                     textButtonFocusNode.requestFocus();
//                   } else if (index == 1) {
//                     textButtonFocusNode1.requestFocus();
//                   }
//                 } else {
//                   if (index == 0) {
//                     textButtonFocusNode.unfocus();
//                   } else if (index == 1) {
//                     textButtonFocusNode1.unfocus();
//                   }
//                 }
//               },
//               child: widgets[index + 2],
//             ),
//           );
//         });

//     // overlayState!.insert(overlayEntry!);
//     overlayState!.insertAll([overlayEntry!, overlayEntry2!]);
//   }

//   void removeOverlay() {
//     overlayEntry!.remove();
//     overlayEntry2!.remove();
//   }

//   @override
//   void initState() {
//     super.initState();
//     textButtonFocusNode.addListener(() {
//       if (textButtonFocusNode.hasFocus) {
//         _showOverlay(context, 0);
//       } else {
//         removeOverlay();
//       }
//     });
//     textButtonFocusNode1.addListener(() {
//       if (textButtonFocusNode1.hasFocus) {
//         _showOverlay(context, 1);
//       } else {
//         removeOverlay();
//       }
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(widget.title),
//       ),
//       body: Container(
//         height: 100,
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             TextButton(
//               focusNode: textButtonFocusNode,
//               onHover: (val) {
//                 if (val) {
//                   textButtonFocusNode.requestFocus();
//                   showOverlay = true;
//                 }
//               },
//               onPressed: () {},
//               child: const Text('Hover'),
//             ),
//             TextButton(
//               focusNode: textButtonFocusNode1,
//               onHover: (val) {
//                 if (val) {
//                   textButtonFocusNode1.requestFocus();
//                   showOverlay = true;
//                 }
//               },
//               onPressed: () {},
//               child: const Text('Hover'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
