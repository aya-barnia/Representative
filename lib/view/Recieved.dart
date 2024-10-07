// import 'package:delegate/helper/constant.dart';
// import 'package:delegate/AllOrders/Allorders.dart';
// import 'package:flutter/material.dart';

// class Received_Orders extends StatefulWidget {
//   const Received_Orders({super.key});

//   @override
//   State<Received_Orders> createState() => _ReceivedOrdersContentState();
// }
// final List<Map<String, String>> orders = [
//   {
//     'productImage': 'assets/images/2.jpeg',
//     'productName': 'تلفاز',
//     'productLocation': 'مزة',
//     'buyerAddress': 'كفرسوسة',
//   },
//   {
//     'productImage': 'assets/images/1.png',
//     'productName': 'مكواة',
//     'productLocation': 'شارع بغداد',
//     'buyerAddress': 'مزة',
//   },
//   {
//     'productImage': 'assets/images/3.jpg',
//     'productName': 'قميص رجالي',
//     'productLocation': 'كفرسوسة',
//     'buyerAddress': 'الميدان',
//   },
//   {
//     'productImage': 'assets/images/pencil.png',
//     'productName': 'قلم',
//     'productLocation': 'باب توما',
//     'buyerAddress': 'الطلياني',
//   },
//   // يمكنك إضافة المزيد من الطلبات هنا بنفس الطريقة
// ];
// class _ReceivedOrdersContentState extends State<Received_Orders> {
//   @override
//   Widget build(BuildContext context) {
//    return Scaffold(
//       body: ListView.builder(
//         itemCount: orders.length,
//         itemBuilder: (context, index) {
//           final order = orders[index];
//           return Card(
//             margin: EdgeInsets.all(20),
//             child: Padding(
//               padding: const EdgeInsets.all(16.0),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Center(child: Image.asset(order['productImage']!)),
//                   SizedBox(height: 8.0),
//                   Text(
//                     order['productName']!,
//                     style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//                   ),
//                   SizedBox(height: 8.0),
//                   Text('Seller Address: ${order['productLocation']}'),
//                   SizedBox(height: 8.0),
//                   Text('Buyer Address: ${order['buyerAddress']}'),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                     children: [
//                       SizedBox(
//                         height: 20,
//                       ),
//                       ElevatedButton(
//                         onPressed: () {
//                           // Handle استلام button press
//                           print('استلام pressed');
//                         },
//                         child: Row(
//                           children: [
//                             Icon(Icons.check,color: green,),
//                             Text('تم التسليم'),
//                           ],
//                         ),
//                       ),
//                       ElevatedButton(
//                         onPressed: () {
//                           showDialog(
//                             context: context,
//                             builder: (BuildContext context) {
//                               return AlertDialog(
//                                 title: Text('سبب الرفض'),
//                                 content: TextField(
//                                   decoration: InputDecoration(
//                                       hintText: 'أدخل السبب هنا'),
//                                 ),
//                                 actions: [
//                                   TextButton(
//                                     onPressed: () {
//                                       Navigator.pop(context); // إغلاق الحوار
//                                     },
//                                     child: Text('إلغاء'),
//                                   ),
//                                   ElevatedButton(
//                                     onPressed: () {
//                                       // هنا يمكنك إرسال السبب إلى الخادم أو تخزينه محليًا
//                                       Navigator.pop(context); // إغلاق الحوار
//                                     },
//                                     child: Text('إرسال'),
//                                   ),
//                                 ],
//                               );
//                             },
//                           );
//                         },
//                         child: Row(
//                           children: [
//                             Icon(Icons.close),
//                             Text('رفض التسليم'),
//                           ],
//                         ),
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }



import 'package:delegate/AllOrders/all_orders_cubit.dart';
import 'package:delegate/AllOrders/all_orders_model.dart';
import 'package:delegate/AllOrders/all_orders_state.dart';
import 'package:delegate/Login/login_cubit.dart';
import 'package:delegate/helper/constant.dart';
import 'package:delegate/AllOrders/Allorders.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Received_Orders extends StatefulWidget {
  // const Received_Orders({super.key});

  @override
  State<Received_Orders> createState() => _ReceivedOrdersContentState();
}

class _ReceivedOrdersContentState extends State<Received_Orders> {
    List<AllOrderModel> recieve = [];

    
  @override
  void initState() {
    super.initState();

    OrdersCubit.get(context).GetRecievedOrder();
  }

  @override
  Widget build(BuildContext context) {

      return BlocConsumer<OrdersCubit, AllOrdersState>(
         listener: (BuildContext context, Object state) {
      // if (state is GetRecievedOrders) {
      //   print('i am in listen');
      //   print(state.rec.toString());
          
      //   Navigator.push(
      //       context,
      //       MaterialPageRoute(
      //           builder: (BuildContext context) => Received_Orders()));
        
      // }
          },
          builder: (BuildContext context, Object state){
      if (state is LoadingRecievedOrdersState) {
        return Scaffold(
          body: Center(
            child: CircularProgressIndicator(
              color: yellow,
            ),
          ),
          // body: Center(
          //   child: Image(image: AssetImage('assets/images/green_heart.gif')),
          // ),
        );
      }
      if (state is GetRecievedOrders) {
        this.recieve = state.rec;
         return Scaffold(
      body: ListView.builder(
        itemCount: recieve.length,
        itemBuilder: (context, index) {
              final order = recieve[index];
          return Card(
            margin: EdgeInsets.all(20),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(child: Image(
                            image: NetworkImage(
                                recieve[index].product_imagepath!)),),
                  SizedBox(height: 8.0),
                  Text(
                     recieve[index].product_name.toString(),
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8.0),
                  Text('Seller Address: ${recieve[index].seller_address.toString()}'),
                  SizedBox(height: 8.0),
                  Text('Buyer Address: ${recieve[index].address.toString()}'),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          // Handle استلام button press
                          print('استلام pressed');
                        },
                        child: Row(
                          children: [
                            Icon(Icons.check,color: green,),
                            Text('تم التسليم'),
                          ],
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: Text('سبب الرفض'),
                                content: TextField(
                                  decoration: InputDecoration(
                                      hintText: 'أدخل السبب هنا'),
                                ),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.pop(context); // إغلاق الحوار
                                    },
                                    child: Text('إلغاء'),
                                  ),
                                  ElevatedButton(
                                    onPressed: () {
                                      // هنا يمكنك إرسال السبب إلى الخادم أو تخزينه محليًا
                                      Navigator.pop(context); // إغلاق الحوار
                                    },
                                    child: Text('إرسال'),
                                  ),
                                ],
                              );
                            },
                          );
                        },
                        child: Row(
                          children: [
                            Icon(Icons.close),
                            Text('رفض التسليم'),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
          ); 
      
      }
      else{
         return Scaffold(
        body: Center(
          child: Text('data'),
        ),
      );

  //  return Scaffold(
  //     body: ListView.builder(
  //       itemCount: recieve.length,
  //       itemBuilder: (context, index) {
  //         final order = recieve[index];
  //         return Card(
  //           margin: EdgeInsets.all(20),
  //           child: Padding(
  //             padding: const EdgeInsets.all(16.0),
  //             child: Column(
  //               crossAxisAlignment: CrossAxisAlignment.start,
  //               children: [
  //                 Center(child: Image(
  //                           image: NetworkImage(
  //                              order.product_imagepath!)),),
  //                 SizedBox(height: 8.0),
  //                 Text(
  //                   order.product_name!,
  //                   style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
  //                 ),
  //                 SizedBox(height: 8.0),
  //                 Text('Seller Address: ${order.seller_address}'),
  //                 SizedBox(height: 8.0),
  //                 Text('Buyer Address: ${order.address}'),
  //                 Row(
  //                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  //                   children: [
  //                     SizedBox(
  //                       height: 20,
  //                     ),
  //                     ElevatedButton(
  //                       onPressed: () {
  //                         // Handle استلام button press
  //                         print('استلام pressed');
  //                       },
  //                       child: Row(
  //                         children: [
  //                           Icon(Icons.check,color: green,),
  //                           Text('تم التسليم'),
  //                         ],
  //                       ),
  //                     ),
  //                     ElevatedButton(
  //                       onPressed: () {
  //                         showDialog(
  //                           context: context,
  //                           builder: (BuildContext context) {
  //                             return AlertDialog(
  //                               title: Text('سبب الرفض'),
  //                               content: TextField(
  //                                 decoration: InputDecoration(
  //                                     hintText: 'أدخل السبب هنا'),
  //                               ),
  //                               actions: [
  //                                 TextButton(
  //                                   onPressed: () {
  //                                     Navigator.pop(context); // إغلاق الحوار
  //                                   },
  //                                   child: Text('إلغاء'),
  //                                 ),
  //                                 ElevatedButton(
  //                                   onPressed: () {
  //                                     // هنا يمكنك إرسال السبب إلى الخادم أو تخزينه محليًا
  //                                     Navigator.pop(context); // إغلاق الحوار
  //                                   },
  //                                   child: Text('إرسال'),
  //                                 ),
  //                               ],
  //                             );
  //                           },
  //                         );
  //                       },
  //                       child: Row(
  //                         children: [
  //                           Icon(Icons.close),
  //                           Text('رفض التسليم'),
  //                         ],
  //                       ),
  //                     ),
  //                   ],
  //                 ),
  //               ],
  //             ),
  //           ),
  //         );
  //       },
  //     ),
  //   );

      }
          }
      );




  //  return Scaffold(
  //     body: ListView.builder(
  //       itemCount: orders.length,
  //       itemBuilder: (context, index) {
  //         final order = orders[index];
  //         return Card(
  //           margin: EdgeInsets.all(20),
  //           child: Padding(
  //             padding: const EdgeInsets.all(16.0),
  //             child: Column(
  //               crossAxisAlignment: CrossAxisAlignment.start,
  //               children: [
  //                 Center(child: Image.asset(order['productImage']!)),
  //                 SizedBox(height: 8.0),
  //                 Text(
  //                   order['productName']!,
  //                   style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
  //                 ),
  //                 SizedBox(height: 8.0),
  //                 Text('Seller Address: ${order['productLocation']}'),
  //                 SizedBox(height: 8.0),
  //                 Text('Buyer Address: ${order['buyerAddress']}'),
  //                 Row(
  //                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  //                   children: [
  //                     SizedBox(
  //                       height: 20,
  //                     ),
  //                     ElevatedButton(
  //                       onPressed: () {
  //                         // Handle استلام button press
  //                         print('استلام pressed');
  //                       },
  //                       child: Row(
  //                         children: [
  //                           Icon(Icons.check,color: green,),
  //                           Text('تم التسليم'),
  //                         ],
  //                       ),
  //                     ),
  //                     ElevatedButton(
  //                       onPressed: () {
  //                         showDialog(
  //                           context: context,
  //                           builder: (BuildContext context) {
  //                             return AlertDialog(
  //                               title: Text('سبب الرفض'),
  //                               content: TextField(
  //                                 decoration: InputDecoration(
  //                                     hintText: 'أدخل السبب هنا'),
  //                               ),
  //                               actions: [
  //                                 TextButton(
  //                                   onPressed: () {
  //                                     Navigator.pop(context); // إغلاق الحوار
  //                                   },
  //                                   child: Text('إلغاء'),
  //                                 ),
  //                                 ElevatedButton(
  //                                   onPressed: () {
  //                                     // هنا يمكنك إرسال السبب إلى الخادم أو تخزينه محليًا
  //                                     Navigator.pop(context); // إغلاق الحوار
  //                                   },
  //                                   child: Text('إرسال'),
  //                                 ),
  //                               ],
  //                             );
  //                           },
  //                         );
  //                       },
  //                       child: Row(
  //                         children: [
  //                           Icon(Icons.close),
  //                           Text('رفض التسليم'),
  //                         ],
  //                       ),
  //                     ),
  //                   ],
  //                 ),
  //               ],
  //             ),
  //           ),
  //         );
  //       },
  //     ),
  //   );
  }
}

