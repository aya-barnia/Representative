import 'package:delegate/AllOrders/Allorders.dart';
import 'package:delegate/AllOrders/all_orders_cubit.dart';
import 'package:delegate/Login/Auth.dart';
import 'package:delegate/Login/login_cubit.dart';
import 'package:delegate/Login/login_view.dart';
import 'package:delegate/view/Home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      
      title: 'delegate',
     
      theme: ThemeData(
        // colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home:BlocProvider( create: (context) => LoginCubit(),
      
    child: LoginView(),
    // child: AuthLogin(),
    ) ,
      debugShowCheckedModeBanner: false,
    
    );
  }
}

