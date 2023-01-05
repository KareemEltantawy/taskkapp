import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taskk_app/modules/weight/cubit/states.dart';

import '../../../models/weight_model.dart';
import '../../../shared/components/constants.dart';

class WeightCubit extends Cubit<WeightStates> {
  WeightCubit() : super(WeightInitialStates());
  static WeightCubit get(context) => BlocProvider.of(context);
  void addWeight({
  required String weight,
  required String dateTime,
  required String wid,

}) {
    emit(WeightLoadingState());
    WeightModel model = WeightModel(
      weight: weight,
      dateTime: dateTime,
      wid:wid ,
      uId: uId,
    );
    FirebaseFirestore.instance
        .collection('weights').doc(wid)
        .set(model.toMap())
        .then((value) {
          emit(WeightSuccessState());

    })
        .catchError((error) {
          print(error.toString());
          emit(WeightErrorState());
    });
  }
}
