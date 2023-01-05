import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taskk_app/modules/get_weights/cubit/cubit.dart';
import 'package:taskk_app/modules/get_weights/cubit/states.dart';
import 'package:taskk_app/modules/login/login_screen.dart';
import 'package:taskk_app/shared/components/components.dart';
import 'package:taskk_app/shared/network/local/cache_helper.dart';

import '../update_your_weight/update_your_weight_screen.dart';

class GetWeightsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) =>GetWeightsCubit(),
      child: Builder(builder: (BuildContext context){
        GetWeightsCubit.get(context).getWeights();
        return BlocConsumer<GetWeightsCubit, GetWeightsStates>(
            listener: (context, state) {},
            builder: (context, state) {
              return Scaffold(
                appBar: AppBar(
                  title: Text('Your weights'),
                ),
                body: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(children: [
                    GetWeightsCubit.get(context).weights.length > 0 ? Expanded(
                      child: ListView.separated(
                          itemBuilder: (context,index) =>buildItem(GetWeightsCubit.get(context).weights[index],context),
                          separatorBuilder: (context,index) => SizedBox(
                            height: 10.0,
                          ),
                          itemCount: GetWeightsCubit.get(context).weights.length),
                    ) : Expanded(child: Center(child: Text('there is no items',style: TextStyle(
                      fontSize: 14.0
                    ),))),
                    SizedBox(height: 20.0,),
                    defaultButton(function: (){
                      CacheHelper.removeData(key: 'uId',).then((value) {
                        navigateAndFinish(context, LoginScreen());
                      });
                    }, text: 'Log out')
                  ],),
                )
              );
            });
      }),
    );
  }
  Widget buildItem(model,context) => InkWell(
    onTap: (){
      navigateTo(context, UpdateWeightsScreen(model));
      print(model.id+model.uId+model.weight);
    },
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Row(
        children: [
          Text(model.weight!),
          Spacer(),
          Icon(Icons.update_disabled_outlined)
        ],
      ),
    ),
  );
}
