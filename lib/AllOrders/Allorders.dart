////////////////////////////////////////////
///
///
///
///

// import 'package:delegate/AllOrders/all_orders_cubit.dart';
// import 'package:delegate/AllOrders/all_orders_model.dart';
// import 'package:delegate/AllOrders/all_orders_state.dart';
// import 'package:delegate/AllOrders/order_details_cubit.dart';
// import 'package:delegate/helper/constant.dart';
// import 'package:delegate/view/Accepted.dart';
// import 'package:delegate/view/OrderDetails.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// class All_Orders extends StatefulWidget {
//   @override
//   State<All_Orders> createState() => _All_OrdersState();
// }

// class _All_OrdersState extends State<All_Orders> {
//   List<AllOrderModel> orders = [];

//   @override
//   void initState() {
//     super.initState();

//     OrdersCubit.get(context).GetAllOrder();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return BlocConsumer<OrdersCubit, AllOrdersState>(
//         listener: (BuildContext context, state) {

//       if (state is OrderDetailsFetched) {
//         Navigator.push(
//             context,
//             MaterialPageRoute(
//                 builder: (BuildContext context) => Order_Details()));
//       }
//     }, builder: (BuildContext context, Object state) {
//       if (state is LoadingAllOrdersState) {
//         return Scaffold(
//           body: Center(
//             child: CircularProgressIndicator(
//               color: purple,
//             ),
//           ),
//           // body: Center(
//           //   child: Image(image: AssetImage('assets/images/green_heart.gif')),
//           // ),
//         );
//       }
//       if (state is GetAllOrders) {
//         this.orders = state.all;

//         return Scaffold(
//           body: ListView.builder(
//             itemCount: orders.length,
//             itemBuilder: (context, index) {
//               final order = orders[index];
//               return GestureDetector(
//                 //                onTap: () {
//                 //   Navigator.push(
//                 //     context,
//                 //     MaterialPageRoute(
//                 //       builder: (context) => Order_Details(orderId: orders[index].id),
//                 //     ),
//                 //   );
//                 // },

//                 // onTap: () {
//                 //   Navigator.push(
//                 //     context,
//                 //     MaterialPageRoute(
//                 //       builder: (context) => Order_Details(),
//                 //     ),
//                 //   );
//                 // },
//                 onTap: () {
//                   // Access the OrderDetailsCubit and call getOrderDetails
//                   context.read<OrderDetailsCubit>().getOrderDetails(order.id);
//                 },

//                 child: Card(
//                   margin: EdgeInsets.all(20),
//                   child: Padding(
//                     padding: const EdgeInsets.all(16.0),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         // Center(child: Image.asset(order['productImage']!)),
//                         Center(
//                           child: Image(
//                               image: NetworkImage(
//                                   orders[index].product_imagepath!)),
//                         ),
//                         SizedBox(height: 8.0),
//                         Text(
//                           orders[index].product_name.toString(),
//                           style: TextStyle(
//                               fontSize: 20, fontWeight: FontWeight.bold),
//                         ),
//                         SizedBox(height: 8.0),
//                         Text(
//                             'Seller Address: ${orders[index].seller_address.toString()}'),
//                         SizedBox(height: 8.0),
//                         Text(
//                             'Buyer Address: ${orders[index].address.toString()}'),
//                       ],
//                     ),
//                   ),
//                 ),
//               );
//             },
//           ),
//         );
//       }
//       return Scaffold(
//         body: Center(
//           child: Text('لا يوجد طلبات'),
//         ),
//       );
//     });
//   }
// }

import 'package:delegate/AllOrders/all_orders_cubit.dart';
import 'package:delegate/AllOrders/all_orders_model.dart';
import 'package:delegate/AllOrders/all_orders_state.dart';
import 'package:delegate/AllOrders/order_details_cubit.dart';
import 'package:delegate/helper/constant.dart';
import 'package:delegate/view/Accepted.dart';
import 'package:delegate/view/OrderDetails.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class All_Orders extends StatefulWidget {
  @override
  State<All_Orders> createState() => _All_OrdersState();
}

class _All_OrdersState extends State<All_Orders> {
  List<AllOrderModel> orders = [];

  @override
  void initState() {
    super.initState();

    OrdersCubit.get(context).GetAllOrder();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => OrderDetailsCubit(),
      child: BlocConsumer<OrdersCubit, AllOrdersState>(
          listener: (BuildContext context, state) {
        // if (state is OrderDetailsFetched) {
        //   Navigator.push(
        //       context,
        //       MaterialPageRoute(
        //           builder: (BuildContext context) => Order_Details()));
        // }
      }, builder: (BuildContext context, Object state) {
        if (state is LoadingAllOrdersState) {
          return Scaffold(
            body: Center(
              child: CircularProgressIndicator(
                color: purple,
              ),
            ),
            // body: Center(
            //   child: Image(image: AssetImage('assets/images/green_heart.gif')),
            // ),
          );
        }
        if (state is GetAllOrders) {
          this.orders = state.all;
      
          return Scaffold(
            body: ListView.builder(
              itemCount: orders.length,
              itemBuilder: (context, index) {
                final order = orders[index];
                return GestureDetector(
                  //     onTap: () {
      
                  //          AllOrderModel allordermodel = AllOrderModel();
                  //          OrderDetailsCubit.get(context).getOrderDetails(allordermodel as int);
      
                  //   // OrderDetailsCubit.get(context).getOrderDetails( order.id);
      
                  //  Navigator.push(
                  //         context,
                  //         MaterialPageRoute(
                  //           builder: (context) => Order_Details(order.id ),
                  //         ),
                  //       );
      
                  //     },
                  onTap: () {
                    final orderId = order.id; // تأكد من أن order.id من نوع int
                    OrderDetailsCubit.get(context).getOrderDetails(orderId);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Order_Details(orderId),
                      ),
                    );
                  },
                  child: Card(
                    margin: EdgeInsets.all(20),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Center(child: Image.asset(order['productImage']!)),
                          Center(
                            child: Image(
                                image: NetworkImage(
                                    orders[index].product_imagepath!)),
                          ),
                          SizedBox(height: 8.0),
                          Text(
                            orders[index].product_name.toString(),
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 8.0),
                          Text(
                              'Seller Address: ${orders[index].seller_address.toString()}'),
                          SizedBox(height: 8.0),
                          Text(
                              'Buyer Address: ${orders[index].address.toString()}'),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          );
        }
        return Scaffold(
          body: Center(
            child: Text('حدث خطأ غير متوقع'),
          ),
        );
      }),
    );
  }
}













// import 'package:delegate/AcceptedOrders/accepted_orders_state.dart';
// import 'package:delegate/AllOrders/all_orders_cubit.dart';
// import 'package:delegate/AllOrders/all_orders_model.dart';
// import 'package:delegate/AllOrders/all_orders_state.dart';
// import 'package:delegate/view/Accepted.dart';
// import 'package:delegate/view/OrderDetails.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// class All_Orders extends StatefulWidget {
//   const All_Orders({super.key});

//   @override
//   State<All_Orders> createState() => _All_OrdersState();
// }

// // final List<Map<String, String>> orders = [
// //   {
// //     'productImage': 'assets/images/2.jpeg',
// //     'productName': 'تلفاز',
// //     'productLocation': 'مزة',
// //     'buyerAddress': 'كفرسوسة',
// //   },
// //   {
// //     'productImage': 'assets/images/1.png',
// //     'productName': 'مكواة',
// //     'productLocation': 'شارع بغداد',
// //     'buyerAddress': 'مزة',
// //   },
// //   {
// //     'productImage': 'assets/images/3.jpg',
// //     'productName': 'قميص رجالي',
// //     'productLocation': 'كفرسوسة',
// //     'buyerAddress': 'الميدان',
// //   },
// //   {
// //     'productImage': 'assets/images/pencil.png',
// //     'productName': 'قلم',
// //     'productLocation': 'باب توما',
// //     'buyerAddress': 'الطلياني',
// //   },
// //   // يمكنك إضافة المزيد من الطلبات هنا بنفس الطريقة
// // ];



// class _All_OrdersState extends State<All_Orders> {
//   List<AllOrderModel> all_orders = [];

//   @override
//   void initState() {
//     super.initState();

//     OrdersCubit.get(context).GetAllOrder();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return BlocConsumer<OrdersCubit, AllOrdersState>(
//         listener: (BuildContext context, state) {
//       if (state is GetAcceptedOrders) {
//         Navigator.push(
//             context,
//             MaterialPageRoute(
//                 builder: (BuildContext context) => Accepted_Orders()));
//       }
//     }, builder: (BuildContext context, Object state) {
//       if (state is LoadingAllOrdersState) {
//         return Scaffold(
//           // body: Center(child: Text('Loading'),),
//           body: Center(child: Text('loading')),
//         );
//       }
//       if (state is GetAllOrders) {
//         this.all_orders = state.all;
//         //////////////////////
//         return Scaffold(
//           body: ListView.builder(
//             itemCount: all_orders.length,
//             itemBuilder: (context, index) {
//               // final order = orders[index];
//               return GestureDetector(
//                 onTap: () {
//                   // Navigate to OrderDetails screen
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                       builder: (context) =>
//                            Order_Details(), // Replace OrderDetails with your actual screen
//                     ),
//                   );
//                 },
//                 child: Card(
//                   margin: EdgeInsets.all(20),
//                   child: Padding(
//                     padding: const EdgeInsets.all(16.0),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         // Center(child: Image.asset(order['productImage']!)),
//                         SizedBox(height: 8.0),
//                         Text(
//                           // all_orders['productName']!,
//                           all_orders[index].name.toString(),
//                           style: TextStyle(
//                               fontSize: 20, fontWeight: FontWeight.bold),
//                         ),
//                         SizedBox(height: 8.0),
//                         Text(
//                             'Seller Address: ${all_orders[index].address.toString()}'),
//                         SizedBox(height: 8.0),
//                         Text(
//                             'Buyer Address: ${all_orders[index].address.toString()}'),
//                       ],
//                     ),
//                   ),
//                 ),
//               );
//             },
//           ),
//         );
//       }
//     });
//   }
// }




// import 'package:delegate/AcceptedOrders/accepted_orders_state.dart';
// import 'package:delegate/AllOrders/all_orders_cubit.dart';
// import 'package:delegate/AllOrders/all_orders_model.dart';
// import 'package:delegate/AllOrders/all_orders_state.dart';
// import 'package:delegate/view/Accepted.dart';
// import 'package:delegate/view/OrderDetails.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// class All_Orders extends StatefulWidget {
//   const All_Orders({super.key});

//   @override
//   State<All_Orders> createState() => _All_OrdersState();
// }

// class _All_OrdersState extends State<All_Orders> {
//   List<AllOrderModel> all_orders = [];

//   @override
//   void initState() {
//     super.initState();

//     OrdersCubit.get(context).GetAllOrder();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return BlocConsumer<OrdersCubit, AllOrdersState>(
//       listener: (BuildContext context, AllOrdersState state) {
//         if (state is GetAcceptedOrders) {
//           Navigator.push(
//             context,
//             MaterialPageRoute(builder: (BuildContext context) => Accepted_Orders()),
//           );
//         }
//       },
//       builder: (BuildContext context, AllOrdersState state) {
//         if (state is LoadingAllOrdersState) {
//           return Scaffold(
//             body: Center(child: CircularProgressIndicator()),
//           );
//         } else if (state is GetAllOrders) {
//           all_orders = state.all;
//           return Scaffold(
//             body: ListView.builder(
//               itemCount: all_orders.length,
//               itemBuilder: (context, index) {
//                 final order = all_orders[index];
//                 return GestureDetector(
//                   onTap: () {
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                         builder: (context) => Order_Details(order: order),
//                       ),
//                     );
//                   },
//                   child: Card(
//                     margin: EdgeInsets.all(20),
//                     // ... بقية تصميم الكارد
//                   ),
//                 );
//               },
//             ),
//           );
//         } else if (state is GetAllOrdersError) {
//           return Scaffold(
//             body: Center(child: Text('حدث خطأ في جلب الطلبات: ${state.message}')),
//           );
//         } else {
//           return Scaffold(
//             body: Center(child: Text('حالة غير متوقعة')),
//           );
//         }
//       },
//     );
//   }
// }



