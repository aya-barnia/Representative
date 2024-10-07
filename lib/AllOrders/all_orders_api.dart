import 'package:delegate/AllOrders/all_orders_model.dart';
import 'package:delegate/Login/login_api.dart';
import 'package:delegate/helper/constant.dart';
import 'package:dio/dio.dart';


class ApiAllorders{

Dio dio = Dio(
  BaseOptions(
    
    baseUrl: baseUrl,
    connectTimeout:  const Duration(seconds: 50),
    receiveTimeout:  const Duration(seconds: 50)
    
    )
  );

   LoginApi api = LoginApi();

  Future<List<dynamic>> getAllorders() async
  {
    try{
      print("first 1 in api classes");
      String? token = await  api.getTokenPref();
     print(token);
      Response response = await dio.get('api/buying_orders/order/pending',
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
        print("here in response state code >_< classes");
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





//  Future<AllOrderModel> getOrderDetails(int orderId) async {
//     try {
//       String token = await LoginApi().getTokenPref();
//       Response response = await dio.get( 'api/buying_orders/$orderId',
//         options: Options(
//           headers: {
//             'Accept': 'application/json',
//             'Authorization': 'Bearer $token',
//           },
//         ),
//       );

//       if (response.statusCode == 200) {
//         return AllOrderModel.fromJson(response.data['data']);
//       } else {
//         throw Exception('Failed to get order details');
//       }
//     } on DioError catch (e) {
//       if (e.response != null) {
//         print(e.response);
//       } else {
//         print(e.message);
//       }
//       throw Exception('Failed to get order details');
//     }
//   }


  // Future<List<dynamic>> getOrderDetails(id) async
  // {
  //   try{
  //     print("first 1 in api subject");
  //     print(id);
  //     String? token = await  api.getTokenPref();
  //     print(token);
  //     Response response = await dio.get('api/buying_orders/$id',
  //       options: Options(
  //           headers: {
  //             'Accept':'application/json',
  //             'Authorization':'Bearer $token'
  //           }
  //       ),
       
  //     );
  //     print(" second 2");

  //     if(response.statusCode == 200) {
  //       print('seccess   ${response.data}' );
  //       print(response.data['data']);
  //       print("here in response state code >_< details");
  //       return response.data['data'];
  //     }
  //     else {
  //       print("get 4 ");
  //       return [];
  //     }
  //   }on DioError catch(e){
  //     if(e.response!=null)
  //       print(e.response);
  //     else
  //       print(e.message);
  //     print("get5");
  //     return [];
  //   }
  // }



  }