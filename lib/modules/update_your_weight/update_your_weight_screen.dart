import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taskk_app/models/weight_model.dart';
import 'package:taskk_app/modules/get_weights/cubit/cubit.dart';
import 'package:taskk_app/modules/get_weights/cubit/states.dart';
import 'package:taskk_app/modules/get_weights/weight_component.dart';
import 'package:taskk_app/modules/weight/cubit/cubit.dart';
import 'package:taskk_app/modules/weight/cubit/states.dart';
import 'package:taskk_app/shared/components/components.dart';

class UpdateWeightsScreen extends StatelessWidget {
  final WeightModel weight;
  UpdateWeightsScreen(this.weight);

  var updatedweight = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetWeightsCubit(),
      child: BlocConsumer<GetWeightsCubit, GetWeightsStates>(
          listener: (context, state) {},
          builder: (context, state) {
            updatedweight.text = weight.weight!;
            return Scaffold(
              appBar: AppBar(
                title: Text('Your weights'),
              ),
              body: Column(children: [
                TextFormField(
                  controller: updatedweight ,
                  keyboardType: TextInputType.text,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'please Add your weight her';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.line_weight_outlined),
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 30,),
                defaultButton(function: (){

                }, text: 'Update')
              ],),
            );
          }),
    );
  }
}
