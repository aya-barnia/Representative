import 'package:delegate/AllOrders/all_orders_model.dart';

abstract class AllOrdersState{}

class LoadingAllOrdersState extends AllOrdersState{}

class InitialAllOrdersState extends AllOrdersState{}


 class GetAllOrders extends AllOrdersState{

  List<AllOrderModel> all =[];

  GetAllOrders( this.all);


 }


  class GetAllOrdersError extends AllOrdersState{

  late String message;

  GetAllOrdersError({required this.message});


 }







abstract class AcceptedOrdersState{}

class LoadingAcceptedOrdersState extends AllOrdersState{}

class InitialAcceptedOrdersState extends AllOrdersState{}


 class GetAcceptedOrders extends AllOrdersState{

  List<AllOrderModel> acc =[];

  GetAcceptedOrders( this.acc);


 }


  class GetAcceptedOrdersError extends AllOrdersState{

  late String message;

  GetAcceptedOrdersError({required this.message});


 }









abstract class RecievedOrdersState{}

class LoadingRecievedOrdersState extends AllOrdersState{}

class InitialRecievedOrdersState extends AllOrdersState{}


 class GetRecievedOrders extends AllOrdersState{

  List<AllOrderModel> rec =[];

  GetRecievedOrders( this.rec);


 }


  class GetRecievedOrdersError extends AllOrdersState{

  late String message;

  GetRecievedOrdersError({required this.message});


 }






// abstract class DetailsOrdersState {}

// class OrderDetailInitial extends DetailsOrdersState {}

// class OrderDetailLoading extends DetailsOrdersState {}

// class OrderDetailLoaded extends DetailsOrdersState {
//   final AllOrderModel orderDetails;

//   OrderDetailLoaded({required this.orderDetails});
// }

// class OrderDetailError extends DetailsOrdersState {
//   final String message;

//   OrderDetailError({required this.message});
// }

// // Add a new state to hold fetched order details
// class OrderDetailsFetched extends DetailsOrdersState {
//   final AllOrderModel orderDetails;

//   OrderDetailsFetched({required this.orderDetails});
// }