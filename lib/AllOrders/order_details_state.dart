import 'package:delegate/AllOrders/all_orders_model.dart';

abstract class DetailsOrdersState {}

class OrderDetailInitial extends DetailsOrdersState {}

class OrderDetailLoading extends DetailsOrdersState {}

class OrderDetailLoaded extends DetailsOrdersState {
  final AllOrderModel orderDetails;

  OrderDetailLoaded({required this.orderDetails});
}

class OrderDetailError extends DetailsOrdersState {
  final String message;

  OrderDetailError({required this.message});
}

// Add a new state to hold fetched order details
class OrderDetailsFetched extends DetailsOrdersState {
  final AllOrderModel orderDetails;

  OrderDetailsFetched({required this.orderDetails});
}