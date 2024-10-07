
import 'package:delegate/AllOrders/all_orders_model.dart';
import 'package:delegate/Login/login_api.dart';
import 'package:delegate/helper/constant.dart';
import 'package:dio/dio.dart';


class ApiDetailsOrder{

Dio dio = Dio(
  BaseOptions(
    
    baseUrl: baseUrl,
    connectTimeout:  const Duration(seconds: 50),
    receiveTimeout:  const Duration(seconds: 50)
    
    )
  );

   LoginApi api = LoginApi();


Future<AllOrderModel> getOrderDetails(int orderId) async {
    try {
      String token = await LoginApi().getTokenPref();
      Response response = await dio.get( 'api/buying_orders/$orderId',
        options: Options(
          headers: {
            'Accept': 'application/json',
            'Authorization': 'Bearer $token',
          },
        ),
      );

      if (response.statusCode == 200) {
        return AllOrderModel.fromJson(response.data['data']);
      } else {
        throw Exception('Failed to get order details');
      }
    } on DioError catch (e) {
      if (e.response != null) {
        print(e.response);
      } else {
        print(e.message);
      }
      throw Exception('Failed to get order details');
    }
  }


  }