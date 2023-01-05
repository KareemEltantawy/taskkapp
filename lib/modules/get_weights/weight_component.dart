import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:taskk_app/models/weight_model.dart';
import 'package:taskk_app/shared/components/components.dart';

import '../../models/user_model.dart';
import '../update_your_weight/update_your_weight_screen.dart';

class WeightComponent extends StatelessWidget {
  final WeightModel weight;
  WeightComponent(this.weight);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        navigateTo(context, UpdateWeightsScreen(weight));
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: Row(
          children: [
            Text(weight.weight!),
            Spacer(),
            Icon(Icons.update_disabled_outlined)
          ],
        ),
      ),
    );
  }
}
