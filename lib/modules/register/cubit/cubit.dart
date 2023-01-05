import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taskk_app/modules/register/cubit/states.dart';

import '../../../models/user_model.dart';


class RegisterCubit extends Cubit<RegisterStates> {
  RegisterCubit() : super(RegisterInitialState());

  static RegisterCubit get(context) => BlocProvider.of(context);

  void userRegister({
    required String name,
    required String email,
    required String password,
    required String phone,
  }) {
    emit(RegisterLoadingState());
    FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email,
      password: password,
    ).then((value) {         //we will not emit success state her as we will call function that emit
      userCreate(
        uId: value.user!.uid,
        phone: phone,
        email: email,
        name: name,
      );
    }).catchError((error) {
      print(error.toString());
      emit(RegisterErrorState(error.toString()));
    });
  }

  void userCreate({
    required String name,
    required String email,
    required String phone,
    required String uId,
  }) {
    UserModel model = UserModel(       // go and make social_user_model then write this object
      name: name,
      email: email,
      phone: phone,
      uId: uId,
      );
    FirebaseFirestore.instance
        .collection('users')
        .doc(uId)
        .set(model.toMap())   // we need to put a map in () of set()
        .then((value) {
          emit(CreateUserSuccessState(uId));
    }).catchError((error) {
          print(error.toString());
      emit(CreateUserErrorState());
    });
  }


  bool isPassword = true;

  void changePasswordVisibility() {
    isPassword = !isPassword;
    emit(RegisterChangePasswordVisibilityState());
  }

}