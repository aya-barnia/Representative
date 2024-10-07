
import 'package:delegate/Login/login_api.dart';
import 'package:delegate/helper/constant.dart';
import 'package:dio/dio.dart';


class ApiAcceptedOrder{

Dio dio = Dio(
  BaseOptions(
    
    baseUrl: baseUrl,
    connectTimeout:  const Duration(seconds: 50),
    receiveTimeout:  const Duration(seconds: 50)
    
    )
  );

   LoginApi api = LoginApi();

  Future<List<dynamic>> getAcceptorders() async
  {
    try{
      print("first 1 in api accepted");
      String? token = await  api.getTokenPref();
     print(token);
      Response response = await dio.get('api/buying_orders/order/getacceptedOrders',
        options: Options(
            headers: {
              'Accept':'application/json',
              'Authorization':'Bearer $token'
            }
        ),
      );
      print(" second 2");
      if(response.statusCode == 200) {
        print(response.data['data']);
        print("here in response state code >_< recieved");
        return response.data['data'];
      }
      else {
        print("get 4 ");
        return [];
      }
    }on DioError catch(e){
      if(e.response!=null)
        print(e.response);
      else
        print(e.message);
      print("get5");
      return [];
    }
  }


  }