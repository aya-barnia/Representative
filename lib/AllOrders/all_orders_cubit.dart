
import 'package:delegate/AllOrders/accept_order_api.dart';
import 'package:delegate/AllOrders/all_orders_api.dart';
import 'package:delegate/AllOrders/all_orders_model.dart';
import 'package:delegate/AllOrders/all_orders_state.dart';
import 'package:delegate/AllOrders/details_order_api.dart';
import 'package:delegate/AllOrders/order_details_cubit.dart';
import 'package:delegate/AllOrders/recieve_order_api.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class OrdersCubit extends Cubit<AllOrdersState>{

OrdersCubit([AllOrderModel? order]) :super(InitialAllOrdersState());



static OrdersCubit get(context) => BlocProvider.of(context);



ApiAllorders apiAllorders = ApiAllorders();
ApiAcceptedOrder ApiAcceptedorders = ApiAcceptedOrder();
ApiRecievedOrder ApiRecievedorders = ApiRecievedOrder();
 ApiDetailsOrder apiDetailsorders = ApiDetailsOrder();



List<AllOrderModel> all = [];
List<AllOrderModel> acc = [];
List<AllOrderModel> rec = [];
// List<AllOrderModel> det = [];



GetAllOrder([AllOrderModel? allOrderModel]) async{
print('first stap class');
emit(LoadingAllOrdersState());

final post = await apiAllorders.getAllorders();
print('come back');

this.all = post.map((e) => AllOrderModel.fromJson(e)).toList();
print(all);

if(all.isNotEmpty){
  print(' i am not empty');

  emit(GetAllOrders(all));
  print('finish here');

}
else{

  emit(GetAllOrdersError(message: 'get post error'));
  print('finish here');


}


}






GetAcceptedOrder() async{
print('first stap accepted');
emit(LoadingAcceptedOrdersState());

final accept = await ApiAcceptedorders.getAcceptorders();

print('come back');

this.acc = accept.map((e) => AllOrderModel.fromJson(e)).toList();
print(acc);

if(acc.isNotEmpty){
  print(' i am not empty');

  emit(GetAcceptedOrders(acc));
  print('finish here');
  print('قيمة acc: $acc');

}
else{

  emit(GetAcceptedOrdersError(message: 'get post error'));
  print('finish hereثثثثثثثثث');


}


}






//////////////////////////
//////////////ارجعيييييييي
GetRecievedOrder() async{
print('first stap recieved');
emit(LoadingRecievedOrdersState());
final recieve = await ApiRecievedorders.getRecieveorders();
print('come back');
this.rec = recieve.map((e) => AllOrderModel.fromJson(e)).toList();
print(rec);
if(rec.isNotEmpty){
  print(' i am not empty');
  emit(GetRecievedOrders(rec));
  print('finish here');
  print('قيمة rec: $rec');
}
else{
  emit(GetRecievedOrdersError(message: 'get post error'));
  print('finish hereثثثثثثثثث');
}
}





}


