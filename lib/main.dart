import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taskk_app/modules/get_weights/get_weights_screen.dart';
import 'package:taskk_app/modules/login/login_screen.dart';
import 'package:taskk_app/shared/components/constants.dart';
import 'modules/weight/weight_screen.dart';
import 'shared/bloc_observer.dart';
import 'shared/network/local/cache_helper.dart';
import 'shared/styles/themes.dart';
import 'package:firebase_core/firebase_core.dart';



void main() async
{
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();  //lAn ba await ala CacheHelper.init() lazem el main ybka async we lAn el main bka async lazwm adef el method...> WidgetsFlutterBinding.ensureInitialized()
  Bloc.observer = MyBlocObserver();
  await Firebase.initializeApp();
  uId = CacheHelper.getData(key: 'uId');
Widget widget;
if(uId!=null){
  widget=WeightScreen();
}else{
  widget=LoginScreen();
}
//  bool? isDark = CacheHelper.getData(key: 'isDark'); // we use the same key we use in saveData method

  runApp(MyApp(widget
//    isDark: isDark,
  ));
}


class MyApp extends StatelessWidget
{
  final Widget widget;
  MyApp(this.widget);
//  bool? isDark;
//  MyApp({this.isDark});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: lightTheme,
//      darkTheme: darkTheme,
//      themeMode: AppCubit.get(context).isDark ? ThemeMode.dark: ThemeMode.light,
      debugShowCheckedModeBanner: false,
      home: widget, // put the class of the first screen
    );
  }
}
