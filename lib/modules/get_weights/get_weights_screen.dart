import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taskk_app/modules/get_weights/cubit/cubit.dart';
import 'package:taskk_app/modules/get_weights/cubit/states.dart';
import 'package:taskk_app/modules/get_weights/weight_component.dart';
import 'package:taskk_app/modules/login/login_screen.dart';
import 'package:taskk_app/shared/components/components.dart';
import 'package:taskk_app/shared/network/local/cache_helper.dart';

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
                body: Column(children: [
                  GetWeightsCubit.get(context).weights.length > 0 ? Expanded(
                    child: ListView.separated(
                        itemBuilder: (context,index) =>WeightComponent(GetWeightsCubit.get(context).weights[index]),
                        separatorBuilder: (context,index) => SizedBox(
                          height: 10.0,
                        ),
                        itemCount: GetWeightsCubit.get(context).weights.length),
                  ) : Expanded(child: Center(child: Text('there is no items'))),
                  SizedBox(height: 20.0,),
                  defaultButton(function: (){
                    CacheHelper.removeData(key: 'uId',).then((value) {
                      navigateAndFinish(context, LoginScreen());
                    });
                  }, text: 'Log out')
                ],)
              );
            }),
      );
    });
  }
}
