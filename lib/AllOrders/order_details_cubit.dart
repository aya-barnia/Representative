
import 'package:delegate/AllOrders/all_orders_model.dart';
import 'package:delegate/AllOrders/all_orders_state.dart';
import 'package:delegate/AllOrders/details_order_api.dart';
import 'package:delegate/AllOrders/order_details_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// class OrderDetailsCubit extends Cubit<DetailsOrdersState> {
//   // OrderDetailsCubit(AllOrderModel order) : super(OrderDetailInitial());
//     OrderDetailsCubit(AllOrderModel order) : super(OrderDetailInitial());


//   static OrderDetailsCubit get(context) => BlocProvider.of(context);

// ApiDetailsOrder ApiDetailsorders =ApiDetailsOrder();

 
//   List<AllOrderModel> det = [];

//   // Existing GetAllOrder, GetAcceptedOrder, and GetRecievedOrder methods

//   Future<void> getOrderDetails(int orderId, [List<AllOrderModel>? orders]) async {
//     emit(OrderDetailLoading());
//     try {
//       final orderDetails = await ApiDetailsorders.getOrderDetails(orderId);
//       emit(OrderDetailLoaded(orderDetails: orderDetails));
//     } on Exception catch (e) {
//       emit(OrderDetailError(message: e.toString()));
//     }
//   }
// }


class OrderDetailsCubit extends Cubit<DetailsOrdersState> {
  OrderDetailsCubit() : super(OrderDetailInitial());

  static OrderDetailsCubit get(context) => BlocProvider.of(context);

  final ApiDetailsOrder apiDetailsorders = ApiDetailsOrder();

 getOrderDetails(int orderId) async {
  
    emit(OrderDetailLoading());
    try {
      final orderDetails = await apiDetailsorders.getOrderDetails(orderId);
      emit(OrderDetailsFetched(orderDetails: orderDetails));
    } on Exception catch (e) {
      emit(OrderDetailError(message: e.toString()));
    }

  }
}




