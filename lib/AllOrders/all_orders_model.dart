// import 'dart:io';

// import 'package:dio/dio.dart';

// class AllOrderModel {
//   var id;
//   var user_id;
//   String? name;
//   String? product_name;
//   String? mobile_number;
//   String? address;
//   var category_id;
//   File? image ;
//  String? imagepath;
//   // String image;
//   String? state;
//   String? demand_state;
//   double? price;

//   AllOrderModel({
//      this.id,
//      this.user_id,
//      this.name,
//      this.product_name,
//      this.mobile_number,
//      this.address,
//      this.category_id,
//      this.image,
//      this.state,
//      this.demand_state,
//      this.price,

//   });

// Future<Map<String,dynamic>> allPostsTojson () async {

// return {

// //'id':id,
// //'user_id':user_id,
// //'name':name,
// //'image_profile': await MultipartFile.fromFile(image_profile!.path),
// //'post_category_id': post_category_id,
// //'state':state,
// 'image': await MultipartFile.fromFile(image!.path),
// // 'text':text,
// //'like_count':likeCount,

// };}

//    AllOrderModel.fromJson(Map<String, dynamic> json) {

//       id= json['id'];
//       user_id= json['user_id'];
//       name= json['name'];
//       product_name= json['product_name'];
//       mobile_number= json['mobile_number'];
//       address= json['address'];
//       category_id= json['category_id'];
//       imagepath= json['image'];
//       state= json['state'];
//       demand_state= json['demand_state'];
//       price= json['price'].toDouble(); // تحويل السعر إلى نوع double

//   }

//   Future<Map<String, dynamic> >alltoJson() async {
//     return {
//       'id': id,
//       'user_id': user_id,
//       'name': name,
//       'product_name': product_name,
//       'mobile_number': mobile_number,
//       'address': address,
//       'category_id': category_id,
//       'image': image,
//       'state': state,
//       'demand_state': demand_state,
//       'price': price,

//     };
//   }
// }
///////////////////////////////////////
// import 'dart:io';

// import 'package:dio/dio.dart';

// import '../../helper/constant.dart';

// //String baseUrl = '192.168.0.104:8000';

// class AllOrderModel {
//   var id;
//   var user_id;
//   String? name;
//   String? product_name;
//   String? mobile_number;
//   String? address;
//   var category_id;
//   File? image;
//   String? imagepath;
//   // String image;
//   String? state;
//   String? demand_state;
//   double? price;

//   AllOrderModel({
//     this.id,
//     this.user_id,
//     this.name,
//     this.product_name,
//     this.mobile_number,
//     this.address,
//     this.category_id,
//     this.image,
//     this.state,
//     this.demand_state,
//     this.price,
//   }) {
//     this.imagepath;
//     // this.image_profile_path;
//   }

//   Future<Map<String, dynamic>> AllOrderTojson() async {
//     return {
//       'image': await MultipartFile.fromFile(image!.path),
//       'id': id,
//       'user_id': user_id,
//       'name': name,
//       'product_name': product_name,
//       'mobile_number': mobile_number,
//       'address': address,
//       'category_id': category_id,
//       'state': state,
//       'demand_state': demand_state,
//       'price': price,
//     };
//   }

//   AllOrderModel.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     user_id = json['user_id'];
//     name = json['name'];
//     product_name = json['product_name'];
//     mobile_number = json['mobile_number'];
//     address = json['address'];
//     category_id = json['category_id'];
//     imagepath = json['image'];
//     state = json['state'];
//     demand_state = json['demand_state'];
//     price = json['price'].toDouble(); // تحويل السعر إلى نوع double
//   }
// }

import 'dart:io';
import 'package:dio/dio.dart';
import '../../helper/constant.dart';
class AllOrderModel {
  var id;
  var user_id;
  var product_id;
  String? product_name;
  String? mobile_number;
  String? seller_mobile_number;
  String? address;
  String? seller_address;
  File? product_image;
  String? product_imagepath;
  // String image;
  String? state;

  AllOrderModel({
    this.id,
    this.user_id,
    this.product_name,
    this.mobile_number,
    this.seller_mobile_number,
    this.address,
    this.seller_address,
    this.product_image,
    this.product_imagepath,
    this.state,
  }) {
    this.product_imagepath;
    // this.image_profile_path;
  }

  Future<Map<String, dynamic>> AllOrderTojson() async {
    return {
      'image': await MultipartFile.fromFile(product_image!.path),
      'id': id,
      'user_id': user_id,
      'product_id': product_id,
      'product_name': product_name,
      'mobile_number': mobile_number,
      'seller_mobile_number': seller_mobile_number,
      'address': address,
      'seller_address': seller_address,
      'state': state,
    };
  }

  AllOrderModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    user_id = json['user_id'];
    product_id = json['product_id'];
    product_name = json['product_name'];
    mobile_number = json['mobile_number'];
    seller_mobile_number = json['seller_mobile_number'];
    address = json['address'];
    seller_address = json['seller_address'];
    product_imagepath = json['product_image'];
    state = json['state'];
  }
}
