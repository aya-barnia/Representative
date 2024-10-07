// import 'package:delegate/AllOrders/all_orders_model.dart';
// import 'package:delegate/helper/constant.dart';
// import 'package:flutter/material.dart';

// class Order_Details extends StatefulWidget {
//   // const Order_Details({super.key});

//   @override
//   State<Order_Details> createState() => _Order_DetailsState();
// }

// class _Order_DetailsState extends State<Order_Details> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(backgroundColor: purple),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             children: [
//               Center(
//                 child: Image.asset('assets/images/1.png'),
//               ),
//               SizedBox(height: 16),
//               Text(
//                 'مكواة',
//                 style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//               ),
//               Divider(thickness: 2,color: green,),
//               SizedBox(height: 30,),
//               Row(
//                 children: [
//                   Column(
//                     children: [
//                       SizedBox(height: 8),
//                       Text(
//                         'معلومات البائع',
//                         style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),
//                       ),
//                       SizedBox(height: 4),
//                       Text('الاسم: وائل رمضان'),
//                       Text('العنوان: شارع بغداد'),
//                       Text('رقم الهاتف: 0976548243'),
//                     ],
//                   ),
//                   // SizedBox(width: 30),
//                   Expanded(child: SizedBox(width: 50,)),
//                   Column(
//                     children: [
//                       SizedBox(height: 8),
//                       Text(
//                         'معلومات المشتري',
//                         style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),
//                       ),
//                       SizedBox(height: 4),
//                       Text('الاسم:  فتحي الزين'),
//                       Text('العنوان: مزة شيخ سعد'),
//                       Text('رقم الهاتف: 0973999343'),
//                     ],
//                   ),
//                 ],
//               ),
//               SizedBox(height: 30,),
//               ElevatedButton(onPressed: (){}, child: Text('قبول طلب الشراء'))
//             ],

//           ),
//         ),
//       ),
//     );
//   }
// }

// ////////////////////////////////////////

// import 'package:delegate/AllOrders/all_orders_cubit.dart';
// import 'package:delegate/AllOrders/all_orders_model.dart';
// import 'package:delegate/AllOrders/all_orders_state.dart';
// import 'package:delegate/AllOrders/order_details_cubit.dart';
// import 'package:delegate/AllOrders/order_details_state.dart';
// import 'package:delegate/helper/constant.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// class Order_Details extends StatefulWidget {
//    final int orderId;

//   Order_Details(this.orderId);

//   @override
//   State<Order_Details> createState() => _Order_DetailsState();
// }

// class _Order_DetailsState extends State<Order_Details> {
//   @override
//   Widget build(BuildContext context) {
//     // final orderId = ModalRoute.of(context)!.settings.arguments as int;
//         final orderId = ModalRoute.of(context)!.settings.arguments as int;

//     return BlocProvider(
//       create: (context) => OrderDetailsCubit(),
//       child: Scaffold(
//         appBar: AppBar(backgroundColor: purple),
//         body: BlocBuilder<OrderDetailsCubit, DetailsOrdersState>(
//           builder: (context, state) {
//             // if (state is OrderDetailInitial || state is OrderDetailLoading) {
//             //   return Center(child: CircularProgressIndicator());
//             // }
//             if (state is OrderDetailLoading) {
//               return Center(child: CircularProgressIndicator());
//             }
//             //  else if ( state is OrderDetailInitial) {
//             //   return
//             // }
//             else if (state is OrderDetailInitial) {
//               final orderDetailsCubit = context.read<OrderDetailsCubit>();
//               orderDetailsCubit.getOrderDetails(orderId); // افترض أن orderId تم تمريره من الصفحة السابقة
//             }
//             else if (state is OrderDetailsFetched) {
//               final orderDetails = state.orderDetails;
//               return SingleChildScrollView(
//                 child: Padding(
//                   padding: const EdgeInsets.all(16.0),
//                   child: Column(
//                     children: [
//                       // عرض صورة المنتج إذا كانت متاحة
//                       if (orderDetails.product_image != null)
//                         Image.network(
//                           orderDetails.product_imagepath!,
//                           fit: BoxFit.cover,
//                         ),
//                       SizedBox(height: 16),
//                       Text(
//                         orderDetails.product_name ?? 'لا يوجد اسم للمنتج',
//                         style: TextStyle(
//                             fontSize: 24, fontWeight: FontWeight.bold),
//                       ),
//                       Divider(thickness: 2, color: green),
//                       SizedBox(height: 30),
//                       Row(
//                         children: [
//                           Column(
//                             children: [
//                               SizedBox(height: 8),
//                               Text(
//                                 'معلومات البائع',
//                                 style: TextStyle(
//                                     fontWeight: FontWeight.bold, fontSize: 20),
//                               ),
//                               SizedBox(height: 4),
//                               Text(
//                                   'الاسم: ${orderDetails.product_name ?? 'غير متوفر'}'),
//                               Text(
//                                   'العنوان: ${orderDetails.seller_address ?? 'غير متوفر'}'),
//                               Text(
//                                   'رقم الهاتف: ${orderDetails.seller_mobile_number ?? 'غير متوفر'}'),
//                             ],
//                           ),
//                           Expanded(child: SizedBox(width: 50)),
//                           Column(
//                             children: [
//                               SizedBox(height: 8),
//                               Text(
//                                 'معلومات المشتري',
//                                 style: TextStyle(
//                                     fontWeight: FontWeight.bold, fontSize: 20),
//                               ),
//                               SizedBox(height: 4),
//                               Text(
//                                   'الاسم: ${orderDetails.product_name ?? 'غير متوفر'}'),
//                               Text(
//                                   'العنوان: ${orderDetails.address ?? 'غير متوفر'}'),
//                               Text(
//                                   'رقم الهاتف: ${orderDetails.mobile_number ?? 'غير متوفر'}'),
//                             ],
//                           ),
//                         ],
//                       ),
//                       SizedBox(height: 30),
//                       // ... باقي عناصر الواجهة
//                     ],
//                   ),
//                 ),
//               );
//             } else if (state is OrderDetailError) {
//               return Center(
//                 child: Text(
//                   'حدث خطأ: ${state.message}',
//                   style: TextStyle(color: Colors.red),
//                 ),
//               );
//             } else {
//               return Center(
//                 child: Text('حالة غير متوقعة'),
//               );
//             }
//              return Scaffold(
//         body: Center(
//           child: Text('حدث خطأ غير متوقع'),
//         ),
//       );
//           }

//         ),
//       ),
//     );
//   }
// }

// import 'package:delegate/helper/constant.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:delegate/AllOrders/order_details_cubit.dart';
// import 'package:delegate/AllOrders/order_details_state.dart';

// class Order_Details extends StatelessWidget {
//   final int orderId;

//   Order_Details(this.orderId);

//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (context) => OrderDetailsCubit()..getOrderDetails(orderId),
//       child: Scaffold(
//         appBar: AppBar(backgroundColor: purple),
//         body: BlocBuilder<OrderDetailsCubit, DetailsOrdersState>(
//           builder: (context, state) {
//             if (state is OrderDetailLoading) {
//               return Center(child: CircularProgressIndicator());
//             } else if (state is OrderDetailsFetched) {
//               final orderDetails = state.orderDetails;
//               return SingleChildScrollView(
//                 child: Padding(
//                   padding: const EdgeInsets.all(16.0),
//                   child: Column(
//                     children: [
//                       // عرض صورة المنتج إذا كانت متاحة
//                       if (orderDetails.product_image != null)
//                         Image.network(
//                           orderDetails.product_imagepath!,
//                           fit: BoxFit.cover,
//                         ),
//                       SizedBox(height: 16),
//                       Text(
//                         orderDetails.product_name ?? 'لا يوجد اسم للمنتج',
//                         style: TextStyle(
//                           fontSize: 24, fontWeight: FontWeight.bold),
//                       ),
//                       // ... باقي عناصر الواجهة (تفاصيل البائع، المشتري، الخ)
//                       // مثلاً:
//                       Text('سعر المنتج: ${orderDetails.product_id}'),
//                       Text('تاريخ الطلب: ${orderDetails.seller_mobile_number}'),
//                       // ...
//                     ],
//                   ),
//                 ),
//               );
//             } else if (state is OrderDetailError) {
//               return Center(
//                 child: Text('حدث خطأ: ${state.message}'),
//               );
//             } else {
//               return Center(
//                 child: Text('حالة غير متوقعة'),
//               );
//             }
//           },
//         ),
//       ),
//     );
//   }
// }

//////////////////////////////////////////////

// import 'package:delegate/AllOrders/all_orders_cubit.dart';
// import 'package:delegate/AllOrders/all_orders_model.dart';
// import 'package:delegate/AllOrders/all_orders_state.dart';
// import 'package:delegate/AllOrders/order_details_cubit.dart';
// import 'package:delegate/helper/constant.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// class Order_Details extends StatefulWidget {
//   final int orderId; // Pass the order ID to the widget

//   Order_Details({required this.orderId});

//   @override
//   State<Order_Details> createState() => _Order_DetailsState();
// }

// class _Order_DetailsState extends State<Order_Details> {
//   @override
//   void initState() {
//     super.initState();
//     OrderDetailsCubit.get(context).getOrderDetails(widget.orderId);
//   }

//   @override
//   Widget build(BuildContext context) {

//     return BlocProvider(
//       create: (BuildContext context) => OrderDetailsCubit(),
//       child:BlocConsumer<OrderDetailsCubit, AllOrdersState>(
//         listener: (BuildContext context, state) {
//         if (state is OrderDetailLoading) {
//           print('state load');
//         }
//         if (state is OrderDetailLoaded) {
//           print('loade');

//           // Navigator.push(
//           //     context,
//           //     MaterialPageRoute(
//           //       // builder: (context) => BlocProvider(
//           //       //     create: (BuildContext context) => OrdersCubit(),
//           //       //     child: Home_Page()),
//           //       builder: (context) => Home_Page(),
//           //     ));
//         }

//       },
//        builder: (BuildContext context, Object state){

//        return Scaffold(
//         appBar: AppBar(backgroundColor: purple),
//         body: BlocConsumer<OrderDetailsCubit, DetailsOrdersState>(
//           builder: (context, state) {
//             if (state is OrderDetailLoading) {
//               return Center(child: CircularProgressIndicator());
//             } else if (state is OrderDetailLoaded) {
//               final order = state.orderDetails;
//               return SingleChildScrollView(
//                 child: Padding(
//                   padding: const EdgeInsets.all(16.0),
//                   child: Column(
//                     children: [
//                       Center(
//                         child: Image.network(order.product_imagepath!),
//                       ),
//                       SizedBox(height: 16),
//                       Text(
//                         order.product_name!,
//                         style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//                       ),
//                       Divider(thickness: 2, color: green),
//                       SizedBox(height: 30),
//                       Row(
//                         children: [
//                           Column(
//                             children: [
//                               SizedBox(height: 8),
//                               Text(
//                                 'Seller Information',
//                                 style: TextStyle(
//                                     fontWeight: FontWeight.bold, fontSize: 20),
//                               ),
//                               SizedBox(height: 4),
//                               Text('Name: هاني سالم'),
//                               Text('Address: ${order.seller_address}'),
//                               Text('Phone: ${order.seller_mobile_number}'),
//                             ],
//                           ),
//                           Expanded(child: SizedBox()),
//                           Column(
//                             children: [
//                               SizedBox(height: 8),
//                               Text(
//                                 'Buyer Information',
//                                 style: TextStyle(
//                                     fontWeight: FontWeight.bold, fontSize: 20),
//                               ),
//                               SizedBox(height: 4),
//                               Text('Name:وائل وائل '),
//                               Text('Address: ${order.address}'),
//                               Text('Phone: ${order.mobile_number}'),
//                             ],
//                           ),
//                         ],
//                       ),
//                       SizedBox(height: 30),
//                       ElevatedButton(
//                         onPressed: () {
//                           // Call a method in OrderDetailsCubit to accept the order
//                           OrderDetailsCubit.get(context).getOrderDetails(order.id);
//                         },
//                         child: Text('Accept Order'),
//                       ),
//                     ],
//                   ),
//                 ),
//               );
//             } else {
//               return Center(child: Text('Error loading order details'));
//             }
//           },
//           listener: (context, state) {
//             if (state is OrderDetailError) {
//               // Handle the error
//               ScaffoldMessenger.of(context).showSnackBar(
//                 SnackBar(
//                   content: Text(state.message),
//                 ),
//               );
//             }
//           },
//         ),
//       );
//   }),

//     );
//   }
// }
////////////////////////////////////////

// import 'package:delegate/AllOrders/all_orders_cubit.dart';
// import 'package:delegate/AllOrders/all_orders_state.dart';
// import 'package:delegate/AllOrders/order_details_cubit.dart';
// import 'package:delegate/helper/constant.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:delegate/AllOrders/all_orders_model.dart';
// // Assuming you have a cubit for handling order details

// class OrderDetails extends StatefulWidget {
//   final AllOrderModel order;

//    OrderDetails({super.key, required this.order});

//   @override
//   State<OrderDetails> createState() => _OrderDetailsState();
// }

// class _OrderDetailsState extends State<OrderDetails> {

//   // @override
//   // void initState() {
//   //   super.initState();

//   //   // OrderDetailsCubit.get(context).getOrderDetails();
//   //   // OrderDetailsCubit.get(context).getOrderDetails(orderId);
//   // }

//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (context) => OrdersCubit(widget.order),
//       child: Scaffold(
//         // ... باقي عناصر الواجهة
//         body: BlocConsumer<OrderDetailsCubit, DetailsOrdersState>(
//           builder: (context, state) {
//             if (state is OrderDetailLoading) {
//               return CircularProgressIndicator();
//             } else if (state is OrderDetailLoaded) {
//               return Scaffold(
//                 appBar: AppBar(backgroundColor: purple),
//                 body: SingleChildScrollView(
//                   child: Padding(
//                     padding: const EdgeInsets.all(16.0),
//                     child: Column(
//                       children: [
//                         Center(
//                           child: Image.asset('assets/images/1.png'),
//                         ),
//                         SizedBox(height: 16),
//                         Text(
//                            widget.order.product_name as String,
//                           style: TextStyle(
//                               fontSize: 24, fontWeight: FontWeight.bold),
//                         ),
//                         Divider(
//                           thickness: 2,
//                           color: green,
//                         ),
//                         SizedBox(
//                           height: 30,
//                         ),
//                         Row(
//                           children: [
//                             Column(
//                               children: [
//                                 SizedBox(height: 8),
//                                 Text(
//                                   'معلومات البائع',
//                                   style: TextStyle(
//                                       fontWeight: FontWeight.bold,
//                                       fontSize: 20),
//                                 ),
//                                 SizedBox(height: 4),
//                                 Text('الاسم: وائل رمضان'),
//                                 Text(widget.order.seller_address as String),
//                                 Text('رقم الهاتف: 0976548243'),
//                               ],
//                             ),
//                             // SizedBox(width: 30),
//                             Expanded(
//                                 child: SizedBox(
//                               width: 50,
//                             )),
//                             Column(
//                               children: [
//                                 SizedBox(height: 8),
//                                 Text(
//                                   'معلومات المشتري',
//                                   style: TextStyle(
//                                       fontWeight: FontWeight.bold,
//                                       fontSize: 20),
//                                 ),
//                                 SizedBox(height: 4),
//                                 Text('الاسم:  فتحي الزين'),
//                                 Text(widget.order.address as String),
//                                 Text('رقم الهاتف: 0973999343'),
//                               ],
//                             ),
//                           ],
//                         ),
//                         SizedBox(
//                           height: 30,
//                         ),
//                         ElevatedButton(
//                             onPressed: () {}, child: Text('قبول طلب الشراء'))
//                       ],
//                     ),
//                   ),
//                 ),
//               );
//             } else if (state is OrderDetailError) {
//               return Text('حدث خطأ');
//             } else {
//               return Container(
//                 color: yellow,
//               );
//             }
//           }, listener: (BuildContext context, DetailsOrdersState state) {
//             print('vvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvv');
//            },
//         ),
//       ),
//     );
//   }
// }

// import 'package:delegate/AllOrders/all_orders_cubit.dart';
// import 'package:delegate/AllOrders/all_orders_model.dart';
// import 'package:delegate/AllOrders/all_orders_state.dart';
// import 'package:delegate/Login/login_cubit.dart';
// import 'package:delegate/OrderDetails/order_details_state.dart';
// import 'package:delegate/helper/constant.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// // class OrderDetails {
// //    String id;

// //   OrderDetails({
// //     required this.id,
// //   });
// // }

// class Order_Details extends StatefulWidget {

//  final AllOrderModel order; // الآن يتوقع أن يتلقى كائنًا من نوع AllOrderModel

//    Order_Details({required this.order});

//  List<AllOrderModel> det =[];

//   Order_Detail(details){

//   det = details;

//  }

//   @override
//   State<Order_Details> createState() => _Order_DetailsState();
// }

// class _Order_DetailsState extends State<Order_Details> {

//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create:(BuildContext context  )=>OrdersCubit(),
//       child: BlocConsumer<OrdersCubit,AllOrdersState>(
//         listener: (BuildContext context , Object state){
//           if(state is GetAllDetails){
//               print('i am in listen');
//             // print(state.det.toString());
//             // print(state.id.toString());

//           }
//         },
//         builder: (BuildContext context,Object state) {
//             if (state is OrderDetailsLoading) {
//           return Scaffold(
//             body: Center(
//               child: CircularProgressIndicator(
//                 color: green,
//               ),
//             ),
//             // body: Center(
//             //   child: Image(image: AssetImage('assets/images/green_heart.gif')),
//             // ),
//           );
//         }
//           return
//            Scaffold(
//       appBar: AppBar(backgroundColor: purple),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             children: [
//               Center(
//                 child: Image.asset('assets/images/1.png'),
//               ),
//               SizedBox(height: 16),
//               Text(
//                 'مكواة',
//                 style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//               ),
//               Divider(thickness: 2,color: green,),
//               SizedBox(height: 30,),
//               Row(
//                 children: [
//                   Column(
//                     children: [
//                       SizedBox(height: 8),
//                       Text(
//                         'معلومات البائع',
//                         style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),
//                       ),
//                       SizedBox(height: 4),
//                       Text('الاسم: وائل رمضان'),
//                       Text('العنوان: شارع بغداد'),
//                       Text('رقم الهاتف: 0976548243'),
//                     ],
//                   ),
//                   // SizedBox(width: 30),
//                   Expanded(child: SizedBox(width: 50,)),
//                   Column(
//                     children: [
//                       SizedBox(height: 8),
//                       Text(
//                         'معلومات المشتري',
//                         style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),
//                       ),
//                       SizedBox(height: 4),
//                       Text('الاسم:  فتحي الزين'),
//                       Text('العنوان: مزة شيخ سعد'),
//                       Text('رقم الهاتف: 0973999343'),
//                     ],
//                   ),
//                 ],
//               ),
//               SizedBox(height: 30,),
//               ElevatedButton(onPressed: (){}, child: Text('قبول طلب الشراء'))
//             ],

//           ),
//         ),
//       ),
//     );
//         },
//       )
//        );
//     // Scaffold(
//     //   appBar: AppBar(backgroundColor: purple),
//     //   body: SingleChildScrollView(
//     //     child: Padding(
//     //       padding: const EdgeInsets.all(16.0),
//     //       child: Column(
//     //         children: [
//     //           Center(
//     //             child: Image.asset('assets/images/1.png'),
//     //           ),
//     //           SizedBox(height: 16),
//     //           Text(
//     //             'مكواة',
//     //             style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//     //           ),
//     //           Divider(thickness: 2,color: green,),
//     //           SizedBox(height: 30,),
//     //           Row(
//     //             children: [
//     //               Column(
//     //                 children: [
//     //                   SizedBox(height: 8),
//     //                   Text(
//     //                     'معلومات البائع',
//     //                     style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),
//     //                   ),
//     //                   SizedBox(height: 4),
//     //                   Text('الاسم: وائل رمضان'),
//     //                   Text('العنوان: شارع بغداد'),
//     //                   Text('رقم الهاتف: 0976548243'),
//     //                 ],
//     //               ),
//     //               // SizedBox(width: 30),
//     //               Expanded(child: SizedBox(width: 50,)),
//     //               Column(
//     //                 children: [
//     //                   SizedBox(height: 8),
//     //                   Text(
//     //                     'معلومات المشتري',
//     //                     style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),
//     //                   ),
//     //                   SizedBox(height: 4),
//     //                   Text('الاسم:  فتحي الزين'),
//     //                   Text('العنوان: مزة شيخ سعد'),
//     //                   Text('رقم الهاتف: 0973999343'),
//     //                 ],
//     //               ),
//     //             ],
//     //           ),
//     //           SizedBox(height: 30,),
//     //           ElevatedButton(onPressed: (){}, child: Text('قبول طلب الشراء'))
//     //         ],

//     //       ),
//     //     ),
//     //   ),
//     // );
//   }
// }

import 'package:delegate/AllOrders/Allorders.dart';
import 'package:delegate/helper/constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:delegate/AllOrders/order_details_cubit.dart';
import 'package:delegate/AllOrders/order_details_state.dart';

class Order_Details extends StatelessWidget {
  final int orderId;

  Order_Details(this.orderId);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => OrderDetailsCubit()..getOrderDetails(orderId),
      child: Scaffold(
        appBar: AppBar(backgroundColor: purple),
        body: BlocBuilder<OrderDetailsCubit, DetailsOrdersState>(
          builder: (context, state) {
            if (state is OrderDetailLoading) {
              return Center(child: CircularProgressIndicator());
            } else if (state is OrderDetailsFetched) {
              final orderDetails = state.orderDetails;
              // return SingleChildScrollView(
              //   child: Padding(
              //     padding: const EdgeInsets.all(16.0),
              //     child: Column(
              //       children: [
              //         // عرض صورة المنتج إذا كانت متاحة
              //         if (orderDetails.product_image != null)
              //           Image.network(
              //             orderDetails.product_imagepath!,
              //             fit: BoxFit.cover,
              //           ),
              //         SizedBox(height: 16),
              //         Text(
              //           orderDetails.product_name ?? 'لا يوجد اسم للمنتج',
              //           style: TextStyle(
              //             fontSize: 24, fontWeight: FontWeight.bold),
              //         ),
              //         // ... باقي عناصر الواجهة (تفاصيل البائع، المشتري، الخ)
              //         // مثلاً:
              //         Text('سعر المنتج: ${orderDetails.address}'),
              //         Text('تاريخ الطلب: ${orderDetails.mobile_number}'),
              //         // ...
              //       ],
              //     ),
              //   ),
              // );
              return SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      Center(
                        child: Image(
                            image:
                                NetworkImage(orderDetails.product_imagepath!)),
                      ),
                      SizedBox(height: 16),
                      Text(
                        'المنتج: ${orderDetails.product_name}',
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                      Divider(
                        thickness: 2,
                        color: green,
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Row(
                        children: [
                          Directionality(
                            textDirection: TextDirection.rtl,
                            child: Column(
                              children: [
                                SizedBox(height: 8),
                                Text(
                                  'معلومات البائع',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                ),
                                SizedBox(height: 4),
                                // Text('الاسم: وائل رمضان'),
                                Text(
                                    'العنوان : ${orderDetails.seller_address}'),
                                Text(
                                    'رقم البائع : ${orderDetails.seller_mobile_number}'),
                              ],
                            ),
                          ),
                          // SizedBox(width: 30),
                          Expanded(
                              child: SizedBox(
                            width: 50,
                          )),
                          Directionality(
                            textDirection: TextDirection.rtl,
                            child: Column(
                              children: [
                                SizedBox(height: 8),
                                Text(
                                  'معلومات المشتري',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                ),
                                SizedBox(height: 4),
                                // Text('الاسم: ${orderDetails.}'),
                                Text('العنوان : ${orderDetails.address}'),
                                Text(
                                    'رقم المشتري : ${orderDetails.mobile_number}'),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      ElevatedButton(
                          onPressed: () {
                            
                          },
                          child: Text('قبول طلب الشراء'))
                    ],
                  ),
                ),
              );
            } else if (state is OrderDetailError) {
              return Center(
                child: Text('حدث خطأ: ${state.message}'),
              );
            } else {
              return Center(
                child: Text('حالة غير متوقعة'),
              );
            }
          },
        ),
      ),
    );
  }
}
