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

}) {
    emit(WeightLoadingState());
    var id =  DateTime.now().toString();
    WeightModel model = WeightModel(
      weight: weight,
      dateTime: id,
      id:DateTime.now().toString() ,
      uId: uId,
    );
    FirebaseFirestore.instance
        .collection('weights').doc(id)
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
