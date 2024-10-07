// import 'package:delegate/Login/login_cubit.dart';
// import 'package:delegate/Login/login_state.dart';
// import 'package:delegate/helper/constant.dart';
// import 'package:delegate/view/Home.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// class Auth_login extends StatefulWidget {
//   const Auth_login({super.key});

//   @override
//   State<Auth_login> createState() => _Auth_loginState();
// }

// class _Auth_loginState extends State<Auth_login> {
//   final _formKey = GlobalKey<FormState>();
//   final _usernameController = TextEditingController();
//   final _passwordController = TextEditingController();

//   @override
//   Widget build(BuildContext context) {

//           return Scaffold(
//             backgroundColor: Colors.grey.shade100,

//             body: Center(
//               child: SingleChildScrollView(
//                 child: Container(
//                   padding: EdgeInsets.all(20.0),
//                   child: Form(
//                     key: _formKey,
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: <Widget>[
//                         Text(
//                           ' أهلاً بك في سوق بسمة',
//                           style: TextStyle(color: purple, fontSize: 30),
//                         ),
//                         SizedBox(
//                           height: 30,
//                         ),
//                         Image(image: AssetImage('assets/images/basma.png')),
//                         SizedBox(
//                           height: 30,
//                         ),
//                         TextFormField(
//                           controller: _usernameController,
//                           decoration: InputDecoration(
//                             labelText: 'اسم المستخدم',
//                             border: OutlineInputBorder(
//                               borderSide: BorderSide(color: blue),
//                             ),
//                             //    focusedBorder: OutlineInputBorder(
//                             //   borderSide: BorderSide(color:blue),
//                             // ),
//                             enabledBorder: OutlineInputBorder(
//                               borderSide: BorderSide(color: purple),
//                             ),
//                           ),
//                           validator: (value) {
//                             if (value == null || value.isEmpty) {
//                               return 'يرجى إدخال اسم المستخدم';
//                             }
//                             return null;
//                           },
//                         ),
//                         SizedBox(height: 30.0),
//                         TextFormField(
//                           controller: _passwordController,
//                           obscureText: true,
//                           decoration: InputDecoration(
//                             labelText: 'كلمة المرور',
//                             border: OutlineInputBorder(
//                               borderSide: BorderSide(color: blue),
//                             ),
//                             //    focusedBorder: OutlineInputBorder(
//                             //   borderSide: BorderSide(color:blue),
//                             // ),
//                             enabledBorder: OutlineInputBorder(
//                               borderSide: BorderSide(color: purple),
//                             ),
//                           ),
//                           validator: (value) {
//                             if (value == null || value.isEmpty) {
//                               return 'يرجى إدخال كلمة المرور';
//                             }
//                             return null;
//                           },
//                         ),
//                         SizedBox(height: 30.0),
//                         ElevatedButton(
//                           onPressed: () {
//                             if (_formKey.currentState!.validate()) {
//                               // Perform login
//                               print('Username: ${_usernameController.text}');
//                               print('Password: ${_passwordController.text}');
//                               Navigator.push(
//                                 context,
//                                 MaterialPageRoute(
//                                     builder: (context) => Home_Page()),
//                               );
//                             }
//                           },
//                           child: Text('تسجيل دخول'),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//         );

//   }
// }

////////////////////////////////////////////////////

// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:delegate/Login/login_cubit.dart';
// import 'package:delegate/Login/login_state.dart';
// import 'package:delegate/helper/constant.dart';
// import 'package:delegate/view/Home.dart';

// class LoginView extends StatefulWidget {
//   const LoginView({super.key});

//   @override
//   State<LoginView> createState() => _LoginViewState();
// }

// class _LoginViewState extends State<LoginView> {
//   final _formKey = GlobalKey<FormState>();
//   final _usernameController = TextEditingController();
//   final _passwordController = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     LoginCubit loginCubit = BlocProvider.of<LoginCubit>(context);

//     return Scaffold(
//       backgroundColor: Colors.grey.shade100,
//       body: Center(
//         child: SingleChildScrollView(
//           child: Container(
//             padding: EdgeInsets.all(20.0),
//             child: Form(
//               key: _formKey,
//               child: BlocBuilder<LoginCubit, LoginState>(
//                 bloc: loginCubit,
//                 builder: (context, state) {
//                   if (state is LoginInitial) {
//                     return Column(
//                       // ... your form elements here ...///////////////////////////////////

//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: <Widget>[
//                         Text(
//                           ' أهلاً بك في سوق بسمة',
//                           style: TextStyle(color: purple, fontSize: 30),
//                         ),
//                         SizedBox(
//                           height: 30,
//                         ),
//                         Image(image: AssetImage('assets/images/basma.png')),
//                         SizedBox(
//                           height: 30,
//                         ),
//                         TextFormField(
//                           controller: _usernameController,
//                           decoration: InputDecoration(
//                             labelText: 'اسم المستخدم',
//                             border: OutlineInputBorder(
//                               borderSide: BorderSide(color: blue),
//                             ),
//                             //    focusedBorder: OutlineInputBorder(
//                             //   borderSide: BorderSide(color:blue),
//                             // ),
//                             enabledBorder: OutlineInputBorder(
//                               borderSide: BorderSide(color: purple),
//                             ),
//                           ),
//                           validator: (value) {
//                             if (value == null || value.isEmpty) {
//                               return 'يرجى إدخال اسم المستخدم';
//                             }
//                             return null;
//                           },
//                         ),
//                         SizedBox(height: 30.0),
//                         TextFormField(
//                           controller: _passwordController,
//                           obscureText: true,
//                           decoration: InputDecoration(
//                             labelText: 'كلمة المرور',
//                             border: OutlineInputBorder(
//                               borderSide: BorderSide(color: blue),
//                             ),
//                             //    focusedBorder: OutlineInputBorder(
//                             //   borderSide: BorderSide(color:blue),
//                             // ),
//                             enabledBorder: OutlineInputBorder(
//                               borderSide: BorderSide(color: purple),
//                             ),
//                           ),
//                           validator: (value) {
//                             if (value == null || value.isEmpty) {
//                               return 'يرجى إدخال كلمة المرور';
//                             }
//                             return null;
//                           },
//                         ),
//                         SizedBox(height: 30.0),
//                         ElevatedButton(
//                           onPressed: () {
//                             if (_formKey.currentState!.validate()) {
//                               // Perform login
//                               // print('Username: ${_usernameController.text}');
//                               // print('Password: ${_passwordController.text}');
//                               // Navigator.push(
//                               //   context,
//                               //   MaterialPageRoute(
//                               //       builder: (context) => Home_Page()),
//                               // );
//                             }
//                           },
//                           child: Text('تسجيل دخول'),
//                         ),
//                       ],
//                     );
//                   } else if (state is LoginLoading) {
//                     return Center(child: CircularProgressIndicator());
//                   } else if (state is LoginLoaded) {
//                     // Navigate to Home page after a delay
//                     Future.delayed(Duration(seconds: 1), () {
//                       Navigator.pushReplacement(
//                         context,
//                         MaterialPageRoute(builder: (context) => Home_Page()),
//                       );
//                     });
//                     return Container(); // Or show a success message
//                   } else if (state is LoginLoadError) {
//                     return Text(state.message, style: TextStyle(color: Colors.red));
//                   } else {
//                     return Text('حدث خطأ غير متوقع');
//                   }
//                 },
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

////////////////////////////////////////////////مربوط بمنطقية
import 'package:delegate/AllOrders/Allorders.dart';
import 'package:delegate/AllOrders/all_orders_cubit.dart';
import 'package:delegate/Login/login_model.dart';
import 'package:delegate/AllOrders/all_orders_state.dart';
import 'package:delegate/view/OrderDetails.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:delegate/Login/login_cubit.dart';
import 'package:delegate/Login/login_state.dart';
import 'package:delegate/helper/constant.dart';
import 'package:delegate/view/Home.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => LoginCubit(),
      child: BlocConsumer<LoginCubit, LoginState>(
          listener: (BuildContext context, state) {
        if (state is LoadingAllOrdersState) {
          print('state load');
        }
        if (state is LoginLoaded) {
          print('loade');

          Navigator.push(
              context,
              MaterialPageRoute(
                // builder: (context) => BlocProvider(
                //     create: (BuildContext context) => OrdersCubit(),
                //     child: Home_Page()),
                builder: (context) => Home_Page(),
              ));
        }
      }, builder: (BuildContext context, Object state) {
        if (state is LoadingAllOrdersState) {
          return Scaffold(
            body: Center(
              child: Text(' loading'),
            ),
          );
        }

        return Scaffold(
          backgroundColor: Colors.grey.shade100,
          body: Center(
            child: SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.all(20.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        ' أهلاً بك في سوق بسمة',
                        style: TextStyle(color: purple, fontSize: 30),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Image(image: AssetImage('assets/images/basma.png')),
                      SizedBox(
                        height: 30,
                      ),
                      TextFormField(
                        controller: _emailController,
                        decoration: InputDecoration(
                          labelText: 'اسم المستخدم',
                          border: OutlineInputBorder(
                            borderSide: BorderSide(color: blue),
                          ),
                          //    focusedBorder: OutlineInputBorder(
                          //   borderSide: BorderSide(color:blue),
                          // ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: purple),
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'يرجى إدخال اسم المستخدم';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 30.0),
                      TextFormField(
                        controller: _passwordController,
                        obscureText: true,
                        decoration: InputDecoration(
                          labelText: 'كلمة المرور',
                          border: OutlineInputBorder(
                            borderSide: BorderSide(color: blue),
                          ),
                          //    focusedBorder: OutlineInputBorder(
                          //   borderSide: BorderSide(color:blue),
                          // ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: purple),
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'يرجى إدخال كلمة المرور';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 30.0),
                      ElevatedButton(
                        onPressed: () {
                          ModelLogin modelLogin = ModelLogin();

                          modelLogin.email = _emailController.text;
                          modelLogin.password = _passwordController.text;

                          LoginCubit.get(context).login(modelLogin);

                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                // builder: (context) => BlocProvider(
                                //     create: (BuildContext context) =>
                                //         OrdersCubit(),
                                //     child: Home_Page()),
                                builder: (context) => Home_Page(),
                              ));
                        },
                        child: Text('تسجيل دخول'),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      }),
    );
  }
}
