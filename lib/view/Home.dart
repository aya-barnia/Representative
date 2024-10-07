// // import 'package:delegate/helper/constant.dart';
// // import 'package:flutter/material.dart';

// // class Home_Page extends StatefulWidget {
// //   const Home_Page({super.key});

// //   @override
// //   State<Home_Page> createState() => _HomePageState();
// // }

// // class _HomePageState extends State<Home_Page> {
// //   String _pageContent = 'كل طلبات الشراء';
// //   // المحتوى الافتراضي

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         backgroundColor: green,
// //       ),
// //       drawer: Drawer(
// //         child: ListView(
// //           padding: EdgeInsets.zero,
// //           children: <Widget>[
// //             DrawerHeader(
// //               decoration: BoxDecoration(
// //                 color: green,
// //               ),
// //               child: Image(
// //                   image: AssetImage('assets/images/basma.png'),
// //                   color: Colors.white38),
// //             ),
// //             SizedBox(
// //               height: 20,
// //             ),
// //             TextButton(
// //               onPressed: () {
// //                 setState(() {
// //                   _pageContent = 'كل طلبات الشراء';
// //                 });
// //                 Navigator.pop(context); // أغلق القائمة الجانبية
// //               },
// //               child: Text(
// //                 'كل طلبات الشراء',
// //                 style: TextStyle(fontSize: 20),
// //               ),
// //             ),
// //             SizedBox(
// //               height: 20,
// //             ),
// //             TextButton(
// //               onPressed: () {
// //                 setState(() {
// //                   _pageContent = 'الطلبات المقبولة';
// //                 });
// //                 Navigator.pop(context); // أغلق القائمة الجانبية
// //               },
// //               child: Text(
// //                 'الطلبات المقبولة',
// //                 style: TextStyle(fontSize: 20),
// //               ),
// //             ),
// //             SizedBox(
// //               height: 20,
// //             ),
// //             TextButton(
// //               onPressed: () {
// //                 setState(() {
// //                   _pageContent = 'الطلبات المستلمة';
// //                 });
// //                 Navigator.pop(context); // أغلق القائمة الجانبية
// //               },
// //               child: Text(
// //                 'الطلبات المستلمة',
// //                 style: TextStyle(fontSize: 20),
// //               ),
// //             ),
// //           ],
// //         ),
// //       ),
// //       body: Center(
// //         child: Text(
// //           _pageContent,
// //           style: TextStyle(fontSize: 24),
// //         ),
// //       ),
// //     );
// //   }
// // }

//////////////////////////////////////////////////////////هوووووووووون

// import 'package:delegate/helper/constant.dart';
// import 'package:delegate/view/Accepted.dart';
// import 'package:delegate/view/Allorders.dart';
// import 'package:delegate/view/Recieved.dart';
// import 'package:flutter/material.dart';

// class Home_Page extends StatefulWidget {
//   const Home_Page({super.key});

//   @override
//   State<Home_Page> createState() => _HomePageState();
// }

// class _HomePageState extends State<Home_Page> {
//   Widget _currentContent = All_Orders();

//   void _updateContent(Widget newContent) {
//     setState(() {
//       _currentContent = newContent;
//     });
//     Navigator.pop(context); // أغلق القائمة الجانبية بعد النقر
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: purple,
//       ),
//       drawer: Drawer(
//         child: ListView(
//           padding: EdgeInsets.zero,
//           children: <Widget>[
//             DrawerHeader(
//               decoration: BoxDecoration(
//                 color: green,
//               ),
//               child: Image(
//                 image: AssetImage('assets/images/basma.png'),
//                 color: Colors.white38,
//               ),
//             ),
//             SizedBox(height: 20),
//             TextButton(
//               onPressed: () {
//                 _updateContent(All_Orders());
//               },
//               child: Text(
//                 'كل طلبات الشراء',
//                 style: TextStyle(fontSize: 20),
//               ),
//             ),
//             SizedBox(height: 20),
//             TextButton(
//               onPressed: () {
//                 _updateContent(Accepted_Orders());
//               },
//               child: Text(
//                 'الطلبات المقبولة',
//                 style: TextStyle(fontSize: 20),
//               ),
//             ),
//             SizedBox(height: 20),
//             TextButton(
//               onPressed: () {
//                 _updateContent(Received_Orders());
//               },
//               child: Text(
//                 'الطلبات المستلمة',
//                 style: TextStyle(fontSize: 20),
//               ),
//             ),
//           ],
//         ),
//       ),
//       body: _currentContent,
//     );
//   }
// }

import 'package:delegate/AllOrders/all_orders_cubit.dart';
import 'package:delegate/view/Recieved.dart';
import 'package:flutter/material.dart';
import 'package:delegate/helper/constant.dart';
import 'package:delegate/view/Accepted.dart';
import 'package:delegate/AllOrders/Allorders.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Home_Page extends StatefulWidget {
  const Home_Page({super.key});

  @override
  State<Home_Page> createState() => _HomePageState();
}

class _HomePageState extends State<Home_Page> {
  String _selectedPage = 'كل طلبات الشراء'; // الصفحة الافتراضية

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          _selectedPage,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
        backgroundColor: purple,
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(color: green),
              child:
                  Image.asset('assets/images/basma.png', color: Colors.white38),
            ),
            SizedBox(
              height: 40,
            ),
            ListTile(
              leading: Icon(
                Icons.arrow_outward_outlined,
                color: green,
              ),

              title: Text(
                'كل طلبات الشراء',
                style: TextStyle(
                    color: purple, fontWeight: FontWeight.bold, fontSize: 20),
              ),
              // Text('الطلبات المستلمة',style: TextStyle(color: green,fontWeight: FontWeight.bold,fontSize: 20),),

              onTap: () {
                setState(() {
                  _selectedPage = 'كل طلبات الشراء';
                });
                Navigator.pop(context);
              },
            ),
            SizedBox(
              height: 30,
            ),
            ListTile(
              leading: Icon(
                Icons.arrow_outward_outlined,
                color: green,
              ),
              title: Text(
                'الطلبات المقبولة',
                style: TextStyle(
                    color: purple, fontWeight: FontWeight.bold, fontSize: 20),
              ),
              onTap: () {
                setState(() {
                  _selectedPage = 'الطلبات المقبولة';
                });
                Navigator.pop(context);
              },
            ),
            SizedBox(
              height: 30,
            ),
            ListTile(
              title: Text(
                'الطلبات المستلمة',
                style: TextStyle(
                    color: purple, fontWeight: FontWeight.bold, fontSize: 20),
              ),
              leading: Icon(
                Icons.arrow_outward_outlined,
                color: green,
              ),
              onTap: () {
                setState(() {
                  _selectedPage = 'الطلبات المستلمة';
                });
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      body: _selectedPage == 'كل طلبات الشراء'
          // ? All_Orders()
          ? BlocProvider(
              create: (BuildContext context) => OrdersCubit(),
              child: All_Orders(),
            )
          : _selectedPage == 'الطلبات المقبولة'
              // ? Accepted_Orders()
              ? BlocProvider(
              create: (BuildContext context) => OrdersCubit(),
              child: Accepted_Orders(),
            )
              // : Received_Orders(),
              : BlocProvider(
              create: (BuildContext context) => OrdersCubit(),
              child: Received_Orders(),
            )
    );
  }
}
