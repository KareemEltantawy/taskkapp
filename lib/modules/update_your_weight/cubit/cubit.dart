import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taskk_app/modules/update_your_weight/cubit/states.dart';

import '../../../models/weight_model.dart';

class UpdateYourWeightCubit extends Cubit<UpdateYourWeightStates> {
  UpdateYourWeightCubit() : super(UpdateYourWeightInitialStates());
  static UpdateYourWeightCubit get(context) => BlocProvider.of(context);

  void updateWeight({
    required String weight,
    required String id,
    required String uId,
  }) {
    emit(UpdateYourWeightLoadingrState());
    WeightModel model = WeightModel(
      weight: weight,
      dateTime: DateTime.now().toString(),
      id: id,
      uId: uId,
    );
    FirebaseFirestore.instance
        .collection('weights')
        .doc(id)
        .update(model.toMap())
        .then((value) {
          emit(UpdateYourWeightSuccessState());
    })
        .catchError((error) {
          print(error.toString());
          emit(UpdateYourWeightErrorState());
    });
  }
}
