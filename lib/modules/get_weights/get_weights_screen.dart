import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taskk_app/modules/get_weights/cubit/cubit.dart';
import 'package:taskk_app/modules/get_weights/cubit/states.dart';
import 'package:taskk_app/modules/get_weights/weight_component.dart';

class GetWeightsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Builder(builder: (BuildContext context){
      GetWeightsCubit.get(context).getWeights();
      return BlocProvider(
        create: (context) => GetWeightsCubit(),
        child: BlocConsumer<GetWeightsCubit, GetWeightsStates>(
            listener: (context, state) {},
            builder: (context, state) {
              return Scaffold(
                appBar: AppBar(
                  title: Text('Your weights'),
                ),
                body: GetWeightsCubit.get(context).weights.length > 0 ? ListView.separated(
                    itemBuilder: (context,index) =>WeightComponent(GetWeightsCubit.get(context).weights[index]),
                    separatorBuilder: (context,index) => SizedBox(
                      height: 10.0,
                    ),
                    itemCount: GetWeightsCubit.get(context).weights.length) : Center(child: CircularProgressIndicator()),
              );
            }),
      );
    });
  }
}
