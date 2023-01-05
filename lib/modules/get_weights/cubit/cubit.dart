import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taskk_app/models/weight_model.dart';
import 'package:taskk_app/modules/get_weights/cubit/states.dart';
import 'package:taskk_app/shared/components/constants.dart';

class GetWeightsCubit extends Cubit<GetWeightsStates> {
  GetWeightsCubit() : super(GetWeightsInitialStates());
  static GetWeightsCubit get(context) => BlocProvider.of(context);

  List<WeightModel> weights = [];
  void getWeights() {
    FirebaseFirestore.instance
        .collection('weights')
        .orderBy('dateTime')
        .snapshots()
        .listen((event) {
      event.docs.forEach((element) {
        if(element.data()['uId']==uId){
          weights.add(
            WeightModel.fromJson(element.data()),
          );
        }
        emit(GetWeightsSuccessState());
      });
    });
  }
}
