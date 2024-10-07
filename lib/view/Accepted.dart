import 'package:delegate/AllOrders/Allorders.dart';
import 'package:delegate/AllOrders/all_orders_cubit.dart';
import 'package:delegate/AllOrders/all_orders_model.dart';
import 'package:delegate/AllOrders/all_orders_state.dart';
import 'package:delegate/helper/constant.dart';
import 'package:delegate/view/Recieved.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Accepted_Orders extends StatefulWidget {
  // const Accepted_Orders( {super.key});

  @override
  State<Accepted_Orders> createState() => _Accepted_OrdersState();
}

class _Accepted_OrdersState extends State<Accepted_Orders> {
  List<AllOrderModel> accept = [];

  @override
  void initState() {
    super.initState();

    OrdersCubit.get(context).GetAcceptedOrder();
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
      
    }, builder: (BuildContext context, Object state) {
      if (state is LoadingAcceptedOrdersState) {
        return Scaffold(
          body: Center(
            child: CircularProgressIndicator(
              color: green,
            ),
          ),
          // body: Center(
          //   child: Image(image: AssetImage('assets/images/green_heart.gif')),
          // ),
        );
      }
      if (state is GetAcceptedOrders) {
        this.accept = state.acc;
    print('قيمة acccccccccccccccccccccccccccccccccccccccc: ${state.acc}');
        return Scaffold(
          body: ListView.builder(
            itemCount: accept.length,
            itemBuilder: (context, index) {
              final order = accept[index];
              return Card(
                margin: EdgeInsets.all(20),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Image(
                            image: NetworkImage(
                                accept[index].product_imagepath!)),
                      ),
                      SizedBox(height: 8.0),
                      Text(
                        accept[index].product_name.toString(),
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 8.0),
                      Text(
                          'Seller Address: ${accept[index].seller_address.toString()}'),
                      SizedBox(height: 8.0),
                      Text(
                          'Buyer Address: ${accept[index].address.toString()}'),
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
                            child: Text('استلام'),
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
                                          Navigator.pop(
                                              context); // إغلاق الحوار
                                        },
                                        child: Text('إلغاء'),
                                      ),
                                      ElevatedButton(
                                        onPressed: () {
                                          // هنا يمكنك إرسال السبب إلى الخادم أو تخزينه محليًا
                                          Navigator.pop(
                                              context); // إغلاق الحوار
                                        },
                                        child: Text('إرسال'),
                                      ),
                                    ],
                                  );
                                },
                              );
                            },
                            child: Text('رفض الاستلام'),
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
      else
      //  return Scaffold(
      //     body: ListView.builder(
      //       itemCount: accept.length,
      //       itemBuilder: (context, index) {
      //         final order = accept[index];
      //         return Card(
      //           margin: EdgeInsets.all(20),
      //           child: Padding(
      //             padding: const EdgeInsets.all(16.0),
      //             child: Column(
      //               crossAxisAlignment: CrossAxisAlignment.start,
      //               children: [
      //                 Center(
      //                   child: Image(
      //                       image: NetworkImage(
      //                           order.product_imagepath!)),
      //                 ),
      //                 SizedBox(height: 8.0),
      //                 Text(
      //                   order.product_name.toString(),
      //                   style: TextStyle(
      //                       fontSize: 20, fontWeight: FontWeight.bold),
      //                 ),
      //                 SizedBox(height: 8.0),
      //                 Text(
      //                     'Seller Address: ${order.seller_address.toString()}'),
      //                 SizedBox(height: 8.0),
      //                 Text(
      //                     'Buyer Address: ${order.address.toString()}'),
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
      //                       child: Text('استلام'),
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
      //                                     Navigator.pop(
      //                                         context); // إغلاق الحوار
      //                                   },
      //                                   child: Text('إلغاء'),
      //                                 ),
      //                                 ElevatedButton(
      //                                   onPressed: () {
      //                                     // هنا يمكنك إرسال السبب إلى الخادم أو تخزينه محليًا
      //                                     Navigator.pop(
      //                                         context); // إغلاق الحوار
      //                                   },
      //                                   child: Text('إرسال'),
      //                                 ),
      //                               ],
      //                             );
      //                           },
      //                         );
      //                       },
      //                       child: Text('رفض الاستلام'),
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
      return Scaffold(
        body: Center(
          child: Text('data'),
        ),
      );
    });
  
  }
}
