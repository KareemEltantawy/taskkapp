import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taskk_app/modules/weight/cubit/cubit.dart';
import 'package:taskk_app/modules/weight/cubit/states.dart';
import 'package:taskk_app/shared/components/components.dart';

class WeightScreen extends StatelessWidget {
  var weight = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => WeightCubit(),
      child: BlocConsumer<WeightCubit, WeightStates>(
          listener: (context, state) {},
          builder: (context, state) {
            return Scaffold(
              appBar: AppBar(
                title: Text('add weight'),
              ),
              body: Column(
                children: [
                  Text('Do you have new weight'),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.2,
                  ),
                  defaultFormField(
                    prefix: Icons.line_weight_outlined,
                    controller: weight,
                    type: TextInputType.text,
                    validate: (value) {
                      if (value.isEmpty) {
                        return 'please Add your weight her';
                      }
                      return null;
                    },
                    label: 'Add your weight her',
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.1,
                  ),
                  state is! WeightLoadingState ?defaultButton(
                      function: () {
                        WeightCubit.get(context).addWeight(
                            weight: weight.text,
                            dateTime: DateTime.now().toString());
                      },
                      text: 'Save') : Center(child: CircularProgressIndicator())
                ],
              ),
            );
          }),
    );
  }
}
