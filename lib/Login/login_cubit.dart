import 'package:bloc/bloc.dart';
import 'package:delegate/Login/login_api.dart';
import 'package:delegate/Login/login_model.dart';

import 'package:delegate/Login/login_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginCubit extends Cubit<LoginState>{


  LoginCubit():super(LoginInitial());

  static LoginCubit get(context)=>BlocProvider.of(context);

  LoginApi api =LoginApi();


  login(ModelLogin model)async{

   print('here bloc');
    emit(LoginLoading());
    print("hi cubit");

    Map<String,dynamic>json=await model.logintojson();
    String response=await api.log(json);
    print('response');
        print(response);

    if (response.contains('child')) {


      emit(LoginLoaded(message: 'Success Login'));
      
    } else {
      emit(LoginLoadError(message: 'Faild Login'));
    }

  }

}

// import 'package:bloc/bloc.dart';
// import 'package:delegate/Login/login_api.dart';
// import 'package:delegate/Login/login_model.dart';
// import 'package:delegate/Login/login_state.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// class LoginCubit extends Cubit<LoginState> {
//   LoginCubit() : super(LoginInitial());

//   static LoginCubit get(context) => BlocProvider.of<LoginCubit>(context);

//   LoginApi api = LoginApi();

//   login(ModelLogin model) async {
//     emit(LoginLoading());

//     try {
//       // تحقق من صحة البيانات المدخلة
//       if (!model.isValid()) {
//         emit(LoginLoadError(message: 'بيانات تسجيل الدخول غير صحيحة'));
//         return;
//       }

//       Map<String, dynamic> json = await model.logintojson();
//       String response = await api.log(json);

//       // تحليل الاستجابة ومعالجة الأخطاء
//       if (response.contains('child')) {
//         // تسجيل دخول ناجح
//         emit(LoginLoaded(message: 'تم تسجيل الدخول بنجاح', token: response));
//       } else if (response.contains('error message')) {
//         emit(LoginLoadError(message: 'فشل تسجيل الدخول: ${response['error message']}'));
//       } else {
//         emit(LoginLoadError(message: 'حدث خطأ غير متوقع'));
//       }
//     } catch (e) {
//       emit(LoginLoadError(message: 'حدث خطأ في الشبكة: $e'));
//     }
//   }
// }